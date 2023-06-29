#' Check template variables in GitHub issue
#'
#' @param orgrepo GitHub organization and repo as single string separated by
#' forward slash (`org/repo`).
#' @param issue_num Number of issue from which to extract opening comment
#' @return Comment as character string
#' @family ropensci
#' @export
check_issue_template <- function (orgrepo, issue_num) {

    org <- strsplit (orgrepo, "/|%2F") [[1]] [1]
    repo <- strsplit (orgrepo, "/|%2F") [[1]] [2]

    token <- get_gh_token ()

    gh_cli <- ghql::GraphqlClient$new (
        url = "https://api.github.com/graphql",
        headers = list (Authorization = paste0 ("Bearer ", token))
    )

    qry <- issue_cmt_qry (gh_cli,
        org = org,
        repo = repo,
        issue_num = issue_num
    )

    x <- gh_cli$exec (qry$queries$get_template)
    x <- jsonlite::fromJSON (x)
    x <- strsplit (x$data$repository$issue$body, "\\n") [[1]]

    html_must_have <- html_variables [html_variables != "statsgrade"]
    chk <- vapply (
        html_must_have,
        function (i) check_html_variable (x, i),
        character (1)
    )

    # separate checks for optional stats variable:
    if (has_html_variable (x, "statsgrade")) {
        chk <- c (chk, check_html_variable (x, "statsgrade"))
    }

    chk <- chk [which (nchar (chk) > 0L)]

    out <- ""
    if (length (chk) == 1L) {

        out <- paste0 (
            "The following problem was found in your ",
            "submission template:\n\n- ",
            unname (chk)
        )

    } else if (length (chk) > 1L) {

        out <- paste0 (
            "The following problems were found in your ",
            "submission template:\n\n",
            paste0 ("- ", unname (chk), collapse = "\n")
        )
    }

    proceed_with_checks <- TRUE

    if (grepl ("URL.*is not valid", out)) {

        out <- paste0 (
            out,
            "\n",
            "The package could not be checked because of ",
            "problems with the URL.\nEditors: Please ensure ",
            "these problems are rectified, and then call ",
            "`@ropensci-review-bot check package`."
        )

        proceed_with_checks <- FALSE

    } else if (nchar (out) > 0L) {

        out <- paste0 (
            out,
            "\n",
            "Editors: Please ensure these problems with the ",
            "submission template are rectified. Package checks ",
            "have been started regardless."
        )
    }

    attr (out, "proceed_with_checks") <- proceed_with_checks

    return (out)
}

html_variables <- c (
    "author1",
    "repourl",
    "submission-type",
    "statsgrade",
    "editor",
    "reviewers-list",
    "due-dates-list"
)

# Note "Estandar" has to be converted to non-accented "a"
# to avoid warnings about non-ASCII characters in code
submission_types <- c ("Standard", "Estandar", "Stats")

stats_grades <- c ("bronze", "silver", "gold")

#' Check whether one HTML variable exists in issue template
#'
#' @param x The opening comment of issue as a character string
#' @param variable The HTML variable to be checked
#' @return Logical flag indicating whether or not the variable is okay.
#' @noRd
has_html_variable <- function (x, variable) {

    variable <- match.arg (variable, html_variables)

    var_open <- paste0 ("<\\!\\-\\-", variable, "\\-\\->")
    var_close <- gsub (variable, paste0 ("end-", variable), var_open)

    open_pos <- grep (var_open, x)
    close_pos <- grep (var_close, x)

    chk <- length (open_pos) == 1 &
        length (close_pos) == 1L &
        identical (open_pos, close_pos)

    return (chk)
}

#' Extract value of one HTML variable from issue template
#'
#' This presumes `has_html_variable` has already been called to confirm the
#' variable exists.
#'
#' @param x The opening comment of issue as a character string
#' @param variable The HTML variable to be checked
#' @return Logical flag indicating whether or not the variable is okay.
#' @noRd
get_html_variable <- function (x, variable) {

    variable <- match.arg (variable, html_variables)

    var_open <- paste0 ("<\\!\\-\\-", variable, "\\-\\->")
    var_close <- gsub (variable, paste0 ("end-", variable), var_open)

    open_pos <- grep (var_open, x)

    ptn <- paste0 (
        "^.*", var_open, "|",
        var_close, ".*$"
    )

    return (gsub (ptn, "", x [open_pos]))
}

#' Check one HTML variable in issue template
#'
#' @param x The opening comment of issue as a character string
#' @param variable The HTML variable to be checked
#' @return Logical flag indicating whether or not the variable is okay.
#' @noRd
check_html_variable <- function (x, variable) {

    variable <- match.arg (variable, html_variables)

    if (!has_html_variable (x, variable)) {
        return (paste0 (
            "HTML variable [", variable,
            "] is missing"
        ))
    }

    x <- get_html_variable (x, variable)

    out <- ""

    if (variable == "author1") {

        # GitHub handle only (#17):
        check <- grepl ("^@(\\w|\\-|\\_)+$", x)
        if (!check) {
            out <- paste0 (
                "'author1' variable must be ",
                "GitHub hanle only ('@myhandle')"
            )
        }

    } else if (variable == "repourl") {

        if (!url_exists (x)) {
            out <- paste0 ("URL = [", x, "] is not valid")
        }

    } else if (variable == "submission-type") {

        # Have to iconv to convert accented "a" to ascii:
        x <- iconv (x, to = "ASCII//TRANSLIT")
        if (!x %in% submission_types) {
            out <- paste0 (
                "submission type must be one of [",
                paste0 (submission_types, collapse = ", "),
                "]"
            )
        }

    } else if (variable == "statsgrade") {

        if (!tolower (x) %in% stats_grades) {
            out <- paste0 (
                "'statsgrade' variable must be one of [",
                paste0 (stats_grades, collapse = ", "),
                "]"
            )
        }
    }

    return (out)
}

#' Get GitHub token
#'
#' (Same as in `pkgcheck`)
#' @param token_name Optional name of token to use
#' @return The value of the GitHub access token extracted from environment
#' variables.
#' @family github
#' @noRd
get_gh_token <- function (token_name = "") {

    e <- Sys.getenv ()
    if (token_name != "") {

        toks <- unique (e [grep (token_name, names (e))])

    } else {

        toks <- e [grep ("GITHUB", names (e))]
        if (length (unique (toks)) > 1) {
            toks <- toks [grep ("TOKEN|PAT", names (toks))]
        }
        # GitHub runners have "GITHUB_PATH" and "GITHUB_EVENT_PATH"
        if (length (unique (toks)) > 1) {
            toks <- toks [grep ("TOKEN$|PAT$", names (toks))]
        }
    }

    if (length (unique (toks)) > 1) {

        stop (
            "There are ",
            length (unique (toks)),
            " possible tokens named [",
            paste0 (names (toks), collapse = ", "),
            "]; please ensure one distinct ",
            "token named 'GITHUB_TOKEN' or similar."
        )
    }

    return (unique (toks))
}

issue_cmt_qry <- function (gh_cli, org, repo, issue_num) {

    q <- paste0 ("{
        repository(owner:\"", org, "\", name:\"", repo, "\") {
            issue(number:", issue_num, ") {
                  body
                }
            }
    }")

    qry <- ghql::Query$new ()
    qry$query ("get_template", q)

    return (qry)
}
