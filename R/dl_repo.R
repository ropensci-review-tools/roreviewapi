#' Download a GitHub repo to local cache
#'
#' @param u URL of GitHub repository
#' @return Path to locally cached '.zip' version of repository
#' @export
dl_gh_repo <- function (u) {

    repo <- utils::tail (strsplit (u, "/") [[1]], 1)
    org <- utils::tail (strsplit (u, "/") [[1]], 2) [1]

    cache_dir <- Sys.getenv ("cache_dir")
    repo_updated <- roreviewapi::check_cache (org, repo, cache_dir)
    branch <- pkgcheck::get_default_branch (org, repo)

    download_repo <- function (u, repo, branch) {

        if (substring (u, nchar (u), nchar (u)) == "/")
            u <- substring (u, 1, nchar (u) - 1)
        #u <- paste0 (u, "/archive/", branch, ".zip")

        f <- file.path (cache_dir, repo)
        if (file.exists (f))
            chk <- unlink (f, recursive = TRUE)
        #f <- file.path (cache_dir, paste0 (repo, "-", branch, ".zip"))
        #utils::download.file (u, destfile = f)
        gert::git_clone (url = u, path = f)
        return (f)
    }

    f <- file.path (cache_dir, repo)

    if (!file.exists (f) | repo_updated) {

        message ("Cloning repo ...")
        f <- download_repo (u, repo, branch) # nolint
    }

    return (f)
}
