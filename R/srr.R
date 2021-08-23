
#' Get current version of statistical standards
#'
#' @return A single character containing version number
#' @export
stats_version <- function () {

    u <- paste0 ("https://raw.githubusercontent.com/",
                 "ropenscilabs/statistical-software-review-book/",
                 "main/standards.Rmd")
    f <- tempfile (fileext = ".Rmd")
    chk <- utils::download.file (u, destfile = f, quiet = TRUE) # nolint

    s <- readLines (f, encoding = "UTF-8")

    v <- grep ("^\\#\\sStandards\\:\\sVersion", s, value = TRUE)
    v <- gsub ("^\\s+", "", strsplit (v, "Version") [[1]] [2])
    v <- strsplit (v, "\\s") [[1]] [1]

    return (v)
}

#' Get stats badge grade and standards version for a submission
#'
#' @param repo The submission repo
#' @param issue_num GitHub issue number of submission
#' @return A single character containing the label used directly for the issue
#' badge
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
