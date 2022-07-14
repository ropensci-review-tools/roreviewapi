
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

    remotes::install_deps (
        pkgdir = path,
        dependencies = TRUE,
        upgrade = "always"
    )

    deps <- remotes::dev_package_deps (
        pkgdir = path,
        dependencies = TRUE
    )
    ip <- data.frame (utils::installed.packages ())

    deps <- deps$package [which (!deps$package %in% ip$Package)]
    if (length (deps) > 0L) {
        install_dev_deps (deps)
        ip <- data.frame (utils::installed.packages ())
        deps <- deps [which (!deps %in% ip$Package)]
    }

    out <- NULL

    if (methods::is (deps, "simpleError")) {

        out <- paste0 (
            "Initial examimnation of package 'DESCRIPTION'",
            " file failed with error\n:",
            out$message
        )

    } else if (length (deps) > 0L) {

        out <- paste0 (
            "Note: The following R packages were ",
            "unable to be installed on our system: [",
            paste0 (out, collapse = ", "),
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

    desc_file <- normalizePath (file.path (path, "DESCRIPTION"),
        mustWork = FALSE
    )
    if (!file.exists (desc_file)) {
        return (NULL)
    }

    install_scripts <- sysreqs_rspm (desc_file, os, os_release)

    if (is.integer (install_scripts)) {
        # use rhub (see #22)
        install_scripts <- NULL
        sysreqs <- sysreqs_rhub (desc_file)
        if (length (sysreqs) > 0L) {
            install_scripts <- paste0 (
                "apt-get install -y ",
                sysreqs
            )
        }
    }

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
    res <- httr::POST (url = u, body = httr::upload_file (desc_file))

    if (res$status != 200L) {
        return (res$status)
    }

    res <- httr::content (res, type = "text", encoding = "UTF-8")
    res <- jsonlite::fromJSON (res, simplifyDataFrame = TRUE)$dependencies

    install_scripts <- unique (unlist (res$install_scripts))

    return (install_scripts)
}

#' Get system requirements from rhub.io
#'
#' @param desc_file Path to DESC file
#' @return Character vector of system requirements, but not in full form of
#' install scripts.
#' @noRd
sysreqs_rhub <- function (desc_file) {

    d <- data.frame (read.dcf (desc_file))

    sr <- gsub ("\\s", "%20", d$SystemRequirements)

    if (length (sr) == 0L) {
        return (NULL)
    }

    rhub <- sprintf ("http://sysreqs.r-hub.io/map/%s", sr)

    res <- httr::GET (url = rhub)
    res <- httr::content (res, type = "text", encoding = "UTF-8")
    req <- jsonlite::fromJSON (res, simplifyDataFrame = TRUE)

    req <- lapply (req, function (i) i$platforms$DEB)
    req <- unique (unname (unlist (req)))
    req <- req [which (!is.na (req))]

    return (req)
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
        if (p %in% ip$Package) {
            next
        }

        u <- paste0 (u_base, p)
        x <- rvest::read_html (u)
        dat <- rvest::html_table (x)
        remote <- lapply (dat, function (i) {
            i [grep ("^(URL|BugReports)\\:", i$X1), ]
        })
        remote <- do.call (rbind, remote)$X2
        remote <- gsub ("\\s*", "", unlist (strsplit (remote, ",")))
        remote <- grep ("^https\\:\\/\\/github\\.com", remote, value = TRUE)
        remote <- unique (gsub ("issues(\\/?)$", "", remote)) # BugReports URLs

        if (length (remote) > 1L) {
            remote <- remote [1L]
        }

        if (length (remote) > 0L) {
            tryCatch (remotes::install_github (remote,
                dependencies = TRUE,
                upgrade = "never"
            ),
            error = function (e) NULL
            )
        } else {
            # previous entries in `deps` may make standard installation
            # possible:
            utils::install.packages (p)
        }
    }
}
