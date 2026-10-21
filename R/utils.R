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
#' @description By default, this uses the token hard-coded in the main docker
#' container, in precisely the way assumed here.
#'
#' @param gh_tok GitHub token for which to get the user name.
#' @return User name ("login") associated with specified token, or empty string
#' if the token is invalid or the request fails.
#' @noRd
get_github_user <- function (gh_tok = gh::gh_token ()) {

    # Check corresponding user name:
    u <- "https://api.github.com/user"
    req <- httr2::request (u)
    req <- httr2::req_headers (
        req,
        "Authorization" = paste0 ("Bearer ", gh_tok),
        "Content-Type" = "application/json"
    )

    x <- tryCatch (
        {
            resp <- httr2::req_perform (req)
            httr2::resp_check_status (resp)
            httr2::resp_body_json (resp)
        },
        error = function (e) list ()
    )
    login <- ""
    if ("login" %in% names (x)) {
        login <- x$login
    }

    return (login)
}

#' Check whether a caller is authorized to call endpoints.
#'
#' @description This function is used only in the \pkg{plumber} endpoints, to
#' prevent them being called by unauthorized users. Authorization is determined
#' solely from the `secret` supplied by the caller, and never from the token
#' hard-coded in the container. The `secret` is authorized if it either matches
#' the environment variable `PKGCHECK_TOKEN`, or is a GitHub token belonging to
#' one of the authorized users.
#'
#' @param secret Environment variable `PKGCHECK_TOKEN` sent from bot, or a
#' GitHub token of an authorized user.
#' @return Logical value indicating whether or not a user is authorized.
#'
#' @family ropensci
#' @export
is_user_authorized <- function (secret = NULL) {

    if (length (secret) != 1L || !is.character (secret) || !nzchar (secret)) {
        return (FALSE)
    }

    pkgcheck_token <- Sys.getenv ("PKGCHECK_TOKEN")
    if (nzchar (pkgcheck_token) && identical (secret, pkgcheck_token)) {
        return (TRUE)
    }

    return (get_github_user (secret) %in% authorized_users)
}

#' The users are currently only used to authorize opening issues on the
#' `pkgcheck` repo for packages which fail checks:
#' @noRd
authorized_users <- c (
    "ropensci-review-bot",
    "noamross",
    "maelle",
    "maurolepore"
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

#' Check whether a given GitHub URL contains an R package.
#'
#' @inheritParams get_branch_from_url
#' @return `TRUE` if 'repourl' is an R package, otherwise `FALSE`
#'
#' @family github
#' @export
url_is_r_pkg <- function (repourl) {

    ret <- TRUE

    if (!grepl ("github\\.com", repourl)) {
        return (FALSE)
    }
    branch <- get_branch_from_url (repourl)
    repourl <- gsub ("^https\\:\\/\\/", "", repourl)
    repourl <- gsub ("github\\.com\\/", "", repourl)

    repourl_split <- fs::path_split (repourl) [[1]]
    if (length (repourl_split) < 2L) {
        return (FALSE)
    }
    repourl <- paste0 (repourl_split [1:2], collapse = "/")

    u_base <- "https://api.github.com/repos/"

    url <- paste0 (u_base, repourl, "/contents")

    req <- httr2::request (url)
    if (!is.null (branch)) {
        req <- httr2::req_url_query (req, ref = branch)
    }

    resp <- tryCatch (
        httr2::req_perform (req),
        error = function (e) NULL
    )
    if (is.null (resp)) {
        return (FALSE)
    }
    httr2::resp_check_status (resp)

    body_files <- httr2::resp_body_json (resp, simplify = TRUE)
    required <- c ("DESCRIPTION", "NAMESPACE", "R", "man")
    ret <- all (required %in% body_files$name)

    return (ret)
}

url_exists <- utils::getFromNamespace ("url_exists", "pkgcheck")
