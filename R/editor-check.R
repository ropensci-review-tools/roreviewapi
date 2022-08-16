
#' Body of main 'editorcheck' response
#'
#' @param repourl The URL for the repo being checked, potentially including full
#' path to non-default branch.
#' @param repo The 'context.repo' parameter defining the repository from which
#' the command was invoked, passed in 'org/repo' format.
#' @param issue_id The id (number) of the issue from which the command was
#' invoked.
#' @param post_to_issue Integer value > 0 will post results back to issue (via
#' 'gh' cli); otherwise just return character string with result.
#' @return If `!post_to_issue`, a markdown-formatted response body from static
#' package checks, otherwise URL of the issue comment to which response body has
#' been posted.
#' @family main
#' @export
editor_check <- function (repourl, repo, issue_id, post_to_issue = TRUE) {

    # to find 'output_pkgchk_' fns, and set options("pkgcheck.cache_dir")
    if (!isNamespaceLoaded ("pkgcheck")) {
        attachNamespace ("pkgcheck")
    }

    branch <- roreviewapi::get_branch_from_url (repourl)
    if (!is.null (branch)) {
        repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
    }

    path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)

    deps <- roreviewapi::pkgrep_install_deps (path, repo, issue_id)
    if (any (grepl ("failed with error", deps))) {
        return (deps)
    }

    updates <- roreviewapi::rorevapi_updated_pkgs (path)
    if (length (updates) > 0L) {
        utils::update.packages (oldPkgs = updates, ask = FALSE)
    }

    checks <- tryCatch (
        pkgcheck::pkgcheck (path),
        error = function (e) e
    )

    if (!methods::is (checks, "error")) {

        out <- roreviewapi::collate_editor_check (checks)

    } else {

        if (grepl ("does not appear to be an R package", checks$message)) {

            out <- paste0 ("[", repourl, "] does not appear to be an R package")

        } else {

            out <- paste0 (
                "Oops, something went wrong with our automatic ",
                "package checks. Our developers have been notified ",
                "and package checks will appear here as soon as ",
                "we've resolved the issue. Sorry for any inconvenience."
            )
        }
    }

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}

#' Collate list of checks to single concatenated character string
#'
#' @param checks Result of `pkgcheck::pgkcheck` function
#' @return Single character
#' @note Exported only for access by plumber; not intended for general external
#' usage.
#' @family main
#' @export
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

    eic_instr <- c (
        "",
        "---",
        "",
        "## Editor-in-Chief Instructions:",
        ""
    )

    srr_okay <- !"srr_okay" %in% names (a)
    if (!srr_okay) {
        srr_okay <- a$srr_okay
    }

    if (!srr_okay) {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "Processing may not proceed until the 'srr' ",
                "issues identified above have been adressed."
            )
        )
    }

    if (!a$checks_okay) {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "Processing may not proceed until the ",
                "items marked with ",
                roreviewapi::symbol_crs (),
                " have been resolved."
            )
        )
    } else {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "This package is in top shape and may ",
                "be passed on to a handling editor"
            )
        )
    }

    noteworthy <- ifelse (a$is_noteworthy,
        c (
            paste0 (
                "This package has some noteworthy ",
                "properties, see 'Package Statistics' ",
                "details below"
            ),
            ""
        ),
        ""
    )

    out <- paste0 (c (check, eic_instr), collapse = "\n")

    return (out)
}
