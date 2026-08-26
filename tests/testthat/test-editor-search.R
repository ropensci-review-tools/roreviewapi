local_search_db <- function (env = parent.frame ()) {
    db <- withr::local_tempfile (fileext = ".sqlite", .local_envir = env)
    withr::local_envvar (ROREVIEWAPI_EMAIL_DB = db, .local_envir = env)
}

local_notify_cache <- function (email = "editor@example.com", env = parent.frame ()) {
    dir <- withr::local_tempdir (.local_envir = env)
    cache <- file.path (dir, "notify_email.txt")
    writeLines (email, cache)
    db <- file.path (dir, "searches.sqlite")
    withr::local_envvar (
        ROREVIEWAPI_EMAIL_DB = db,
        ROREVIEWAPI_BASE_URL = "http://localhost",
        .local_envir = env
    )
}

email_fetcher <- function (base_id, stats = FALSE) {
    c ("a@example.com", "b@example.com")
}

# Tests use repo = "ropensci/software-review" (not
# "ropenscilabs/statistical-software-review") so the temporary live-testing
# override in send_search() does not fire. Once that block is removed, this
# comment can also be removed.

stats_checker_false <- function (repo, issue_id) FALSE

gmail_send_batch_mock <- function (emails, links, subject, repo, issue_id) {
    lapply (seq_along (emails), function (i) list (id = paste0 ("mock-", i)))
}

gmail_send_mock <- function (to, subject, html_body) {
    list (id = "mock-notify")
}

test_that ("generate_email_token returns unique 64-char hex strings", {
    t1 <- generate_email_token ()
    t2 <- generate_email_token ()
    expect_type (t1, "character")
    expect_equal (nchar (t1), 64L)
    expect_false (identical (t1, t2))
})

test_that ("email_db_init creates both tables", {
    local_search_db ()
    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))
    tbls <- DBI::dbListTables (con)
    expect_true (all (c ("recipients", "searches") %in% tbls))
})

test_that ("send_search inserts correct rows", {
    local_notify_cache ()

    result <- send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false,
        sender        = gmail_send_batch_mock
    )
    expect_equal (result$search_id, 1L)
    expect_equal (result$sent, 2L)

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    searches <- DBI::dbReadTable (con, "searches")
    recipients <- DBI::dbReadTable (con, "recipients")

    expect_equal (nrow (searches), 1L)
    expect_equal (searches$issue_ref, "ropensci/software-review/issues/123")
    expect_equal (searches$active, 1L)
    expect_equal (nrow (recipients), 2L)
    expect_equal (nchar (recipients$token [[1]]), 64L)
    expect_true (all (is.na (recipients$clicked_at)))
})

test_that ("send_search rejects invalid inputs", {
    local_notify_cache ()
    expect_error (send_search ("", "ropensci/software-review", 123L,
        fetcher = email_fetcher, stats_checker = stats_checker_false
    ))
    expect_error (send_search ("https://github.com/org/pkg", "", 123L,
        fetcher = email_fetcher, stats_checker = stats_checker_false
    ))
    bad_fetcher <- function (base_id, stats) character (0)
    expect_error (
        send_search ("https://github.com/org/pkg", "ropensci/software-review", 123L,
            fetcher = bad_fetcher, stats_checker = stats_checker_false
        ),
        regexp = "no valid email"
    )
    withr::local_envvar (ROREVIEWAPI_BASE_URL = "ftp://bad")
    expect_error (send_search ("https://github.com/org/pkg", "ropensci/software-review", 123L,
        fetcher = email_fetcher, stats_checker = stats_checker_false
    ))
})

test_that ("list_searches returns correct totals and click counts", {
    local_notify_cache ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false,
        sender        = gmail_send_batch_mock
    )

    lst <- list_searches ()
    expect_equal (nrow (lst), 1L)
    expect_equal (lst$issue_ref, "ropensci/software-review/issues/123")
    expect_equal (lst$total, 2L)
    expect_equal (lst$clicked, 0L)
    expect_equal (lst$active, 1L)
})

test_that ("handle_click state machine: not found / valid / already used / expired", {
    local_notify_cache ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false,
        sender        = gmail_send_batch_mock
    )

    con <- email_db_init ()
    tokens <- DBI::dbGetQuery (con, "SELECT token FROM recipients ORDER BY id")$token
    DBI::dbDisconnect (con)

    # Unknown token
    r <- handle_click ("not-a-real-token")
    expect_equal (r$status, 404L)

    # Valid first click
    r <- handle_click (tokens [[1]], sender = gmail_send_mock)
    expect_equal (r$status, 200L)
    expect_false (grepl ("expired|already", r$body, ignore.case = TRUE))

    # Second click on same token — already used
    r <- handle_click (tokens [[1]], sender = gmail_send_mock)
    expect_equal (r$status, 200L)
    expect_true (grepl ("already", r$body, ignore.case = TRUE))

    # list_searches now shows clicked = 1
    lst <- list_searches ()
    expect_equal (lst$clicked, 1L)

    # Expired: manually set active = 0 without deleting, to exercise that branch
    con <- email_db_init ()
    DBI::dbExecute (con, "UPDATE searches SET active = 0")
    DBI::dbDisconnect (con)

    r <- handle_click (tokens [[2]], sender = gmail_send_mock)
    expect_equal (r$status, 200L)
    expect_true (grepl ("expired", r$body, ignore.case = TRUE))
})

test_that ("deactivate_search deletes all associated rows", {
    local_notify_cache ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false,
        sender        = gmail_send_batch_mock
    )

    deactivate_search ("ropensci/software-review", 123L)

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    expect_equal (nrow (DBI::dbReadTable (con, "searches")), 0L)
    expect_equal (nrow (DBI::dbReadTable (con, "recipients")), 0L)
})

test_that ("deactivate_search errors on unknown issue", {
    local_search_db ()
    expect_error (deactivate_search ("ropensci/software-review", 999L), regexp = "No search found")
})

test_that ("deactivate_stale_searches removes only searches older than max_age_days", {
    local_search_db ()

    con <- email_db_init ()
    old_created_at <- strftime (
        Sys.time () - 200 * 86400, "%Y-%m-%dT%H:%M:%SZ",
        tz = "UTC"
    )
    recent_created_at <- strftime (Sys.time (), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
    DBI::dbExecute (
        con,
        "INSERT INTO searches (created_at, issue_ref, notify_email) VALUES (?, ?, ?)",
        params = list (old_created_at, "org/repo/issues/1", "editor@example.com")
    )
    DBI::dbExecute (
        con,
        "INSERT INTO searches (created_at, issue_ref, notify_email) VALUES (?, ?, ?)",
        params = list (recent_created_at, "org/repo/issues/2", "editor@example.com")
    )
    old_id <- DBI::dbGetQuery (
        con, "SELECT id FROM searches WHERE issue_ref = 'org/repo/issues/1'"
    )$id
    DBI::dbExecute (
        con,
        "INSERT INTO recipients (search_id, email, token) VALUES (?, ?, ?)",
        params = list (old_id, "a@example.com", generate_email_token ())
    )
    DBI::dbDisconnect (con)

    n <- deactivate_stale_searches (max_age_days = 100L)
    expect_equal (n, 1L)

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))
    remaining <- DBI::dbReadTable (con, "searches")
    expect_equal (remaining$issue_ref, "org/repo/issues/2")
    expect_equal (nrow (DBI::dbReadTable (con, "recipients")), 0L)
})

test_that ("notify_email_read returns address from cache", {
    local_notify_cache ("eic@example.com")
    expect_equal (notify_email_read (), "eic@example.com")
})

test_that ("notify_email_read stops when cache is absent", {
    local_search_db ()
    expect_error (notify_email_read (), regexp = "Notify email cache not found")
})

test_that ("notify_email_refresh writes address to cache", {
    local_search_db ()
    fetcher <- function (base_id) "fetched@example.com"
    notify_email_refresh (fetcher = fetcher)
    expect_equal (notify_email_read (), "fetched@example.com")
})

test_that ("notify_email_refresh preserves existing cache on error", {
    local_notify_cache ("existing@example.com")
    bad_fetcher <- function (base_id) stop ("AirTable down")
    expect_message (notify_email_refresh (fetcher = bad_fetcher), "AirTable fetch failed")
    expect_equal (notify_email_read (), "existing@example.com")
})
