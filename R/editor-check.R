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
    convert_path <- utils::getFromNamespace ("convert_path", "pkgcheck")
    url_exists <- getFromNamespace ("url_exists", "pkgcheck")

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

        checks <- tryCatch (
            stop ("Repository link does not appear to be an R package", call. = FALSE),
            error = function (e) e
        )

    } else {

        path_dl <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)
        path <- convert_path (path_dl)

        deps <- roreviewapi::pkgrep_install_deps (path, repo, issue_id)
        if (any (grepl ("failed with error", deps))) {
            return (deps)
        }

        # Need to pass original path here to ensure any sub-dir info
        # is added in final check reports:
        checks <- tryCatch (
            pkgcheck::pkgcheck (path_dl),
            error = function (e) e
        )
    }

    if (!methods::is (checks, "error")) {

        attr (checks, "branch_is_default") <- branch_is_default
        attr (checks, "repo") <- repo
        attr (checks, "issue_num") <- issue_id
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

    a <- attributes (checks)
    checks_md <- pkgcheck::checks_to_markdown (checks, render = FALSE) |>
        add_non_default_branch_info (checks)
    if (pkg_in_subdir (checks_md)) {
        if (!issue_template_has_subdir (a$repo, a$issue_num)) {
            checks_md <- edit_issue_with_subdir (checks_md, a$repo, a$issue_num)
        }
    }

    out <- paste0 (checks_md, collapse = "\n")
    a <- attributes (checks_md)
    if ("srr" %in% names (checks$info)) {
        a$srr_okay <- checks$info$srr$okay
    }

    out <- strsplit (out, "\n") [[1]]
    attributes (out) <- a

    git_hash <- out [grep ("^git\\shash", out)]
    has_git_hash <- !grepl ("\\[\\]", git_hash)
    if (has_git_hash) {
        u <- push_to_gh_pages (out)
        if (!u$push_success) {
            out <- paste0 (
                "Sorry, something went wrong trying to push function ",
                "call network to GitHub. Please try again later."
            )
            return (out)
        }
    } else {
        u <- list (network_file = "", srr_report_file = "")
    }

    out <- update_file_paths (out, a$network_file, u$network_file) |>
        update_file_paths (a$srr_report_file, u$srr_report_file)

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

    eic_instr <- add_eic_srr_info (eic_instr, srr_okay) |>
        add_checks_okay_info (a$checks_okay) |>
        add_noteworthy (a$is_noteworthy)

    out <- paste0 (c (out, eic_instr), collapse = "\n")

    return (out)
}

add_non_default_branch_info <- function (checks_md, checks) {

    a <- attributes (checks_md)

    branch_is_default <- !isFALSE (attr (checks, "branch_is_default"))
    if (!branch_is_default) {
        checks_md [1] <- paste0 (
            checks_md [1],
            " on branch '",
            checks$info$git$branch,
            "'"
        )
    }

    attributes (checks_md) <- a

    return (checks_md)
}

pkg_in_subdir <- function (checks_md) {

    # String from pkgcheck/R/format-checks.R, in 'get_subdir_text()' function:
    ptn <- "R\\spackage\\sis\\sin\\sthe.*sub\\-directory"
    any (grepl (ptn, checks_md))
}

edit_issue_with_subdir <- function (checks_md, orgrepo, issue_num) {

    a <- attributes (checks_md)

    # String from pkgcheck/R/format-checks.R, in 'get_subdir_text()' function:
    ptn <- "R\\spackage\\sis\\sin\\sthe.*sub\\-directory"
    index <- grep (ptn, checks_md)

    if (length (index) == 1L) {

        # This makes GH API call, so inside 'if' to only call if necessary:
        if (issue_template_has_subdir (repo, issue_num)) {
            return (checks_md)
        }

        line <- checks_md [index]
        quotes <- gregexpr ("\\'", line) [[1]]
        if (length (quotes) == 2L) {
            subdir <- substring (line, quotes [1], quotes [2])
            subdir <- gsub ("\\'", "", subdir)
            new_info <- c (paste0 (
                "The initial submission template has been edited ",
                "to add an additional 'Sub-directory:' line."
            ))

            index_pre <- seq_len (index)
            index_post <- seq_along (checks_md) [-(index_pre)]
            checks_md <- c (
                checks_md [index_pre],
                new_info,
                checks_md [index_post]
            )

            # Then update the actual issue:
            requireNamespace ("gh", quietly = TRUE)
            body <- get_issue_body (orgrepo, issue_num)
            index <- min (grep ("^Repository\\:", body))
            index_pre <- seq_len (index)
            index_post <- seq_along (body) [-(index_pre)]
            new_body <- c (
                body [index_pre],
                paste0 ("Sub-directory: ", subdir),
                body [index_post]
            )
            resp <- gh::gh (
                paste0 ("PATCH /repos/", orgrepo, "/issues/", issue_num),
                body = paste0 (new_body, collapse = "\n")
            )
        }
    }

    attributes (checks_md) <- a

    return (checks_md)
}

add_eic_srr_info <- function (eic_instr, srr_okay) {

    if (!srr_okay) {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "Processing may not proceed until the 'srr' ",
                "issues identified above have been addressed.\n"
            )
        )
    }

    return (eic_instr)
}

add_checks_okay_info <- function (eic_instr, checks_okay) {

    if (!checks_okay) {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "Processing may not proceed until the ",
                "items marked with ",
                roreviewapi::symbol_crs (),
                " have been resolved.\n"
            )
        )
    } else {

        eic_instr <- c (
            eic_instr,
            paste0 (
                "This package is in top shape and may ",
                "be passed on to a handling editor.\n"
            )
        )
    }

    return (eic_instr)
}

add_noteworthy <- function (eic_instr, is_noteworthy) {

    if (is_noteworthy) {
        eic_instr <- c (
            eic_instr,
            paste0 (
                "This package has some noteworthy ",
                "properties, see 'Package Statistics' ",
                "details above.\n"
            )
        )
    }

    return (eic_instr)
}

update_file_paths <- function (out, template, real_value) {

    if (!is.null (template)) { # pkg has a network, and network_file

        out <- gsub (template, real_value, out)
    }

    return (out)
}
