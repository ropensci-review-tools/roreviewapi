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

    remotes::install_deps (
        pkgdir = path,
        dependencies = TRUE,
        repos = repos,
        upgrade = "always"
    )

    deps <- upgradeable_pkgs (path, repos)
    if (nrow (deps) > 0L) {
        deps <- install_dev_deps (path, deps, repos)
    }

    out <- NULL

    if (methods::is (deps, "simpleError")) {

        out <- paste0 (
            "Initial examimnation of package 'DESCRIPTION'",
            " file failed with error\n:",
            out$message
        )

    } else if (nrow (deps) > 0L) {

        out <- paste0 (
            "Note: The following R packages were unable to be ",
            "installed/upgraded  on our system: [",
            paste0 (deps$package, collapse = ", "),
            "]; some checks may be unreliable."
        )
        out <- roreviewapi::post_to_issue (out, repo, issue_id)
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

upgradeable_pkgs <- function (path, repos) {

    deps <- remotes::dev_package_deps (
        pkgdir = path,
        dependencies = TRUE,
        repos = repos
    )
    deps [which (deps$diff != 0L), ]
}

#' Install required development versions of any packages.
#'
#' This uses the two standard ways to install remotes dependencies provided by
#' the \pkg{remotes} package:
#' 1. Direct installation from listed remote package repository sources;
#' 2. Installation through additional repository servers other than CRAN.
#'
#' @param deps List of 'dev' packages unable to be installed from CRAN
#' @return A zero-row data.frame if everything works, otherwise an error. The
#' zero-row data.frame is important because the output must be comparable with
#' that of 'upgradeable_pkgs()', which returns an empty 'data.frame' directly
#' from 'remotes::dev_package_deps()`, so must be an empty 'data.frame' here
#' too.
#' @noRd
install_dev_deps <- function (path, deps, repos) {

    ret <- data.frame (x = integer (0)) # dummy value; only checked with nrow

    # Install from standard remote locations:
    for (p in deps$package) {
        tryCatch (
            remotes::install_dev (p),
            error = function (e) NULL
        )
    }

    # Then refresh package upgrade list:
    deps <- upgradeable_pkgs (path, repos)
    if (nrow (deps) == 0L) {
        return (ret)
    }

    # Installation from remote repository servers:
    remote_repos <- lapply (deps$remote, function (i) i$repos)
    remote_repos <- unique (unlist (remote_repos))
    remote_repos <- remote_repos [which (!remote_repos %in% getOption ("repos"))]
    repos <- c (remote_repos, getOption ("repos"))

    # Install packages from any remote repository servers:
    if (length (repos) > 1L) { # other repos added to standard "CRAN" option

        # See #33
        is_docker <- Sys.getenv ("ROREV_CONTAINER") == "true" &&
            Sys.info () ["sysname"] == "Linux"

        if (is_docker) {
            requireNamespace ("bspm")
            bspm::disable ()
        }
        utils::install.packages (deps$package, repos = repos)
        if (is_docker) {
            bspm::enable ()
        }
    }

    return (upgradeable_pkgs (path, repos))
}
