
#' Push static `html` files to `gh-pages` branch of this repo to serve via
#' GitHub pages.
#'
#' @param check Return result of \link{editor_check} function.
#' @return Vector of two paths containing URLs of the `srr` and `network` files.
#' @export
push_to_gh_pages <- function (check) {

    wd <- setwd (here::here ())
    sdir <- file.path (here::here (), "static")

    gert::git_branch_checkout ("gh-pages")
    gert::git_pull ()

    updated <- vapply (c ("network_file", "srr_report_file"),
                       function (i) move1file (attr (check, i)),
                       logical (1))

    if (all (updated)) {

        flist <- file.path ("static", list.files (sdir, recursive = TRUE))
        for (f in flist)
            system2 ("dos2unix", f)
        gert::git_add (flist)
        nm <- gsub ("pkgstats|\\.html$", "",
                    basename (attr (check, "network_file")))
        gert::git_commit (message = nm)
        gert::git_push ()
    }

    gert::git_branch_checkout ("main")

    setwd (wd)

    return (c (path_to_url (attr (check, "network_file")),
               path_to_url (attr (check, "srr_report_file"))))
}

#' Move one local file or directory to "static" directory of this repository.
#' @param path Path to local file or directory
#' @return Binary value(s) indicating whether file copying was successful.
#' @noRd
move1file <- function (path) {

    fname <- basename (path)
    f_to <- file.path (here::here (), "static")
    if (fname %in% list.files (f_to)) {
        return (FALSE)
    }

    if (grepl ("pkgstats", fname)) {
        fall <- file.path (dirname (path),
                           tools::file_path_sans_ext (fname))
        flist <- list.files (dirname (path), full.names = TRUE)
        f_from <- grep (fall, flist, value = TRUE)
    } else {
        f_from <- path
    }

    if (!dir.exists (f_to))
        dir.create (f_to, recursive = TRUE)
    ret <- unique (file.copy (f_from, f_to, recursive = TRUE))

    if (length (ret) > 1)
        warning ("Files only able to be partially copied")

    return (ret [1])

}

path_to_url <- function (path) {

    paste0 ("https://ropenscilabs.github.io/roreviewapi/static/",
            basename (path))
}
