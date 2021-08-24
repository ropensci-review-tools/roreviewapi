
#' Tick symbol, exported for direct use in plumber API
#' @export
symbol_tck <- function () {
    ":heavy_check_mark:"
}

#' Cross symbol, exported for direct use in plumber API
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

    gh_tok <- Sys.getenv ("GITHUB_TOKEN")

    # Check corresponding user name:
    u <- "https://api.github.com/user"
    h <- httr::add_headers (Authorization = paste ("Bearer", gh_tok, sep = " "))
    x <- httr::content (httr::GET (u, h), "text")

    # Then extract user:
    x <- strsplit (x, "\\n") [[1]]
    login <- grep ("\\\"login\\\"\\:", x, value = TRUE)
    login <- gsub ("\\\"|,$", "", strsplit (login, "\\:\\s+") [[1]] [2])

    return (login)
}

# The users are currently only used to authorize opening issues on the
# `pkgcheck` repo for packages which fail checks:
authorized_users <- c ("ropensci-review-bot",
                       "mpadge",
                       "noamross",
                       "maelle")
