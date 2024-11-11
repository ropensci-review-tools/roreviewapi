#' Download a GitHub repo to local cache
#'
#' @param u URL of GitHub repository
#' @param branch Checkout specified (non-default) branch of repo.
#' @return Path to locally cached '.zip' version of repository
#' @family github
#' @export
dl_gh_repo <- function (u, branch = NULL) {

    u <- rm_subdir_from_url (u)

    repo <- utils::tail (strsplit (u, "/") [[1]], 1)
    org <- utils::tail (strsplit (u, "/") [[1]], 2) [1]

    cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
    if (!fs::dir_exists (cache_dir)) {
        fs::dir_create (cache_dir, recurse = TRUE)
    }
    repo_updated <- roreviewapi::check_cache (org, repo, cache_dir)
    if (is.null (branch)) {
        branch <- pkgcheck::get_default_github_branch (org, repo)
    }

    clone_repo <- function (u, repo, branch) {

        if (substring (u, nchar (u), nchar (u)) == "/") {
            u <- substring (u, 1, nchar (u) - 1)
        }

        f <- fs::path (cache_dir, repo)
        if (fs::dir_exists (f)) {
            fs::dir_delete (f)
        }
        gert::git_clone (url = u, path = f, branch = branch)
        return (f)
    }

    path <- fs::path (cache_dir, repo)

    if (!fs::dir_exists (path) | repo_updated) {

        message ("Cloning repo ...")
        path <- clone_repo (u, repo, branch)
    }

    return (path)
}

rm_subdir_from_url <- function (u) {

    subdir <- get_subdir_from_url (u)
    if (length (subdir) > 0L) {
        domains <- strsplit (u, "\\/+") [[1]] [-1] # rm "https"
        i <- which (domains == "tree")
        if (length (i) == 0L) {
            stop ("URL [", u, "] is improperly formatted.", call. = FALSE)
        }
        u <- paste0 (
            "https://",
            paste0 (domains [seq_len (i - 1)], collapse = "/")
        )
    }

    return (u)
}
