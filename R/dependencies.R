#' Install all system and package dependencies of an R package
#'
#' @param path Path to local file or directory
#' @inheritParams editor_check
#' @return Hopefully a character vector of length zero, otherwise a message
#' detailing any R packages unable to be installed.
#' @family utils
#' @export
pkgrep_install_deps <- function (path, repo, issue_id) {

    os <- Sys.getenv ("ROREVIEWAPI_OS")
    os_release <- Sys.getenv ("ROREVIEWAPI_OS_RELEASE")

    if (os == "" || os_release == "") {
        return (NULL)
    }

    install_sys_deps (path, os, os_release)

    repos <- c (getOption ("repos"), BiocManager::repositories ())

    utils::update.packages (ask = FALSE)

    out <- tryCatch (
        pak::pkg_install (
            pkgdir = path,
            dependencies = TRUE
        ),
        error = function (e) e
    )

    if (methods::is (out, "simpleError")) {

        out <- paste0 (
            "Initial installation of package 'DESCRIPTION'",
            " file failed with error\n:",
            out$message
        )

    } else {

        out <- NULL
    }

    return (out)
}

#' Modified version of remotes::system_requirements that uses jsonlite rather
#' than the remotes inbuilt json parser, because of
#' https://github.com/r-lib/remotes/issues/663
#'
#' This code is directly filched from
#' https://github.com/r-lib/remotes/blob/main/R/system_requirements.R
#' and directly calls the rstudio endpoint at
#' https://packagemanager.rstudio.com/__api__/swagger/index.html#/default/post_repos__id__sysreqs_
#'
#' @inheritParams pkgrep_install_deps
#' @noRd
install_sys_deps <- function (path, os, os_release) {

    desc_file <- fs::path_abs (fs::path (path, "DESCRIPTION"))
    if (!fs::file_exists (desc_file)) {
        return (NULL)
    }

    install_scripts <- sysreqs_rspm (desc_file, os, os_release)

    if (length (install_scripts) > 0L) {
        tmp <- lapply (install_scripts, system) # nolint
    }
}

#' Get system requirements from RSPM
#'
#' @param desc_file Path to DESC file
#' @return RSPM scripts to install all system requirements
#' @noRd
sysreqs_rspm <- function (desc_file, os, os_release) {

    rspm <- "https://packagemanager.rstudio.com"
    rspm_repo_id <- "1" # cran
    rspm_repo_url <- sprintf ("%s/__api__/repos/%s", rspm, rspm_repo_id)

    u <- sprintf (
        "%s/sysreqs?distribution=%s&release=%s&suggests=true",
        rspm_repo_url,
        os,
        os_release
    )
    req <- httr2::request (u)
    req <- httr2::req_headers (req, "Content-Type" = "application/json")
    req <- httr2::req_body_file (req, path = desc_file)
    resp <- httr2::req_perform (req)
    httr2::resp_check_status (resp)

    body <- httr2::resp_body_json (resp, simplifyVector = TRUE)

    install_scripts <- unique (unlist (body$dependencies$install_scripts))

    return (install_scripts)
}
