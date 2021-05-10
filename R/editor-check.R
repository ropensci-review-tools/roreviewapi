
#' Body of main 'editorcheck' response
#'
#' @param path Path to local source repository
#' @return Markdown-formatted response body from static package checks.
#' @export
editor_check <- function (path) {

    check_data <- pkgcheck::pkgcheck (path)

    eic_chks <- collate_checks (check_data)

    eic_instr <- c (paste0 ("## Checks for [", check_data$package,
                            " (v", check_data$version, ")](",
                            check_data$url, ")"),
                    "",
                    paste0 ("git hash: [",
                            substring (check_data$git$HEAD, 1, 8),
                            "](",
                            check_data$url,
                            "/tree/",
                            check_data$git$HEAD,
                            ")"),
                    "",
                    eic_chks,
                    "",
                    paste0 ("Package License: ", check_data$license),
                    "")

    # function call network
    cache_dir <- Sys.getenv ("cache_dir")
    visjs_dir <- file.path (cache_dir, "static") # in api.R
    repo <- ifelse (!is.null (check_data$url),
                    utils::tail (strsplit (check_data$url, "/") [[1]], 1),
                    check_data$package)

    # clean up any older ones
    flist <- list.files (visjs_dir,
                         pattern = paste0 (repo, "_pkgstats"),
                         full.names = TRUE)
    if (!check_data$network_file %in% flist) {
        unlink (flist, recursive = TRUE)
        visjs_ptn <- basename (check_data$network_file)
        visjs_ptn <- tools::file_path_sans_ext (visjs_ptn)
        flist <- list.files (dirname (check_data$network_file),
                             pattern = visjs_ptn,
                             full.names = TRUE)

        file.copy (flist, visjs_dir, recursive = TRUE)
    }

    visjs_url <- paste0 (Sys.getenv ("pkgcheck_url"), "/assets/",
                         basename (check_data$network_file))

    network_vis <- c ("",
                      "### Network visualisation",
                      "",
                      paste0 ("[Click here](",
                              visjs_url,
                              ") for interactive network visualisation ",
                              "of calls between objects in package."))


    stats_rep <- pkgstats_checks (check_data$pkgstats)

    eic_instr <- c (eic_instr,
                    stats_rep,
                    network_vis,
                    "")

    if (!is.null (check_data$badges)) {

        if (is.na (check_data$badges [1]))
            check_data$badges <- "(There do not appear to be any)"

        eic_instr <- c (eic_instr,
                        "**Continuous Integration Badges**",
                        "",
                        check_data$badges,
                        "")

        if (!is.null (check_data$github_workflows)) {

            eic_instr <- c (eic_instr,
                            "**GitHub Workflow Results**",
                            "",
                            knitr::kable (check_data$github_workflows))
        }
    }

    # ------------------------------------------------------------
    # ---------------------   GOODPRACTICE   ---------------------
    # ------------------------------------------------------------

    control <- list (cyclocomp_threshold = 15,
                     covr_threshold = 70,
                     digits = 2)

    gp <- process_gp (check_data$gp, control = control)

    gp <- c ("",
             "### goodpractice results",
             "",
             "",
             gp,
             "")

    eic_instr <- c (eic_instr, gp)

    if (!attr (eic_chks, "checks_okay")) {

        eic_instr <- c (eic_instr,
                        paste0 ("Processing may not proceed until the ",
                                "items marked with ",
                                symbol_crs (),
                                " have been resolved."))
    } else {

        eic_instr <- c (eic_instr,
                        paste0 ("This package is in top shape and may ",
                                "be passed on to a handling editor"))
    }

    eic_instr <- paste0 (eic_instr, collapse = "\n")
    attr (eic_instr, "is_noteworthy") <- attr (stats_rep, "is_noteworthy")

    return (eic_instr)
}

#' Collate main checklist items for editor report
#' @param x Result of \package{pkgreport} 'pkgreport' function
#' @noRd
collate_checks <- function (x) {

    uses_roxy <- ifelse (x$file_list$uses_roxy,
                         paste0 ("- ", symbol_tck (),
                                 " Package uses 'roxygen2'"),
                         paste0 ("- ", symbol_crs (),
                                 " Package does not use 'roxygen2'"))

    has_lifecycle <- ifelse (x$file_list$has_lifecycle,
                             paste0 ("- ", symbol_tck (),
                                     " Package has a life cycle statement"),
                             paste0 ("- ", symbol_crs (),
                                     " Package does not have a ",
                                     "life cycle statement"))
    has_contrib <- ifelse (x$file_list$has_contrib,
                             paste0 ("- ", symbol_tck (),
                                     " Package has a 'contributing.md' file"),
                             paste0 ("- ", symbol_crs (),
                                     " Package does not have a ",
                                     "'contributing.md' file"))

    fn_exs <- ifelse (all (x$fn_exs),
                      paste0 ("- ", symbol_tck (),
                              " All functions have examples"),
                      paste0 ("- ", symbol_crs (),
                              " These funtions do not have examples: [",
                              paste0 (names (x$fn_exs) [which (!x$fn_exs)]),
                              "]"))

    la_out <- NULL
    if (x$left_assign$global) {
        la_out <- paste0 ("- ", symbol_crs (),
                          " Package uses global assignment operator ('<<-')")
    }
    if (length (which (x$left_assign$usage == 0)) == 0) {
        la <- x$left_assign$usage
        la_out <- c (la_out,
                     paste0 ("- ", symbol_crs (),
                             " Package uses inconsistent ",
                             "assignment operators (",
                             la [names (la) == "<-"], " '<-' and ",
                             la [names (la) == "="], " '=')"))
    }

    has_url <- ifelse (x$file_list$has_url,
                       paste0 ("- ", symbol_tck (),
                               " Package 'DESCRIPTION' has a URL field"),
                       paste0 ("- ", symbol_crs (),
                               " Package 'DESCRIPTION' does not ",
                               "have a URL field"))
    has_bugs <- ifelse (x$file_list$has_bugs,
                        paste0 ("- ", symbol_tck (),
                                " Package 'DESCRIPTION' has a ",
                                "BugReports field"),
                        paste0 ("- ", symbol_crs (),
                                " Package 'DESCRIPTION' does not ",
                                "have a BugReports field"))

    # ------------------------------------------------------------
    # -----------------   BADGES + OTHER STUFF   -----------------
    # ------------------------------------------------------------

    if (is.null (x$badges)) {

        ci_txt <- paste0 ("- ", symbol_crs (),
                          " Package has no continuous integration checks")
    } else {

        ci_txt <- paste0 ("- ", symbol_tck (),
                          " Package has continuous integration checks")
    }

    eic_chks <- c (uses_roxy,
               has_contrib,
               fn_exs,
               la_out,
               has_url,
               has_bugs,
               ci_txt)

    checks_okay <- !any (grepl (symbol_crs (), eic_chks))
    if (!checks_okay) {
        eic_chks <- c (eic_chks,
                       "",
                       paste0 ("**Important:** All failing checks above ",
                               "must be addressed prior to proceeding"))
    }

    attr (eic_chks, "checks_okay") <- checks_okay

    return (eic_chks)
}

srr_checks <- function (x) {
}

#' Format \pkg{pkgstats} data
#' @param s Output of \pkg{pkgstats} call.
#' @return Report as formatted string
#' @export
pkgstats_checks <- function (s) {

    is_noteworthy <- any (s$noteworthy == "TRUE")
    stats_rep <- c ("",
                    "### Package Statistics",
                    "",
                    "<details>",
                    "<summary>click to see</summary>",
                    "<p>",
                    "",
                    "---",
                    "",
                    paste0 ("Statistical properties of package structure as ",
                            "distributional percentiles in relation to all ",
                            "current CRAN packages"),
                    "The following terminology is used:",
                    "- `loc` = \"Lines of Code\"",
                    "- `fn` = \"function\"",
                    "- `exp`/`not_exp` = exported / not exported",
                    "",
                    paste0 ("The final measure (`fn_call_network_size`) is ",
                            "the total number of calls between functions (in ",
                            "R), or more abstract relationships between code ",
                            "objects in other languages. Values are flagged ",
                            "as \"noteworthy\" when they lie in the upper or ",
                            "lower 5th percentile."),
                    "",
                    knitr::kable (s,
                                  row.names = FALSE,
                                  digits = c (NA, 0, 1, NA)),
                    "",
                    "---",
                    "</p></details>"
                    )

    attr (stats_rep, "is_noteworthy") <- is_noteworthy

    return (stats_rep)
}
