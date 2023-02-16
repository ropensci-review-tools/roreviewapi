#' Push static `html` files to `gh-pages` branch of this repo to serve via
#' GitHub pages.
#'
#' @param check Return result of \link{editor_check} function.
#' @return Vector of two paths containing URLs of the `srr` and `network` files.
#' @family ropensci
#' @export
push_to_gh_pages <- function (check) {

    out <- list ()

    cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
    rorev_dir <- fs::path (cache_dir, "roreviewapi")

    if (!fs::dir_exists (rorev_dir)) {

        gert::git_clone (
            url = "https://github.com/ropensci-review-tools/roreviewapi",
            path = rorev_dir
        )
    }

    gert::git_branch_checkout ("gh-pages", repo = rorev_dir)
    gert::git_pull (repo = rorev_dir)

    git_files <- gert::git_ls (repo = rorev_dir)
    git_files <- gsub (
        rorev_dir,
        "",
        git_files$path
    )

    # clean up any untracked files:
    all_files <- fs::dir_ls (rorev_dir, recurse = TRUE, type = "file")
    all_files <- gsub (rorev_dir, "", all_files)
    all_files <- gsub (paste0 ("^", .Platform$file.sep), "", all_files)
    untracked <- all_files [which (!all_files %in% git_files)]
    untracked <- fs::path (rorev_dir, untracked)

    if (length (untracked) > 0L) {
        tryCatch (
            fs::file_delete (untracked),
            error = function (e) NULL
        )
    }
    # TODO# also need to unlink empty directories

    files <- NULL
    # pkgs with no networks do not have 'network_file' attribute:
    if ("network_file" %in% names (attributes (check))) {

        files <- "network_file"
        out$network_file <- path_to_url (attr (check, "network_file"))
        # get hash of current file to exclude from list of current files to be
        # removed
        this_hash <- utils::tail (strsplit (out$network_file, "pkgstats") [[1]], 1)
        this_hash <- gsub ("\\.html$", "", this_hash)

    } else {

        hash_line <- grep ("^git\\shash\\:", check, value = TRUE)
        hash <- regmatches (
            hash_line,
            gregexpr ("\\[.*\\]", hash_line)
        ) [[1]]
        this_hash <- gsub ("^\\[|\\]$", "", hash)
    }

    if ("srr_report_file" %in% names (attributes (check))) {
        files <- c (files, "srr_report_file")
        out$srr_report_file <- path_to_url (attr (check, "srr_report_file"))
    }

    files <- lapply (
        files,
        function (i) move1file (attr (check, i), rorev_dir)
    )
    files <- gsub (rorev_dir, "", unlist (files))
    files <- gsub (paste0 ("^", .Platform$file.sep), "", files)

    # rm any older files:
    older_files <- NULL
    if ("network_file" %in% names (attributes (check))) {

        older_files <- gsub (
            "\\.html$",
            "",
            fs::path_file (attr (check, "network_file"))
        )
    }

    if ("srr_report_file" %in% names (attributes (check))) {

        older_files <- c (
            older_files,
            gsub (
                "\\.html$",
                "",
                basename (attr (check, "srr_report_file"))
            )
        )
    }

    older_files <- older_files [which (!grep (this_hash, older_files))]

    index <- lapply (older_files, function (i) grep (i, git_files))
    index <- sort (unique (unlist (index)))

    git_updated <- FALSE

    if (length (index) > 0) {

        r <- gert::git_rm (git_files [index], repo = rorev_dir)
        git_updated <- TRUE
    }

    # then add any new files:
    files <- files [which (!files %in% git_files)]

    if (length (files) > 0) {

        files_full <- fs::path_abs (fs::path (rorev_dir, files))
        for (f in files_full [which (!grepl ("\\.png$", files_full))]) {
            system2 ("dos2unix", f)
        }

        a <- gert::git_add (files, repo = rorev_dir)
        git_updated <- git_updated | nrow (a) > 0
    }

    if (git_updated) {

        nm <- gsub (
            "pkgstats|\\.html$", "",
            basename (attr (check, "network_file"))
        )
        gert::git_commit (message = nm, repo = rorev_dir)

        # push with https://username@github and token as password:
        conf <- gert::git_config (repo = rorev_dir)
        uname <- conf$value [conf$name == "user.name"]
        remote <- conf$value [conf$name == "remote.origin.url"]
        remote <- gsub (
            "https://",
            paste0 ("https://", uname, "@"),
            remote
        )
        tok <- Sys.getenv ("GITHUB_TOKEN")
        gert::git_push (repo = rorev_dir, remote = remote, password = tok)
    }

    gert::git_branch_checkout ("main", repo = rorev_dir)

    return (out)
}

#' Move one local file or directory to "static" directory of this repository.
#' @param path Path to local file or directory
#' @return Binary value(s) indicating whether file copying was successful.
#' @noRd
move1file <- function (path, rorev_dir) {

    fname <- fs::path_file (path)
    dir_to <- fs::path (rorev_dir, "static")

    if (fname %in% fs::dir_ls (dir_to)) {
        return (NULL)
    }

    base_path <- fs::path_dir (path)
    static_path <- fs::path (rorev_dir, "static")
    flist <- fs::dir_ls (base_path)
    fptn <- tools::file_path_sans_ext (path)
    f_from <- grep (fptn, flist, value = TRUE)
    # exclude auto-generated .js lib directory:
    f_from <- f_from [which (!fs::dir_exists (f_from))]
    f_to <- gsub (
        base_path,
        dir_to,
        f_from
    )

    if (!fs::dir_exists (dir_to)) {
        fs::dir_create (dir_to, recurse = TRUE)
    }

    file_index <- which (!fs::dir_exists (f_from))
    dir_index <- which (fs::dir_exists (f_from))
    chk <- fs::file_copy (
        f_from [file_index],
        f_to [file_index]
    )
    chk <- fs::file_copy (
        f_from [dir_index],
        fs::path_dir (f_to [dir_index])
    )

    f_added <- c (
        f_to [file_index],
        fs::dir_ls (
            f_to [dir_index],
            recurse = TRUE
        )
    )

    return (f_added)

}

path_to_url <- function (path) {

    paste0 (
        "https://ropensci-review-tools.github.io/roreviewapi/static/",
        fs::path_file (path)
    )
}
