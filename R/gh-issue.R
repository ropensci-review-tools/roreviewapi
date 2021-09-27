
#' Check template variables in GitHub issue
#'
#' @param org GitHub organization
#' @param repo GitHub repository
#' @param issue_num Number of issue from which to extract opening comment
#' @return Comment as character string
#' @export
check_issue_template <- function (org, repo, issue_num) {

    token <- get_gh_token ()

    gh_cli <- ghql::GraphqlClient$new (
        url = "https://api.github.com/graphql",
        headers = list (Authorization = paste0 ("Bearer ", token))
    )

    qry <- issue_cmt_qry (gh_cli,
                          org = org,
                          repo = repo,
                          issue_num = issue_num)

    x <- gh_cli$exec(qry$queries$get_template) |>
        jsonlite::fromJSON ()
    x <- strsplit (x$data$repository$issue$body, "\\n") [[1]]
}

html_variables <- c ("author1",
                     "repourl",
                     "submission-type",
                     "statsgrade",
                     "editor",
                     "reviewers-list",
                     "due-dates-list")

#' Check one HTML variable in issue template
#'
#' @param x The opening comment of issue as a character string
#' @param variable The HTML variable to be checked
#' @return Logical flag indicating whether or not the variable is okay.
#' @noRd
check_html_variable <- function (x, variable) {

    variable <- match.arg (variable, html_variables)

    var_open <- paste0 ("<\\!\\-\\-", variable, "\\-\\->")
    var_close <- gsub (variable, paste0 ("end-", variable), var_open)

    open_pos <- grep (var_open, x)
    close_pos <- grep (var_close, x)

    chk <- length (open_pos) == 1 &
        length (close_pos) == 1L &
        identical (open_pos, close_pos)

    if (!chk)
        return (FALSE)

    ptn <- paste0 ("^.*", var_open, "|",
                   var_close, ".*$")
    x <- gsub (ptn, "", x [open_pos])

    if (variable == "author1") {

        # Start with at least one word AND
        # match "(@something)"
        check <- grepl ("^\\w+\\s", x) &
            grepl ("\\(@\\S+\\)", x)
    }

    return (check)
}

#' Get GitHub token
#'
#' (Same as in `pkgcheck`)
#' @param token_name Optional name of token to use
#' @return The value of the GitHub access token extracted from environment
#' variables.
#' @family github
#' @export
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

        stop ("There are ",
              length (unique (toks)),
              " possible tokens named [",
              paste0 (names (toks), collapse = ", "),
              "]; please ensure one distinct ",
              "token named 'GITHUB_TOKEN' or similar.")
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

    qry <- ghql::Query$new()
    qry$query ("get_template", q)

    return (qry)
}
