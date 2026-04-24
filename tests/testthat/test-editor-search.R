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

postmark_mock <- function (env = parent.frame ()) {
    httr2::local_mocked_responses (function (req) {
        httr2::response (200L, body = charToRaw ('{"ErrorCode":0,"Message":"OK"}'))
    }, env = env)
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
    postmark_mock ()

    result <- send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false
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
    postmark_mock ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false
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
    postmark_mock ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false
    )

    con <- email_db_init ()
    tokens <- DBI::dbGetQuery (con, "SELECT token FROM recipients ORDER BY id")$token
    DBI::dbDisconnect (con)

    # Unknown token
    r <- handle_click ("not-a-real-token")
    expect_equal (r$status, 404L)

    # Valid first click
    r <- handle_click (tokens [[1]])
    expect_equal (r$status, 200L)
    expect_false (grepl ("expired|already", r$body, ignore.case = TRUE))

    # Second click on same token — already used
    r <- handle_click (tokens [[1]])
    expect_equal (r$status, 200L)
    expect_true (grepl ("already", r$body, ignore.case = TRUE))

    # list_searches now shows clicked = 1
    lst <- list_searches ()
    expect_equal (lst$clicked, 1L)

    # Expired: manually set active = 0 without deleting, to exercise that branch
    con <- email_db_init ()
    DBI::dbExecute (con, "UPDATE searches SET active = 0")
    DBI::dbDisconnect (con)

    r <- handle_click (tokens [[2]])
    expect_equal (r$status, 200L)
    expect_true (grepl ("expired", r$body, ignore.case = TRUE))
})

test_that ("deactivate_search deletes all associated rows", {
    local_notify_cache ()
    postmark_mock ()

    send_search (
        repourl       = "https://github.com/org/pkg",
        repo          = "ropensci/software-review",
        issue_id      = 123L,
        fetcher       = email_fetcher,
        stats_checker = stats_checker_false
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
