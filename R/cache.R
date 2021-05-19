
#' check_cache
#'
#' Check whether a package has been cached, and if so, whether commits have been
#' added to the github repo since cached version.
#'
#' @note This function is not intended to be called directly, and is only
#' exported to enable it to be used within the \pkg{plumber} API.
#'
#' @param org Github organization
#' @param repo Github repository
#' @param cache_dir Directory in which packages are cached
#' @return FALSE If a package has previously been cached, and the github repo
#' has not changed; otherwise TRUE.
#' @export
check_cache <- function (org, repo, cache_dir = tempdir ()) {

    cmt <- pkgcheck::get_latest_commit (org = org, repo = repo)

    f <- file.path (cache_dir, "commit_oids.Rds")

    if (file.exists (f)) {

        dat <- readRDS (f)

    } else {

        dat <- data.frame (matrix (nrow = 0, ncol = 3))
        names (dat) <- c ("orgrepo", "oid", "authoredDate")

    }

    orgrepo <- paste0 (org, "/", repo)
    updated <- FALSE

    if (orgrepo %in% dat$orgrepo) {

        if (dat$oid [dat$orgrepo == orgrepo] != cmt$oid) {

            dat$oid [dat$orgrepo == orgrepo] <- cmt$oid
            dat$authoredDate [dat$orgrepo == orgrepo] <- cmt$authoredDate
            saveRDS (dat, f)
            updated <- TRUE
        }
    } else {

        dat <- rbind (dat, data.frame (orgrepo = orgrepo,
                                       oid = cmt$oid,
                                       authoredDate = cmt$authoredDate))
        saveRDS (dat, f)
        updated <- TRUE
    }

    return (updated)
}

#' Set up stdout & stderr cache files for `r_bg` process
#'
#' @param repourl The URL of the repo being checked
#' @return Vector of two strings holding respective local paths to `stdout` and
#' `stderr` files for `r_bg` process controlling the main \link{editor_check}
#' function.
#'
#' @note These files are needed for the \pkg{callr} `r_bg` process which
#' controls the main \link{editor_check} call. See
#' \url{https://github.com/r-lib/callr/issues/204}. The `stdout` and `stderr`
#' pipes from the process are stored in the cache directory so they can be
#' inspected via their own distinct endpoint calls.
#' @export
stdout_stderr_cache <- function (repourl) {

    org <- utils::tail (strsplit (repourl, "/") [[1]], 2) [1]
    repo <- utils::tail (strsplit (repourl, "/") [[1]], 1)

    cmt <- pkgcheck::get_latest_commit (org = org, repo = repo)
    oid <- substring (cmt$oid, 1, 8)

    temp_dir <- file.path (Sys.getenv ("pkgcheck_cache_dir"), "templogs")
    if (!dir.exists (temp_dir))
        dir.create (temp_dir, recursive = TRUE)

    sout <- file.path (temp_dir, paste0 (repo, "_", oid, "_stdout"))
    serr <- file.path (temp_dir, paste0 (repo, "_", oid, "_stderr"))

    otherlogs <- list.files (temp_dir,
                             pattern = repo,
                             full.names = TRUE)
    if (length (otherlogs) > 0)
        file.remove (otherlogs)

    return (list (stdout = sout, stderr = serr))
}
