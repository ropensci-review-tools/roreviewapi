
#' Body of main 'editorcheck' response
#'
#' @param repourl The URL for the repo being checked
#' @param repo The 'context.repo' parameter defining the repository from which
#' the command was invoked.
#' @param issue_id The id of the issue form which the command was invoked
#' @param post_to_issue Integer value > 0 will post results back to issue (via
#' 'gh' cli); otherwise just return character string with result.
#' @return If `!post_to_issue`, a markdown-formatted response body from static
#' package checks, otherwise URL of the issue comment to which response body has
#' been posted.
#' @export
editor_check <- function (repourl, repo, issue_id, post_to_issue = TRUE) {

    path <- roreviewapi::dl_gh_repo (repourl)

    # Have to pre-install any system dependencies here because this is the
    # single call point for the r_bg process
    os <- Sys.getenv ("ROREVIEWAPI_OS")
    os_release <- Sys.getenv ("ROREVIEWAPI_OS_RELEASE")
    if (os != "" & os_release != "")
        roreviewapi::pkgrep_install_deps (path, os, os_release)

    checks <- tryCatch (pkgcheck::pkgcheck (path),
                        error = function (e) e)

    if (!methods::is (checks, "error")) {

        out <- collate_editor_check (checks)

    } else {

        u <- file_pkgcheck_issue (repourl, repo, issue_id)

        out <- paste0 ("Oops, something went wrong with our automatic package ",
                       "checks. Our developers [have been notified](", u,
                       ") and package checks will appear here as soon as ",
                       "we've resolved the issue. Sorry for any inconvenience.")

    }

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}

collate_editor_check <- function (checks) {

    checks_md <- pkgcheck::checks_to_markdown (checks, render = FALSE)

    check <- paste0 (checks_md, collapse = "\n")
    a <- attributes (check) <- attributes (checks_md)
    attr (check, "srr_okay") <- checks$srr$okay

    check <- strsplit (check, "\n") [[1]]
    attributes (check) <- a

    u <- push_to_gh_pages (check)

    if (!is.null (a$network_file)) { # pkg has a network, and network_file

        check <- gsub (a$network_file, u$network_file, check)
    }

    if (!is.null (a$srr_report_file)) {

        check <- gsub (a$srr_report_file, u$srr_report_file, check)
    }

    eic_instr <- c ("",
                    "---",
                    "",
                    "## Editor-in-Chief Instructions:",
                    "")

    srr_okay <- !"srr_okay" %in% names (a)
    if (!srr_okay)
        srr_okay <- a$srr_okay

    if (!srr_okay) {

        eic_instr <- c (eic_instr,
                        paste0 ("Processing may not proceed until the 'srr' ",
                                "issues identified above have been adressed."))
    }

    if (!a$checks_okay) {

        eic_instr <- c (eic_instr,
                        paste0 ("Processing may not proceed until the ",
                                "items marked with ",
                                roreviewapi::symbol_crs (),
                                " have been resolved."))
    } else {

        eic_instr <- c (eic_instr,
                        paste0 ("This package is in top shape and may ",
                                "be passed on to a handling editor"))
    }

    noteworthy <- ifelse (a$is_noteworthy,
                          c (paste0 ("This package has some noteworthy ",
                                     "properties, see 'Package Statistics' ",
                                     "details below"),
                             ""),
                          "")

    out <- paste0 (c (check, eic_instr), collapse = "\n")

    return (out)
}

#' File an issue in the GitHub `pkgcheck` repo on any packages which fail checks
#'
#' @noRd
file_pkgcheck_issue <- function (repourl = NULL,
                                 repo = "ropensci/software-review",
                                 issue_id = NULL) {

    user <- get_github_user ()

    if (!user %in% authorized_users)
        return (NULL)

    if (grepl ("github", repo))
        repo <- gsub ("https://github.com/", "", repo)

    pkg_name <- utils::tail (strsplit (repourl, "/") [[1]], 1)
    # Note that title has to be quoted. body is okay b/c read from file.
    title <- paste0 ("'roreviewapi fail for ", pkg_name, " package'")
    body <- paste0 ("Automatic checks failed for submission of ", pkg_name,
                    " package.\n\n",
                    "Package URL is [", 
                    gsub ("^https\\:\\/\\/", "", repourl),
                    "](", repourl, "), submitted to [",
                    repo, "#", issue_id, "](https://github.com/",
                    repo, "/issues/", issue_id, ")")
    label <- "bug"

    # Pasting comments straight to `gh --body` fails with any internally nested
    # single- or double-quotes, but all works well when read from file, so:
    f <- tempfile (fileext = ".txt")
    writeLines (body, f)

    args <- list ("issue",
                  "create",
                  "--repo", repo,
                  "--title", title,
                  "--body-file", f,
                  "--label", label)

    # This returns the URL of the opened issue
    u <- system2 ("gh", args = args, stdout = TRUE, wait = TRUE)

    return (u)
}
