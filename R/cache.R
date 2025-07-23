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
#' @family utils
#' @export
check_cache <- function (org, repo, cache_dir = fs::path_temp ()) {

    cmt <- pkgcheck::get_latest_commit (org = org, repo = repo) [[1]]

    if (is.null (cmt)) { # If not GitHub; plus #21
        cmt <- list (
            oid = "",
            authoredDate = ""
        )
    }

    f <- fs::path (cache_dir, "commit_oids.Rds")

    if (fs::file_exists (f)) {

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

        dat <- rbind (dat, data.frame (
            orgrepo = orgrepo,
            oid = cmt$oid,
            authoredDate = cmt$authoredDate
        ))
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
#'
#' @family utils
#' @export
stdout_stderr_cache <- function (repourl) {

    branch <- roreviewapi::get_branch_from_url (repourl)
    if (!is.null (branch)) {
        repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
    }

    org <- utils::tail (strsplit (repourl, "/") [[1]], 2) [1]
    repo <- utils::tail (strsplit (repourl, "/") [[1]], 1)

    cmt <- pkgcheck::get_latest_commit (org = org, repo = repo, branch) [[1]]
    not_github_repo <- (is.null (cmt))
    if (not_github_repo) {
        path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)
        info <- gert::git_info (path)
        cmt <- list (oid = info$commit)
    }
    oid <- substring (cmt$oid, 1, 8)

    temp_dir <- fs::path (Sys.getenv ("PKGCHECK_CACHE_DIR"), "templogs")
    if (!fs::dir_exists (temp_dir)) {
        fs::dir_create (temp_dir, recurse = TRUE)
    }

    sout <- fs::path (temp_dir, paste0 (repo, "_", oid, "_stdout"))
    serr <- fs::path (temp_dir, paste0 (repo, "_", oid, "_stderr"))

    otherlogs <- fs::dir_ls (temp_dir,
        regexp = repo
    )
    otherlogs <- otherlogs [which (!grepl (oid, otherlogs))]
    if (length (otherlogs) > 0) {
        fs::file_delete (otherlogs)
    }

    return (list (stdout = sout, stderr = serr))
}
