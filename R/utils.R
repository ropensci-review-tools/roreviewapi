#' Tick symbol, exported for direct use in plumber API
#' @family utils
#' @export
symbol_tck <- function () {
    ":heavy_check_mark:"
}

#' Cross symbol, exported for direct use in plumber API
#' @family utils
#' @export
symbol_crs <- function () {
    ":heavy_multiplication_x:"
}

#' Get GitHub user name from token.
#'
#' This is only intended to be used within the main docker container, in which
#' token is always hard-coded in precisely the way assumed here.
#' @return User name ("login") associated with specified token
#' @noRd
get_github_user <- function () {

    gh_tok <- gitcreds::gitcreds_get ()$password

    # Check corresponding user name:
    u <- "https://api.github.com/user"
    h <- httr::add_headers (Authorization = paste ("Bearer", gh_tok, sep = " "))
    x <- httr::content (httr::GET (u, h), "text")

    # Then extract user:
    x <- strsplit (x, "\\n") [[1]]
    login <- grep ("\\\"login\\\"\\:", x, value = TRUE)
    if (length (login) > 0L) {
        login <- gsub ("\\\"|,$", "", strsplit (login, "\\:\\s+") [[1]] [2])
    } else {
        login <- ""
    }

    return (login)
}

#' Check whether a user, identified from GitHub API token, is authorized to call
#' endpoints.
#'
#' This function is used only in the \pkg{plumber} endpoints, to prevent them
#' being called by unauthorized users.
#' @param secret Environment variable `PKGCHECK_TOKEN` sent from bot.
#' @return Logical value indicating whether or not a user is authorized.
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

# The users are currently only used to authorize opening issues on the
# `pkgcheck` repo for packages which fail checks:
authorized_users <- c (
    "ropensci-review-bot",
    "mpadge",
    "noamross",
    "maelle"
)

#' Get branch from a GitHub URL if non-default branch specified there
#' @param repourl Potentially with "/tree/branch_name/sub-directory" appended
#' @return Branch as single string.
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

#' Bob Rudis's URL checker function
#'
#' This is used here to check the URLs in the `check_issue_template` function.
#'
#' @param x a single URL
#' @param non_2xx_return_value what to do if the site exists but the HTTP status
#' code is not in the `2xx` range. Default is to return `FALSE`.
#' @param quiet if not `FALSE`, then every time the `non_2xx_return_value`
#' condition arises a warning message will be displayed. Default is `FALSE`.
#' @param ... other params (`timeout()` would be a good one) passed directly to
#' `httr::HEAD()` and/or `httr::GET()`
#' @return 'TRUE' is 'x' is a valid URL.
#'
#' @note
#' https://stackoverflow.com/questions/52911812/check-if-url-exists-in-r
#' @noRd
url_exists <- function (x, non_2xx_return_value = FALSE, quiet = FALSE, ...) {

    # you don't need thse two functions if you're already using `purrr`
    # but `purrr` is a heavyweight compiled pacakge that introduces
    # many other "tidyverse" dependencies and this doesnt.

    capture_error <- function (code, otherwise = NULL, quiet = TRUE) {
        tryCatch (
            list (result = code, error = NULL),
            error = function (e) {
                if (!quiet) {
                    message ("Error: ", e$message)
                }

                list (result = otherwise, error = e)
            },
            interrupt = function (e) {
                stop ("Terminated by user", call. = FALSE)
            }
        )
    }

    safely <- function (.f, otherwise = NULL, quiet = TRUE) {
        function (...) capture_error (.f (...), otherwise, quiet)
    }

    sHEAD <- safely (httr::HEAD) # nolint
    sGET <- safely (httr::GET) # nolint

    # Try HEAD first since it's lightweight
    res <- sHEAD (x, ...)

    if (is.null (res$result) ||
        ((httr::status_code (res$result) %/% 200) != 1)) {

        res <- sGET (x, ...)

        if (is.null (res$result)) {
            return (FALSE)
        } # or whatever you want to return on "hard" errors

        if (((httr::status_code (res$result) %/% 200) != 1)) {
            if (!quiet) {
                warning (paste0 (
                    "Requests for [",
                    x,
                    "] responded but without an HTTP status ",
                    "code in the 200-299 range"
                ))
            }
            return (non_2xx_return_value)
        }

        return (TRUE)

    } else {
        return (TRUE)
    }

}
