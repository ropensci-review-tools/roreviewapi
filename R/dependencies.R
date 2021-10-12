
#' Install all system and package dependencies of an R package
#'
#' @param path Path to local package
#' @inheritParams serve_api
#' @return Hopefully a character vector of length zero, otherwise a list of any
#' R packages unable to be installed.
#' @export
pkgrep_install_deps <- function (path, os, os_release) {

    sysreq <- remotes::system_requirements (os = os,
                                            os_release = os_release,
                                            path = path)
    tmp <- lapply (sysreq, system) # nolint

    remotes::install_deps (pkgdir = path,
                           dependencies = TRUE,
                           upgrade = "always")

    deps <- remotes::dev_package_deps (pkgdir = path,
                                       dependencies = TRUE)
    ip <- data.frame (utils::installed.packages ())
    
    deps <- deps$package [which (!deps$package %in% ip$Package)]
    if (length (deps) > 0L) {
        install_dev_deps (deps)
        ip <- data.frame (utils::installed.packages ())
        deps <- deps [which (!deps %in% ip$Package)]
    }

    return (deps)
}

#' Any packages which can not be installed from CRAN, as for example commonly
#' happens with spatial packages, are installed in this function as remote
#' dependencies directly from GitHub. This only works for packages which list a
#' GitHub URL.
#' @param devs List of 'dev' packages unable to be installed from CRAN
#' @noRd
install_dev_deps <- function (deps) {

    requireNamespace ("rvest")

    u_base <- "https://cran.r-project.org/package="

    for (p in deps) {

        # Make sure no previous deps have also installed 'p':
        ip <- data.frame (utils::installed.packages ())
        if (p %in% ip$Package)
            next

        u <- paste0 (u_base, p)
        x <- rvest::read_html (u)
        dat <- rvest::html_table (x)
        remote <- lapply (dat, function (i)
                          i [grep ("^(URL|BugReports)\\:", i$X1), ])
        remote <- do.call (rbind, remote)$X2
        remote <- gsub ("\\s*", "", unlist (strsplit (remote, ",")))
        remote <- grep ("^https\\:\\/\\/github\\.com", remote, value = TRUE)
        remote <- unique (gsub ("issues(\\/?)$", "", remote)) # BugReports URLs

        if (length (remote) > 1L)
            remote <- remote [1L]

        if (length (remote) > 0L) {
            tryCatch (remotes::install_github (remote, dependencies = TRUE),
                      error = function (e) NULL)
        } else {
            # previous entries in `deps` may make standard installation
            # possible:
            install.packages (p)
        }
    }
}
