#' Download a GitHub repo to local cache
#'
#' @param u URL of GitHub repository
#' @return Path to locally cached '.zip' version of repository
#' @family github
#' @export
dl_gh_repo <- function (u) {

    repo <- utils::tail (strsplit (u, "/") [[1]], 1)
    org <- utils::tail (strsplit (u, "/") [[1]], 2) [1]

    cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
    if (!dir.exists (cache_dir)) {
        dir.create (cache_dir, recursive = TRUE)
    }
    repo_updated <- roreviewapi::check_cache (org, repo, cache_dir)
    branch <- pkgcheck::get_default_github_branch (org, repo)

    clone_repo <- function (u, repo, branch) {

        if (substring (u, nchar (u), nchar (u)) == "/") {
            u <- substring (u, 1, nchar (u) - 1)
        }

        f <- file.path (cache_dir, repo)
        if (dir.exists (f)) {
            chk <- unlink (f, recursive = TRUE)
        }
        gert::git_clone (url = u, path = f)
        return (f)
    }

    path <- file.path (cache_dir, repo)

    if (!dir.exists (path) | repo_updated) {

        message ("Cloning repo ...")
        path <- clone_repo (u, repo, branch)
    }

    rm_renv_files (path)

    return (path)
}

rm_renv_files <- function (path) {

    flist <- list.files (path,
                         recursive = TRUE,
                         full.names = TRUE)

    renv <- grep ("renv\\.lock$", flist, value = TRUE)
    if (length (renv) > 0L) {

        chk <- file.remove (renv)
        renv_dir <- file.path (path, "renv")
        if (dir.exists (renv_dir)) {
            unlink (renv_dir, recursive = TRUE)
        }
    }
}
