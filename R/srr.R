
#' Count number of 'srr' statistical standards complied with, and confirm
#' whether than represents > 50% of all applicable standards.
#'
#' @param repourl The URL for the repo being checked, potentially including full
#' path to non-default branch.
#' @param repo The 'context.repo' parameter defining the repository from which
#' the command was invoked, passed in 'org/repo' format.
#' @param issue_id The id (number) of the issue from which the command was
#' invoked.
#' @param post_to_issue Integer value > 0 will post results back to issue (via
#' 'gh' cli); otherwise just return character string with result.
#' @return Vector of three numbers:
#' \enumerate{
#' \item Number of standards complied with
#' \item Total number of applicable standards
#' \item Number complied with as proportion of total
#' }
#' @family ropensci
#' @export
srr_counts <- function (repourl, repo, issue_id, post_to_issue = TRUE) {

    # Content taken directly from editor_check():
    branch <- roreviewapi::get_branch_from_url (repourl)
    if (!is.null (branch)) {
        repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
    } else {
        branch <- "" # for srr_report fn below
    }

    path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)

    # Have to pre-install any system dependencies here because this is the
    # single call point for the r_bg process
    os <- Sys.getenv ("ROREVIEWAPI_OS")
    os_release <- Sys.getenv ("ROREVIEWAPI_OS_RELEASE")

    if (os != "" & os_release != "") {

        p <- roreviewapi::pkgrep_install_deps (path, os, os_release)

        if (methods::is (p, "simpleError")) {

            out <- paste0 (
                "Initial examimnation of package 'DESCRIPTION'",
                " file failed with error\n:",
                p$message
            )
            return (out)

        } else if (length (p) > 0L) {

            p <- paste0 (
                "Note: The following R packages were ",
                "unable to be installed on our system: [",
                paste0 (p, collapse = ", "),
                "]; some checks may be unreliable."
            )
            p <- roreviewapi::post_to_issue (p, repo, issue_id)
        }
    }

    # Then the 'srr' bit:
    srr_rep <- srr::srr_report (path = path, branch = branch, view = FALSE)

    index <- grep ("^\\#\\#\\sMissing Standards", srr_rep)

    if (length (index) > 0L) {

        missing_stds <- srr_rep [-seq (index)]
        while (!nzchar (missing_stds [1])) {
            missing_stds <- missing_stds [-1]
        }

        out <- c (
            missing_stds,
            "",
            "All standards must be documented prior to submission"
        )

    } else {

        stds <- grep ("^\\#\\#\\sStandards with", srr_rep, value = TRUE)
        stds_n <- regmatches (stds, regexpr ("[0-9]+\\s\\/\\s[0-9]+", stds))
        stds_what <- gsub ("\\`", "", regmatches (stds, regexpr ("\\`.*\\`", stds)))
        stds_what [stds_what == "srrstats"] <- "complied with"
        if (any (stds_what == "srrstatsNA")) {
            stds_what [stds_what == "srrstatsNA"] <- "not complied with"
        } else {
            stds_what <- c (stds_what, "not complied with")
            stds_n <- c (stds_n, 0L)
        }
        stds_ntot <- regmatches (stds_n, regexpr ("[0-9]+$", stds_n))
        stds_ntot <- unique (as.integer (stds_ntot))
        stds_n <- as.integer (gsub ("\\s.*$", "", stds_n))

        stds_summary <- paste0 (
            "- ", stds_what, ": ", stds_n, " / ", stds_ntot,
            " = ", round (100 * stds_n / stds_ntot, digits = 1), "%"
        )
        stds_final <- ifelse (
            stds_n [stds_what == "complied with"] / stds_ntot > 0.5,
            "This package complies with > 50% of all standads and may be submitted.",
            "This package complies with < 50% of all standads and is not ready to be submitted."
        )

        out <- c (
            "'srr' standards compliance:",
            "",
            stds_summary,
            "",
            stds_final
            )
    }

    out <- paste0 (out, collapse = "\n")

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}

#' Get stats badge grade and standards version for a submission
#'
#' @param repo The submission repo
#' @param issue_num GitHub issue number of submission
#' @return A single character containing the label used directly for the issue
#' badge
#' @family ropensci
#' @export
stats_badge <- function (repo = "ropensci/software-review",
                         issue_num = 258) {

    # This by default returns only the opening comment. Additional comments can
    # be extracted with the "-c" flag.
    args <- list (
        "issue",
        "view",
        issue_num,
        "-R",
        repo
    )

    out <- system2 ("gh", args = args, stdout = TRUE, wait = TRUE)

    type <- get_html_var (out, "submission-type")
    if (length (type) == 0L) {
          return (NULL)
      }

    grade <- get_html_var (out, "statsgrade")
    version <- stats_version ()

    if (type != "Stats") {
          return (NULL)
      }

    return (paste0 ("6\approved-", grade, "-v", version))
}

get_html_var <- function (x, expr = "submission-type") {

    x <- grep (paste0 ("<!--", expr, "-->"), x, value = TRUE)
    x <- regmatches (x, regexpr ("\\-\\->.*<!\\-\\-", x))
    x <- gsub ("\\-\\->|<!\\-\\-", "", x)

    return (x)
}

#' Get current version of statistical standards
#'
#' @return A single character containing version number
#' @noRd
stats_version <- function () {

    u <- paste0 (
        "https://raw.githubusercontent.com/",
        "ropensci/statistical-software-review-book/",
        "main/DESCRIPTION"
    )

    tmp <- file.path (tempdir (), "stats-devguide-DESCRIPTION")
    if (!file.exists (tmp)) {
          ret <- utils::download.file (u, destfile = tmp, quiet = TRUE)
      } # nolint

    d <- data.frame (read.dcf (tmp))

    return (d$Version)
}
