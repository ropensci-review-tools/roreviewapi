
#' Body of main 'editorcheck' response
#'
#' @param path Path to local source repository
#' @return Markdown-formatted response body from static package checks.
#' @export
editor_check <- function (path) {

    checks <- pkgcheck::pkgcheck (path)
    checks_md <- pkgcheck::checks_to_markdown (checks, render = FALSE)

    ret <- paste0 (checks_md, collapse = "\n")
    attributes (ret) <- attributes (checks_md)

    return (ret)
}
