
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
