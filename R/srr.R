
#' Get stats badge grade and standards version for a submission
#'
#' @param repo The submission repo
#' @param issue_num GitHub issue number of submission
#' @return A single character containing the label used directly for the issue
#' badge
#' @family ropensci
#' @export
stats_badge <- function (repo = "ropensci/software-review",
                         issue_num = 258) {

    # This by default returns only the opening comment. Additional comments can
    # be extracted with the "-c" flag.
    args <- list ("issue",
                  "view",
                  issue_num,
                  "-R",
                  repo)

    out <- system2 ("gh", args = args, stdout = TRUE, wait = TRUE)

    type <- get_html_var (out, "submission-type")
    if (length (type) == 0L)
        return (NULL)

    grade <- get_html_var (out, "statsgrade")
    version <- stats_version ()

    if (type != "Stats")
        return (NULL)

    return (paste0 ("6\approved-", grade, "-v", version))
}

get_html_var <- function (x, expr = "submission-type") {

    x <- grep (paste0 ("<!--", expr, "-->"), x, value = TRUE)
    x <- regmatches (x, regexpr ("\\-\\->.*<!\\-\\-", x))
    x <- gsub ("\\-\\->|<!\\-\\-", "", x)

    return (x)
}

#' Get current version of statistical standards
#'
#' @return A single character containing version number
#' @noRd
stats_version <- function () {

    u <- paste0 ("https://raw.githubusercontent.com/",
                 "ropensci/statistical-software-review-book/",
                 "main/DESCRIPTION")

    tmp <- file.path (tempdir (), "stats-devguide-DESCRIPTION")
    if (!file.exists (tmp))
        ret <- utils::download.file (u, destfile = tmp, quiet = TRUE) # nolint

    d <- data.frame (read.dcf (tmp))

    return (d$Version)
}
