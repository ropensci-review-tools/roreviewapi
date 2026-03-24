#' Body of main 'pkgmatch' response
#'
#' @param repourl The URL for the repo being matched, potentially including
#' full path to non-default branch.
#' @param repo The 'context.repo' parameter defining the repository from which
#' the command was invoked, passed in 'org/repo' format.
#' @param issue_id The id (number) of the issue from which the command was
#' invoked.
#' @param n_top Return this number of top-matches packages.
#' @param post_to_issue Integer value > 0 will post results back to issue (via
#' 'gh' cli); otherwise just return character string with result.
#' @return If `!post_to_issue`, a markdown-formatted response body, otherwise
#' URL of the issue comment to which response body has been posted.
#' @family main
#' @export
pkgmatch_repo <- function (repourl, repo, issue_id, n_top = 5L, post_to_issue = TRUE) {

    # to find 'output_pkgchk_' fns, and set options("pkgcheck.cache_dir")
    requireNamespace ("pkgmatch", quietly = TRUE)
    if (!isNamespaceLoaded ("pkgmatch")) {
        attachNamespace ("pkgmatch")
    }
    convert_path <- utils::getFromNamespace ("convert_path", "pkgcheck")
    url_exists <- utils::getFromNamespace ("url_exists", "pkgcheck")

    is_r_pkg <- TRUE
    if (grepl ("github", repourl)) {
        is_r_pkg <- roreviewapi::url_is_r_pkg (repourl)
    }

    branch <- roreviewapi::get_branch_from_url (repourl)
    branch_is_default <- is.null (branch)
    if (!branch_is_default) {
        repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
    }
    if (!is_r_pkg && url_exists (repourl)) {
        # Clone to see whether pkg is in sub-dir:
        path <- tryCatch (
            roreviewapi::dl_gh_repo (u = repourl, branch = branch),
            error = function (e) NULL
        )
        if (!is.null (path)) {
            path <- tryCatch (
                convert_path (path),
                error = function (e) NULL
            )
        }
        is_r_pkg <- !is.null (path)
    }

    if (!is_r_pkg) {

        matches <- tryCatch (
            stop ("Repository link does not appear to be an R package", call. = FALSE),
            error = function (e) e
        )

    } else {

        path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)

        matches_cran <- tryCatch (
            pkgmatch::pkgmatch_similar_pkgs (path, corpus = "cran"),
            error = function (e) e
        )
        matches_ros <- tryCatch (
            pkgmatch::pkgmatch_similar_pkgs (path, corpus = "ropensci"),
            error = function (e) e
        )
    }

    if (!is.null (matches_cran) && !is.null (matches_ros)) {

        out <- c (
            "## Five most similar rOpenSci packages",
            "",
            roreviewapi::ros_to_list (matches_ros, n = n_top),
            "",
            "## Five most similar CRAN packages",
            "",
            roreviewapi::cran_to_list (matches_cran, n = n_top)
        )

    } else {

        out <- paste0 ("Package matching failed for [", repourl, "]")
    }

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}

#' Convert names of CRAN packages to markdown-formatted list.
#'
#' This function is exported because it needs to be called in the main plumber
#' endpoint function.
#'
#' @param matches A \pkg{pkgmatch} `data.frame` object with columns of
#' ("package", "version", "rank").
#' @param n Number of matches to return in list.
#' @export
cran_to_list <- function (matches, n = 5L) {

    ap <- tools::CRAN_package_db ()
    ap_n <- ap [match (matches$package [seq_len (n)], ap$Package), ]
    u_base <- "https://cran.r-project.org/package="
    vapply (seq_len (n), function (i) {
        paste0 (
            "- [",
            matches$package [i],
            "](",
            u_base,
            matches$package [i],
            ") _'",
            ap_n$Title [i],
            "_'  (v",
            matches$version [i],
            ", published ",
            gsub ("\\s.*$", "", ap_n$Published [i]),
            ")"
        )
    }, character (1L), USE.NAMES = FALSE)
}

#' Convert names of rOpenSci packages to markdown-formatted list.
#'
#' This function is exported because it needs to be called in the main plumber
#' endpoint function.
#'
#' @param matches A \pkg{pkgmatch} `data.frame` object with columns of
#' ("package", "version", "rank").
#' @param n Number of matches to return in list.
#' @export
ros_to_list <- function (matches, n = 5L) {

    u <- "https://ropensci.r-universe.dev/api/packages"
    ros_pkgs <- jsonlite::read_json (u, simplifyVector = TRUE)
    ros_pkgs <- ros_pkgs [match (matches$package [seq_len (n)], ros_pkgs$Package), ]

    vapply (seq_len (n), function (i) {
        rel_i <- ros_pkgs$`_releases` [i] [[1]]
        rel_txt <- "(No releases to date.)"
        if (!is.null (rel_i)) {
            d_latest <- which.max (as.Date (rel_i$date))
            rel_txt <- paste0 (
                "(v",
                rel_i$version [d_latest],
                ", released ",
                rel_i$date [d_latest],
                ")"
            )
        }
        paste0 (
            "- [",
            matches$package [i],
            "](",
            ros_pkgs$`_pkgdown` [i],
            ") _'",
            ros_pkgs$Title [i],
            "_'  ",
            rel_txt
        )
    }, character (1L), USE.NAMES = FALSE)
}
