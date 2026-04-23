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
            repourl      TEXT NOT NULL UNIQUE,
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
#' @param airtable_base_id AirTable base ID (from \code{AIRTABLE_BASE_ID} env var).
#' @param stats If \code{TRUE}, fetch stats editors; otherwise fetch regular editors.
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
    grepl ("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", trimws (x))
}

#' @noRd
is_valid_base_url <- function (x) {
    grepl ("^https://", x) || grepl ("^http://(localhost|127\\.0\\.0\\.1)", x)
}

#' Fetch the current editor-in-chief email address from AirTable
#'
#' @param airtable_base_id AirTable base ID (from \code{AIRTABLE_BASE_ID} env var).
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
        dir.create (dirname (notify_email_cache_path ()), recursive = TRUE, showWarnings = FALSE)
        writeLines (email, notify_email_cache_path ())
    }
    invisible (email)
}

#' Send a single email via the Postmark API
#'
#' @param to Recipient email address.
#' @param subject Email subject line.
#' @param html_body HTML body of the email.
#' @return The \pkg{httr2} response object, invisibly.
#' @noRd
postmark_send <- function (to, subject, html_body) {

    token <- Sys.getenv ("POSTMARK_API_TOKEN")
    from <- Sys.getenv ("POSTMARK_FROM")

    resp <- httr2::request ("https://api.postmarkapp.com/email") |>
        httr2::req_method ("POST") |>
        httr2::req_headers (
            "X-Postmark-Server-Token" = token,
            "Content-Type"            = "application/json",
            "Accept"                  = "application/json"
        ) |>
        httr2::req_body_json (list (
            From          = from,
            To            = to,
            Subject       = subject,
            HtmlBody      = html_body,
            MessageStream = "outbound"
        )) |>
        httr2::req_perform ()

    invisible (resp)
}

#' Send a batch of emails via the Postmark API
#'
#' Note: Postmark's \code{/email/batch} endpoint accepts a maximum of 500
#' messages per call.
#'
#' @param emails Character vector of recipient addresses.
#' @param links Character vector of personalised click links, parallel to \code{emails}.
#' @param subject Email subject line.
#' @return The \pkg{httr2} response object, invisibly.
#' @noRd
postmark_send_batch <- function (emails, links, subject) {

    token <- Sys.getenv ("POSTMARK_API_TOKEN")
    from <- Sys.getenv ("POSTMARK_FROM")

    messages <- lapply (seq_along (emails), function (i) {
        list (
            From = from,
            To = emails [[i]],
            Subject = subject,
            HtmlBody = paste0 (
                "<p>You have been invited to volunteer with rOpenSci. ",
                "Please click the link below to express your interest:</p>",
                "<p><a href=\"", links [[i]], "\">Click here to respond</a></p>"
            ),
            MessageStream = "outbound"
        )
    })

    resp <- httr2::request ("https://api.postmarkapp.com/email/batch") |>
        httr2::req_method ("POST") |>
        httr2::req_headers (
            "X-Postmark-Server-Token" = token,
            "Content-Type"            = "application/json",
            "Accept"                  = "application/json"
        ) |>
        httr2::req_body_json (messages) |>
        httr2::req_perform ()

    invisible (resp)
}

#' Send a batch of editor search emails
#'
#' Fetches current editor email addresses via \code{get_editor_emails()}, inserts
#' a new search record and one recipient row per address into the database, then
#' dispatches emails via Postmark.  The notify address is read from the AirTable
#' cache written by \code{\link{notify_email_refresh}}.
#'
#' @param repourl URL of the package repository this search is for.
#' @param base_url Base URL of the deployed API; used to build click links.
#' @param stats If \code{TRUE}, target stats editors instead of regular editors.
#' @param subject Subject line for the outgoing emails.
#' @param fetcher Function used to fetch editor emails; injectable for testing.
#'   Must accept \code{(airtable_base_id, stats)} and return a character vector.
#' @return Named list with \code{search_id} (integer) and \code{sent} (integer).
#' @export
send_search <- function (repourl, base_url, stats = FALSE,
                         subject = "Seeking editors for rOpenSci software submission",
                         fetcher = get_editor_emails) {

    if (length (repourl) != 1L || !nzchar (repourl)) {
        stop ("'repourl' must be a single non-empty string")
    }
    if (length (base_url) != 1L || !is_valid_base_url (base_url)) {
        stop ("'base_url' must start with https:// or http://localhost")
    }

    emails <- fetcher (Sys.getenv ("AIRTABLE_BASE_ID"), stats = stats)
    if (!length (emails) || !all (is_valid_email (emails))) {
        stop ("fetcher returned no valid email addresses")
    }

    notify_address <- notify_email_read ()

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    created_at <- strftime (Sys.time (), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
    DBI::dbExecute (
        con,
        "INSERT INTO searches (created_at, repourl, notify_email) VALUES (?, ?, ?)",
        params = list (created_at, repourl, notify_address)
    )
    search_id <- DBI::dbGetQuery (con, "SELECT last_insert_rowid() AS id") [["id"]]

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

    links <- paste0 (base_url, "/click/", tokens)
    postmark_send_batch (emails, links, subject)

    list (search_id = search_id, sent = length (emails))
}

#' List all volunteer searches with recipient and click counts
#'
#' @return Data frame with columns \code{search_id}, \code{created_at},
#'   \code{notify_email}, \code{active}, \code{total}, \code{clicked}.
#' @export
list_searches <- function () {

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    DBI::dbGetQuery (con, "
        SELECT
            s.id    AS search_id,
            s.created_at,
            s.repourl,
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
#' against double-clicks, records the click timestamp, and triggers a Postmark
#' notification (Phase 2).
#'
#' @param token 64-character hex token from the recipient's unique link.
#' @return Named list with \code{status} (integer HTTP status code) and
#'   \code{body} (character HTML string).
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

    postmark_send (
        to = search [["notify_email"]],
        subject = "rOpenSci editor search: new response",
        html_body = paste0 (
            "<p><strong>", recipient [["email"]], "</strong>",
            " responded at ", clicked_at, ".</p>"
        )
    )

    list (status = 200L, body = "Thank you for your interest. We will be in touch.")
}

#' Deactivate a volunteer search and delete all associated data
#'
#' Sets \code{active = 0} first as a guard against concurrent clicks, then
#' deletes all recipient rows followed by the search row itself.
#'
#' @param repourl Repository URL used when the search was created.
#' @return Named list with \code{deactivated} (logical) and \code{repourl}.
#' @export
deactivate_search <- function (repourl) {

    con <- email_db_init ()
    on.exit (DBI::dbDisconnect (con))

    existing <- DBI::dbGetQuery (
        con,
        "SELECT id FROM searches WHERE repourl = ?",
        params = list (repourl)
    )
    if (nrow (existing) == 0L) {
        stop ("No search found for repourl '", repourl, "'")
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

    list (deactivated = TRUE, repourl = repourl)
}
