#' Tick symbol, exported for direct use in plumber API
#'
#' @family utils
#' @export
symbol_tck <- function () {
    ":heavy_check_mark:"
}

#' Cross symbol, exported for direct use in plumber API
#'
#' @family utils
#' @export
symbol_crs <- function () {
    ":heavy_multiplication_x:"
}

#' Get GitHub user name from token.
#'
#' @description This is only intended to be used within the main docker
#' container, in which token is always hard-coded in precisely the way assumed
#' here.
#'
#' @return User name ("login") associated with specified token
#' @noRd
get_github_user <- function () {

    gh_tok <- get_gh_token ()

    # Check corresponding user name:
    u <- "https://api.github.com/user"
    req <- httr2::request (u)
    req <- httr2::req_headers (
        req,
        "Authorization" = paste0 ("Bearer ", gh_tok),
        "Content-Type" = "application/json"
    )

    resp <- httr2::req_perform (req)
    httr2::resp_check_status (resp)

    x <- httr2::resp_body_json (resp)
    login <- ""
    if ("login" %in% names (x)) {
        login <- x$login
    }

    return (login)
}

#' Check whether a user, identified from GitHub API token, is authorized to call
#' endpoints.
#'
#' @description This function is used only in the \pkg{plumber} endpoints, to
#' prevent them being called by unauthorized users.
#'
#' @param secret Environment variable `PKGCHECK_TOKEN` sent from bot.
#' @return Logical value indicating whether or not a user is authorized.
#'
#' @family ropensci
#' @export
is_user_authorized <- function (secret = NULL) {

    user <- get_github_user ()
    yes <- user %in% authorized_users
    if (!yes & !is.null (secret)) {
        yes <- identical (secret, Sys.getenv ("PKGCHECK_TOKEN"))
    }

    return (yes)
}

#' The users are currently only used to authorize opening issues on the
#' `pkgcheck` repo for packages which fail checks:
#' @noRd
authorized_users <- c (
    "ropensci-review-bot",
    "mpadge",
    "noamross",
    "maelle"
)

#' Get branch from a GitHub URL if non-default branch specified there
#'
#' @param repourl Potentially with "/tree/branch_name/sub-directory" appended
#' @return Branch as single string.
#'
#' @family github
#' @export
get_branch_from_url <- function (repourl) {

    branch <- NULL
    domains <- strsplit (repourl, "\\/+") [[1]]
    if (length (domains) > 4L & any (domains == "tree")) {
        i <- which (domains == "tree")
        branch <- domains [which (domains == "tree") + 1L]
        if (branch %in% c ("main", "master") && length (domains) > (i + 1)) {
            # URL has branch only as prefix to sub-directory
            branch <- NULL
        }
    }
    return (branch)
}

#' Return sub-directory from URL if present. This function is also intended to
#' test whether packages are in sub-directories (issue #64)
#'
#' @inheritParams get_branch_from_url
#'
#' @family github
#' @export
get_subdir_from_url <- function (repourl) {

    subdir <- NULL
    domains <- strsplit (repourl, "\\/+") [[1]]
    if (length (domains) > 4L & any (domains == "tree")) {
        i <- which (domains == "tree")
        if (length (domains) > (i + 1)) {
            subdir <- domains [i + 2L]
        }
    }
    return (subdir)
}

url_exists <- getFromNamespace ("url_exists", "pkgcheck")
