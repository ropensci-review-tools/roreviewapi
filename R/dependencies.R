
#' Install all system and package dependencies of an R package
#'
#' @param path Path to local package
#' @inheritParams serve_api
#' @export
pkgrep_install_deps <- function (path, os, os_release) {

    sysreq <- remotes::system_requirements (os = os,
                                            os_release = os_release,
                                            path = path)
    tmp <- lapply (sysreq, system) # nolint

    remotes::install_deps (pkgdir = path,
                           dependencies = TRUE,
                           upgrade = "always")
}
