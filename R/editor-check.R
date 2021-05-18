
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
    os <- Sys.getenv ("roreviewapi_os")
    os_release <- Sys.getenv ("roreviewapi_os_release")
    roreviewapi::pkgrep_install_deps (path, os, os_release)

    checks <- pkgcheck::pkgcheck (path)
    checks_md <- pkgcheck::checks_to_markdown (checks, render = FALSE)

    check <- paste0 (checks_md, collapse = "\n")
    attributes (check) <- attributes (checks_md)
    attr (check, "srr_okay") <- checks$srr$okay

    u <- roreviewapi::push_to_gh_pages (check)

    a <- attributes (check)
    check <- strsplit (check, "\n") [[1]]
    check <- gsub (a$network_file, u [1], check)
    if ("srr_report_file" %in% names (a))
        check <- gsub (a$srr_report_file, u [2], check)

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

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}
