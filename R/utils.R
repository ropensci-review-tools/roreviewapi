
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
#'
#' @note
#' https://stackoverflow.com/questions/52911812/check-if-url-exists-in-r
#' @noRd
url_exists <- function(x, non_2xx_return_value = FALSE, quiet = FALSE, ...) {

  # you don't need thse two functions if you're already using `purrr`
  # but `purrr` is a heavyweight compiled pacakge that introduces
  # many other "tidyverse" dependencies and this doesnt.

  capture_error <- function(code, otherwise = NULL, quiet = TRUE) {
    tryCatch(
      list(result = code, error = NULL),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)

        list(result = otherwise, error = e)
      },
      interrupt = function(e) {
        stop("Terminated by user", call. = FALSE)
      }
    )
  }

  safely <- function(.f, otherwise = NULL, quiet = TRUE) {
    function(...) capture_error(.f(...), otherwise, quiet)
  }

  sHEAD <- safely(httr::HEAD)   # nolint
  sGET <- safely(httr::GET)     # nolint

  # Try HEAD first since it's lightweight
  res <- sHEAD(x, ...)

  if (is.null(res$result) ||
      ((httr::status_code(res$result) %/% 200) != 1)) {

    res <- sGET(x, ...)

    if (is.null (res$result))
        return (FALSE) # or whatever you want to return on "hard" errors

    if (((httr::status_code(res$result) %/% 200) != 1)) {
      if (!quiet)
          warning (paste0 ("Requests for [",
                           x,
                           "] responded but without an HTTP status ",
                           "code in the 200-299 range"))
      return (non_2xx_return_value)
    }

    return(TRUE)

  } else {
    return(TRUE)
  }

}
