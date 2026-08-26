# editor-search.R

#' Resolve path to the email search SQLite database
#'
#' Reads \code{ROREVIEWAPI_EMAIL_DB} env var; falls back to a path within the
#' user data directory if unset.
#'
#' @return Absolute path as a character string.
#' @noRd
email_db_path <- function () {
    p <- Sys.getenv ("ROREVIEWAPI_EMAIL_DB")
    if (!nzchar (p)) {
        p <- file.path (
            rappdirs::user_data_dir ("roreviewapi"),
            "searches.sqlite"
        )
    }
    p
}

#' Open a connection to the email search database
#'
#' Creates the \code{searches} and \code{recipients} tables if they do not
#' already exist.
#'
#' @return A \pkg{DBI} connection object.
#' @noRd
email_db_init <- function () {

    path <- email_db_path ()
    dir.create (dirname (path), recursive = TRUE, showWarnings = FALSE)

    con <- DBI::dbConnect (RSQLite::SQLite (), path)

    DBI::dbExecute (con, "
        CREATE TABLE IF NOT EXISTS searches (
            id           INTEGER PRIMARY KEY AUTOINCREMENT,
            created_at   TEXT NOT NULL,
            issue_ref    TEXT NOT NULL UNIQUE,
            notify_email TEXT NOT NULL,
            active       INTEGER NOT NULL DEFAULT 1
        )
    ")

    DBI::dbExecute (con, "
        CREATE TABLE IF NOT EXISTS recipients (
            id          INTEGER PRIMARY KEY AUTOINCREMENT,
            search_id   INTEGER NOT NULL REFERENCES searches(id),
            email       TEXT NOT NULL,
            token       TEXT NOT NULL UNIQUE,
            clicked_at  TEXT
        )
    ")

    con
}

#' Generate a cryptographically random 64-character hex token
#'
#' @return Single character string of 64 hex characters.
#' @noRd
generate_email_token <- function () {
    paste0 (as.character (openssl::rand_bytes (32L)), collapse = "")
}

#' Fetch editor email addresses from AirTable and GitHub
#'
#' Queries the AirTable reviewers-prod table and filters to members of the
#' GitHub \code{ropensci/editors} (or \code{ropensci/stats-editors}) team.
#'
#' @param airtable_base_id AirTable base ID (from \code{AIRTABLE_BASE_ID} env
#' var).
#' @param stats If \code{TRUE}, fetch stats editors; otherwise fetch regular
#' editors.
#' @return Character vector of email addresses.
#' @noRd
get_editor_emails <- function (airtable_base_id, stats = FALSE) {

    rev_prod <- airtabler::airtable (
        base = airtable_base_id, table = "reviewers-prod"
    )
    fields <- list ("github", "name", "email")
    eds <- rev_prod$`reviewers-prod`$select_all (fields = fields)

    team <- ifelse (stats, "stats-editors", "editors")
    q <- paste0 ("{
        organization(login:\"ropensci\") {
            team(slug: \"", team, "\") {
                members(first: 100, membership: IMMEDIATE) {
                    nodes {
                        login
                    }
                }
            }
        }
    }")
    dat <- gh::gh_gql (query = q)
    nodes <- dat$data$organization$team$members$nodes
    team_gh <- vapply (nodes, function (n) n$login, character (1L))

    index <- which (tolower (eds$github) %in% tolower (team_gh))
    eds <- eds [index, unlist (fields)]
    index <- which (!is.na (eds$email) & !duplicated (eds))
    eds$email [index]
}

#' @noRd
is_valid_email <- function (x) {
    grepl ("^[^@[:space:]]+@[^@[:space:]]+\\.[^@[:space:]]+$", trimws (x))
}

#' @noRd
is_valid_base_url <- function (x) {
    grepl ("^https://", x) || grepl ("^http://(localhost|127\\.0\\.0\\.1)", x)
}

#' Fetch the current editor-in-chief email address from AirTable
#'
#' @param airtable_base_id AirTable base ID (from \code{AIRTABLE_BASE_ID} env
#' var).
#' @return Single email address as a character string.
#' @noRd
eic_email_address <- function (airtable_base_id) {

    eic_table <- airtabler::airtable (
        base = airtable_base_id, table = "editor-in-chief-rotation"
    )
    eic <- eic_table$`editor-in-chief-rotation`$select_all ()
    eic$period_start <- as.Date (eic$period_start)
    eic$period_end <- as.Date (eic$period_end)
    eic <- eic [order (eic$period_start), ]
    i <- which (eic$period_start < Sys.Date () & eic$period_end > Sys.Date ())
    eic$acting_eic_email [[i]]
}

#' Path to the cached notify email address file
#'
#' Stored alongside the SQLite database on the mounted volume.
#'
#' @return Absolute path as a character string.
#' @noRd
notify_email_cache_path <- function () {
    file.path (dirname (email_db_path ()), "notify_email.txt")
}

#' Read the cached notify email address
#'
#' @return Email address as a character string.
#' @noRd
notify_email_read <- function () {
    path <- notify_email_cache_path ()
    if (!file.exists (path)) {
        stop (
            "Notify email cache not found at '", path, "'. ",
            "Ensure serve_api() has completed its initial AirTable refresh."
        )
    }
    trimws (readLines (path, warn = FALSE))
}

#' Fetch the current EiC email from AirTable and write to cache
#'
#' On failure, logs the error and preserves any existing cached value.
#'
#' @param fetcher Function that takes the AirTable base ID and returns an email
#'   address. Defaults to \code{eic_email_address}; override in tests.
#' @return The fetched email address, or \code{NULL} on failure, invisibly.
#' @noRd
notify_email_refresh <- function (fetcher = eic_email_address) {

    base_id <- Sys.getenv ("AIRTABLE_BASE_ID")
    email <- tryCatch (
        fetcher (base_id),
        error = function (e) {
            message ("AirTable fetch failed: ", e$message)
            NULL
        }
    )
    if (!is.null (email) && nzchar (email)) {
        cache_path <- notify_email_cache_path ()
        dir.create (
            dirname (cache_path),
            recursive = TRUE,
            showWarnings = FALSE
        )
        writeLines (email, cache_path)
    }
    invisible (email)
}

#' Authorize gmailr from cached OAuth credentials
#'
#' Configures the OAuth client and authorizes using a previously cached
#' refresh token (see \code{google-cloud-console.md}). \code{scopes} must
#' exactly match those used when the cached token was first generated, or
#' gmailr will attempt an interactive re-authorization, which is not possible
#' on a headless server.
#'
#' @return The \pkg{gmailr} token, as returned by \code{gmailr::gm_auth},
#' invisibly.
#' @noRd
gmail_auth <- function () {
    gmailr::gm_auth_configure (path = Sys.getenv ("GMAIL_OAUTH_CLIENT_SECRET"))
    invisible (gmailr::gm_auth (
        email = Sys.getenv ("GMAIL_AUTH_EMAIL"),
        scopes = c ("gmail.modify", "gmail.settings_basic"),
        cache = Sys.getenv ("GMAIL_TOKEN_CACHE")
    ))
}

#' Send a single email via the Gmail API
#'
#' @param to Recipient email address.
#' @param subject Email subject line.
#' @param html_body HTML body of the email.
#' @return The \pkg{gmailr} send response, invisibly.
#' @noRd
gmail_send <- function (to, subject, html_body) {

    gmail_auth ()

    msg <- gmailr::gm_mime () |>
        gmailr::gm_from (Sys.getenv ("GMAIL_SENDER")) |>
        gmailr::gm_to (to) |>
        gmailr::gm_subject (subject) |>
        gmailr::gm_html_body (html_body)

    invisible (gmailr::gm_send_message (msg))
}

#' Fetch package DESCRIPTION data from a submission issue body
#'
#' Parses the GitHub issue body for the fenced DESCRIPTION file block and
#' extracts the package name, authors, and description text.
#'
#' @param repo GitHub review repository in \code{org/repo} format.
#' @param issue_num Integer issue number in the review repository.
#' @return Named list with \code{package}, \code{auts}, and \code{desc_text},
#' or \code{NULL} if the DESCRIPTION block could not be found or parsed.
#' @noRd
get_desc_data <- function (repo, issue_num) {

    org <- dirname (repo)
    repo <- basename (repo)

    q <- paste0 ("{
        repository(owner:\"", org, "\", name:\"", repo, "\") {
            issue(number:", issue_num, ") {
                body
            }
        }
    }")
    dat <- gh::gh_gql (query = q)
    dat <- tryCatch (
        strsplit (dat$data$repository$issue$body, "\\n") [[1]],
        error = function (e) NULL
    )
    if (is.null (dat)) {
        return (dat)
    }
    desc_start <- grep ("Paste the full DESCRIPTION file", dat, fixed = TRUE)
    if (length (desc_start) < 1) {
        return (NULL)
    }
    delims <- grep ("^```", dat)
    if (length (delims) < 2) {
        return (NULL)
    }
    delims <- delims [which (delims > desc_start)] [1:2]
    if (length (delims) < 2 || diff (delims) < 2) {
        return (NULL)
    }

    desc_text <- dat [seq (delims [1] + 1L, delims [2] - 1L)]
    f <- tempfile ()
    writeLines (desc_text, f)
    desc <- tryCatch (
        data.frame (read.dcf (f)),
        error = function (e) NULL
    )
    if (is.null (desc)) {
        return (NULL)
    }

    list (
        package = desc$Package,
        auts = tryCatch (
            eval (parse (text = desc$Authors.R)),
            error = function (e) NULL
        ),
        desc_text = desc$Description
    )
}

#' Send a batch of emails via the Gmail API
#'
#' The Gmail API has no equivalent of Postmark's \code{/email/batch}
#' endpoint for distinct personalised messages, so each recipient is sent
#' individually, with a short pause between sends to stay under Gmail's
#' per-second send-rate quota.
#'
#' @param emails Character vector of recipient addresses.
#' @param links Character vector of personalised click links, parallel to
#' \code{emails}.
#' @param subject Email subject line.
#' @param repo GitHub review repository in \code{org/repo} format.
#' @param issue_id Integer issue number in the review repository.
#' @return List of \pkg{gmailr} send responses, one per recipient, invisibly.
#' @noRd
gmail_send_batch <- function (emails, links, subject, repo, issue_id) {

    issue_url <- paste0 ("https://github.com/", repo, "/issues/", issue_id)

    desc_dat <- tryCatch (
        get_desc_data (repo, issue_id),
        error = function (e) NULL
    )
    pkg_info <- ""
    if (!is.null (desc_dat)) {
        auts_txt <- tryCatch (
            paste (format (desc_dat$auts), collapse = ", "),
            error = function (e) ""
        )
        pkg_info <- paste0 (
            "<p><strong>Package:</strong> ", desc_dat$package, "<br>",
            "<strong>Authors:</strong> ", auts_txt, "<br>",
            "<strong>Description:</strong> ", desc_dat$desc_text, "</p>"
        )
    }

    resps <- lapply (seq_along (emails), function (i) {
        html_body <- paste0 (
            "<p>You have been invited to volunteer as an editor for an ",
            "rOpenSci software submission: ",
            "<a href=\"", issue_url, "\">", issue_url, "</a></p>",
            pkg_info,
            "<p>Please click the link below to express your interest. ",
            "Clicking only expresses your potential interest; you won't ",
            "be assigned until the Editor-in-Chief has confirmed with you.</p>",
            "<p><a href=\"", links [[i]], "\">Click here to respond</a></p>"
        )
        resp <- gmail_send (emails [[i]], subject, html_body)
        Sys.sleep (0.1)
        resp
    })

    invisible (resps)
}

#' Send a batch of editor search emails
#'
#' Fetches current editor email addresses via \code{get_editor_emails()},
#' inserts a new search record and one recipient row per address into the
#' database, then dispatches emails via the Gmail API.  The notify address is read
#' from the AirTable cache written by the internal 'notify_email_refresh'
#' function.  The base URL for click links is read from the
#' \code{ROREVIEWAPI_BASE_URL} environment variable.  The stats/standard
#' distinction is determined by calling \code{issue_is_stats()} on the supplied
#' \code{repo} and \code{issue_id}.
#'
#' @param repourl URL of the package repository; included in the outgoing
#' emails.
#' @param repo GitHub review repository in \code{org/repo} format.
#' @param issue_id Integer issue number in the review repository.
#' @param subject Subject line for the outgoing emails.
#' @param fetcher Function used to fetch editor emails; injectable for testing.
#'   Must accept \code{(airtable_base_id, stats)} and return a character vector.
#' @param stats_checker Function used to determine submission type; injectable
#'   for testing.  Must accept \code{(repo, issue_id)} and return a logical.
#' @return Named list with \code{search_id} (integer) and \code{sent} (integer).
#' @family email
#' @export
send_search <- function (repourl, repo, issue_id,
                         subject = "Seeking editors for rOpenSci software submission",
                         fetcher = NULL,
                         stats_checker = roreviewapi::issue_is_stats) {

    get_editor_emails <-
        utils::getFromNamespace ("get_editor_emails", "roreviewapi")
    is_valid_base_url <-
        utils::getFromNamespace ("is_valid_base_url", "roreviewapi")
    is_valid_email <- utils::getFromNamespace ("is_valid_email", "roreviewapi")
    notify_email_read <-
        utils::getFromNamespace ("notify_email_read", "roreviewapi")
    get_editor_emails <-
        utils::getFromNamespace ("get_editor_emails", "roreviewapi")
    email_db_init <- utils::getFromNamespace ("email_db_init", "roreviewapi")
    email_db_path <- utils::getFromNamespace ("email_db_path", "roreviewapi")
    generate_email_token <-
        utils::getFromNamespace ("generate_email_token", "roreviewapi")
    gmail_send_batch <-
        utils::getFromNamespace ("gmail_send_batch", "roreviewapi")

    if (is.null (fetcher)) fetcher <- get_editor_emails

    if (length (repourl) != 1L || !nzchar (repourl)) {
        stop ("'repourl' must be a single non-empty string")
    }
    if (length (repo) != 1L || !nzchar (repo)) {
        stop ("'repo' must be a single non-empty string")
    }
    issue_id <- as.integer (issue_id) [[1L]]

    base_url <- Sys.getenv ("ROREVIEWAPI_BASE_URL")
    if (!is_valid_base_url (base_url)) {
        stop (
            "ROREVIEWAPI_BASE_URL must be set and start",
            " with https:// or http://localhost"
        )
    }

    issue_ref <- paste0 (repo, "/issues/", issue_id)
    message (
        "[send_search] starting: issue_ref=", issue_ref,
        " base_url=", base_url
    )

    stats <- stats_checker (repo, issue_id)
    message ("[send_search] stats=", stats, "; fetching editor emails")

    emails <- fetcher (Sys.getenv ("AIRTABLE_BASE_ID"), stats = stats)
    message ("[send_search] fetched ", length (emails), " email(s)")

    emails <- emails [which (is_valid_email (emails))]
    if (length (emails) == 0L) {
        stop ("fetcher returned no valid email addresses")
    }
    notify_address <- notify_email_read ()
    message ("[send_search] notify_address=", notify_address)

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))
    message ("[send_search] DB initialised at ", email_db_path ())

    existing <- DBI::dbGetQuery (
        con,
        "SELECT id FROM searches WHERE issue_ref = ?",
        params = list (issue_ref)
    )
    if (nrow (existing) > 0L) {
        stop (
            "A search for '", issue_ref, "' already exists ",
            "(search_id=", existing [["id"]], "). ",
            "Call deactivate_search() first."
        )
    }

    created_at <- strftime (Sys.time (), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
    DBI::dbExecute (
        con,
        paste0 (
            "INSERT INTO searches (created_at, issue_ref, notify_email) ",
            "VALUES (?, ?, ?)"
        ),
        params = list (created_at, issue_ref, notify_address)
    )
    search_id <- DBI::dbGetQuery (
        con,
        "SELECT last_insert_rowid() AS id"
    ) [["id"]]
    message ("[send_search] search row inserted: search_id=", search_id)

    tokens <- vapply (
        seq_along (emails),
        function (i) generate_email_token (),
        character (1L)
    )

    for (i in seq_along (emails)) {
        DBI::dbExecute (
            con,
            "INSERT INTO recipients (search_id, email, token) VALUES (?, ?, ?)",
            params = list (search_id, emails [[i]], tokens [[i]])
        )
    }
    message ("[send_search] inserted ", length (emails), " recipient row(s)")

    links <- paste0 (base_url, "/click/", tokens)
    message (
        "[send_search] GMAIL_SENDER=",
        Sys.getenv ("GMAIL_SENDER")
    )
    message ("[send_search] calling gmail_send_batch")
    resp <- gmail_send_batch (emails, links, subject, repo, issue_id)
    message (
        "[send_search] gmail_send_batch: sent ", length (resp), " message(s)"
    )

    list (search_id = search_id, sent = length (emails))
}

#' List all volunteer searches with recipient and click counts
#'
#' @return Data frame with columns \code{search_id}, \code{created_at},
#'   \code{notify_email}, \code{active}, \code{total}, \code{clicked}.
#' @family email
#' @export
list_searches <- function () {

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    DBI::dbGetQuery (con, "
        SELECT
            s.id    AS search_id,
            s.created_at,
            s.issue_ref,
            s.notify_email,
            s.active,
            COUNT (r.id)                                          AS total,
            SUM (CASE WHEN r.clicked_at IS NOT NULL THEN 1 ELSE 0 END) AS clicked
        FROM searches s
        LEFT JOIN recipients r ON r.search_id = s.id
        GROUP BY s.id
        ORDER BY s.id
    ")
}

#' Handle a volunteer link click
#'
#' Looks up the token, checks whether the parent search is still active, guards
#' against double-clicks, records the click timestamp, and triggers a Gmail
#' API notification (Phase 2).
#'
#' @param token 64-character hex token from the recipient's unique link.
#' @return Named list with \code{status} (integer HTTP status code) and
#'   \code{body} (character HTML string).
#' @family email
#' @export
handle_click <- function (token) {

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    recipient <- DBI::dbGetQuery (
        con,
        "SELECT * FROM recipients WHERE token = ?",
        params = list (token)
    )
    if (nrow (recipient) == 0L) {
        return (list (status = 404L, body = "Link not found."))
    }

    search <- DBI::dbGetQuery (
        con,
        "SELECT * FROM searches WHERE id = ?",
        params = list (recipient [["search_id"]])
    )
    if (search [["active"]] == 0L) {
        return (list (status = 200L, body = "This link has expired."))
    }

    if (!is.na (recipient [["clicked_at"]])) {
        return (list (status = 200L, body = "You have already used this link."))
    }

    clicked_at <- strftime (Sys.time (), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
    DBI::dbExecute (
        con,
        "UPDATE recipients SET clicked_at = ? WHERE token = ?",
        params = list (clicked_at, token)
    )

    gmail_send (
        to = search [["notify_email"]],
        subject = "rOpenSci editor search: new response",
        html_body = paste0 (
            "<p><strong>", recipient [["email"]], "</strong>",
            " responded at ", clicked_at, " for issue ",
            "<a href=\"https://github.com/", search [["issue_ref"]], "\">",
            search [["issue_ref"]], "</a>.</p>"
        )
    )

    list (
        status = 200L,
        body = "Thank you for your interest. We will be in touch."
    )
}

#' Deactivate a volunteer search and delete all associated data
#'
#' Sets \code{active = 0} first as a guard against concurrent clicks, then
#' deletes all recipient rows followed by the search row itself.
#'
#' @param repo GitHub review repository in \code{org/repo} format.
#' @param issue_id Integer issue number in the review repository.
#' @return Named list with \code{deactivated} (logical) and \code{issue_ref}.
#' @family email
#' @export
deactivate_search <- function (repo, issue_id) {

    email_db_init <- utils::getFromNamespace ("email_db_init", "roreviewapi")

    issue_ref <- paste0 (repo, "/issues/", as.integer (issue_id) [[1L]])

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    existing <- DBI::dbGetQuery (
        con,
        "SELECT id FROM searches WHERE issue_ref = ?",
        params = list (issue_ref)
    )
    if (nrow (existing) == 0L) {
        stop ("No search found for '", issue_ref, "'")
    }
    search_id <- existing [["id"]]

    DBI::dbExecute (
        con,
        "UPDATE searches SET active = 0 WHERE id = ?",
        params = list (search_id)
    )
    DBI::dbExecute (
        con,
        "DELETE FROM recipients WHERE search_id = ?",
        params = list (search_id)
    )
    DBI::dbExecute (
        con,
        "DELETE FROM searches WHERE id = ?",
        params = list (search_id)
    )

    list (deactivated = TRUE, issue_ref = issue_ref)
}
