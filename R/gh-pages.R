
#' Push static `html` files to `gh-pages` branch of this repo to serve via
#' GitHub pages.
#'
#' @param check Return result of \link{editor_check} function.
#' @return Vector of two paths containing URLs of the `srr` and `network` files.
#' @export
push_to_gh_pages <- function (check) {

    cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
    rorev_dir <- file.path (cache_dir, "roreviewapi")
    static_dir <- file.path (rorev_dir, "static")
    if (!dir.exists (rorev_dir)) {

        gert::git_clone (url = "https://github.com/ropenscilabs/roreviewapi",
                         path = rorev_dir)
    }

    gert::git_branch_checkout ("gh-pages", repo = rorev_dir)
    gert::git_pull (repo = rorev_dir)

    git_files <- gert::git_ls (repo = rorev_dir)
    git_files <- gsub (rorev_dir,
                       "",
                       git_files$path)

    # clean up any untracked files:
    all_files <- list.files (rorev_dir,
                             full.names = TRUE,
                             recursive = TRUE)
    all_files <- gsub (rorev_dir, "", all_files)
    all_files <- gsub (paste0 ("^", .Platform$file.sep), "", all_files)
    untracked <- all_files [which (!all_files %in% git_files)]
    untracked <- file.path (rorev_dir, untracked)

    if (length (untracked) > 0)
        chk <- file.remove (untracked)
    # TODO# also need to unlink empty directories

    files <- "network_file"
    out <- path_to_url (attr (check, "network_file"))
    if ("srr_report_file" %in% names (attributes (check))) {
        files <- c (files, "srr_report_file")
        out <- c (out,
                  path_to_url (attr (check, "srr_report_file")))
    }
    # get hash of current file to exclude from list of current files to be
    # removed
    this_hash <- utils::tail (strsplit (out [1], "pkgstats") [[1]], 1)
    this_hash <- gsub ("\\.html$", "", this_hash)

    files <- lapply (files,
                     function (i) move1file (attr (check, i), rorev_dir))
    files <- gsub (rorev_dir, "", unlist (files))
    files <- gsub (paste0 ("^", .Platform$file.sep), "", files)

    # rm any older files:
    older_files <- gsub ("\\.html$",
                         "",
                         basename (attr (check, "network_file")))
    if ("srr_report_file" %in% names (attributes (check))) {
        older_files <- c (older_files,
                          gsub ("\\.html$",
                                "",
                                basename (attr (check, "srr_report_file"))))
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

        files_full <- normalizePath (file.path (rorev_dir, files))
        for (f in files_full [which (!grepl ("\\.png$", files_full))])
            system2 ("dos2unix", f)

        a <- gert::git_add (files, repo = rorev_dir)
        git_updated <- git_updated | nrow (a) > 0
    }

    if (git_updated) {

        nm <- gsub ("pkgstats|\\.html$", "",
                    basename (attr (check, "network_file")))
        gert::git_commit (message = nm, repo = rorev_dir)
        gert::git_push (repo = rorev_dir)
    }

    gert::git_branch_checkout ("main", repo = rorev_dir)

    return (out)
}

#' Move one local file or directory to "static" directory of this repository.
#' @param path Path to local file or directory
#' @return Binary value(s) indicating whether file copying was successful.
#' @noRd
move1file <- function (path, rorev_dir) {

    fname <- basename (path)
    dir_to <- file.path (rorev_dir, "static")

    if (fname %in% list.files (dir_to)) {
        return (NULL)
    }

    base_path <- dirname (path)
    static_path <- file.path (rorev_dir, "static")
    flist <- list.files (base_path,
                         full.names = TRUE)
    fptn <- tools::file_path_sans_ext (path)
    f_from <- grep (fptn, flist, value = TRUE)
    # exclude auto-generated .js lib directory:
    f_from <- f_from [which (!dir.exists (f_from))]
    f_to <- gsub (base_path,
                  dir_to,
                  f_from)

    if (!dir.exists (dir_to))
        dir.create (dir_to, recursive = TRUE)

    file_index <- which (!dir.exists (f_from))
    dir_index <- which (dir.exists (f_from))
    chk <- file.copy (f_from [file_index],
                      f_to [file_index],
                      recursive = FALSE)
    chk <- file.copy (f_from [dir_index],
                      dirname (f_to [dir_index]),
                      recursive = TRUE)

    f_added <- c (f_to [file_index],
                  list.files (f_to [dir_index],
                              full.names = TRUE,
                              recursive = TRUE))

    return (f_added)

}

path_to_url <- function (path) {

    paste0 ("https://ropenscilabs.github.io/roreviewapi/static/",
            basename (path))
}
