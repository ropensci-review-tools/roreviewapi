# plumber.R


# --------------------------------------------------
# ----------------   editorcheck   -----------------
# --------------------------------------------------

#* Run full range of editor checks and post result to a GitHub issue
#* @param repourl The URL for the repo being checked
#* @param repo The 'context.repo' parameter defining the repository from which
#* the command was invoked, passed in `org/repo` format.
#* @param issue_id The id of the issue form which the command was invoked
#' @param secret Secret token passed by the bot; checked for match with internal
#' token specified in the Docker container. This allows authors of issues to
#' run package checks.
#* @get /editorcheck
function (repourl = "", repo, issue_id, secret = NULL) {

    if (nchar (repourl) == 0L) {
        return ("Error: Issue template has no 'repourl'")
    }
    if (!roreviewapi::is_user_authorized (secret)) {
        return ("Only authorized users may call this endpoint")
    }

    repourl <- as.character (repourl) [1]
    repo <- as.character (repo) [1]
    issue_id <- as.integer (issue_id) [1]

    template_chk <- roreviewapi::check_issue_template (repo, issue_id)
    if (!attr (template_chk, "proceed_with_checks")) {
        return (template_chk)
    }

    logfiles <- roreviewapi::stdout_stderr_cache (repourl)

    ps <<- callr::r_bg (
        func = roreviewapi::editor_check,
        args = list (
            repourl = repourl,
            repo = repo,
            issue_id = issue_id
        ),
        stdout = logfiles$stdout,
        stderr = logfiles$stderr,
        poll_connection = TRUE,
        supervise = TRUE
    )

    out <- ifelse (nchar (template_chk) == 0L,
        "Editor check started",
        as.character (template_chk)
    )

    return (out)
}


# --------------------------------------------------
# -----------   editorcheck_contents   -------------
# --------------------------------------------------

#* Alternative version of editorcheck endpoint that directly returns result,
#* rather than than posting to GitHub issue. Also runs as a blocking foreground
#* process, rather than bg.
#* @param repourl The URL for the repo being checked
#* @get /editorcheck_contents
function (repourl = "", secret = NULL) {

    if (nchar (repourl) == 0L) {
        return ("Error: Issue template has no 'repourl'")
    }
    if (!roreviewapi::is_user_authorized (secret)) {
        return ("Only authorized users may call this endpoint")
    }

    out <- roreviewapi::editor_check (repourl,
        post_to_issue = FALSE
    )

    return (paste0 (out, collapse = "\n"))
}



# --------------------------------------------------
# --------------   other endpoints   ---------------
# --------------------------------------------------

#* @get /mean
function (n = 10) {

    return (mean (rnorm (n)))
}


#* Get Stats badge for an issue
#* @param repo GitHub repo of review issue in form 'org/repo'
#* @param issue_num GitHub issue mumber for which badge is to be extracted
#* @get /stats_badge
function (repo = "ropensci/software-review", issue_num) {

    if (!is.integer (issue_num) & length (issue_num) != 1L) {
        return (NULL)
    }

    roreviewapi::stats_badge (repo, issue_num)
}

#* Get log
#* @param n Get n latest log entries
#* @get /log
function (n = 10) {

    log_dir <- Sys.getenv ("ROREVAPI_LOG_DIR")
    log_file <- Sys.getenv ("ROREVAPI_LOG_FILE")

    ret <- "no log file present"

    if (file.exists (log_file)) {
        ret <- readLines (log_file)
        ret <- rev (tail (ret, n))
    }

    # The Digital Ocean service constantly polls itself, so exclude any internal
    # IP address (172.16.0.0 - 172.31.255.255)
    ptn <- paste0 (paste0 ("172\\.", 16:31, "\\."), collapse = "|")
    ret <- ret [which (!grepl (ptn, ret))]

    # And remove any empty entries:
    g <- regexpr ("INFO \\[.*\\]\\s+$", ret)
    ret <- ret [which (g < 1L)]

    return (ret)
}

#* @get /clear_cache
function () {

    cache_dir <- options ("pkgcheck.cache_dir")
    if (dir.exists (cache_dir)) {
        chk <- unlink (cache_dir, recursive = TRUE)
    }

    ifelse (chk == 0,
        "Cache directory successfully removed",
        "Unable to remove cache directory"
    )
}

#* Fetch stdout & stderr logs from main process for specified repo URL
#* @param repourl The URL for the repo being checked
#* @get /stdlogs
function (repourl) {

    logfiles <- roreviewapi::stdout_stderr_cache (repourl)

    index <- which (vapply (logfiles, file.exists, logical (1)))
    logfiles <- logfiles [index]

    ret <- lapply (logfiles, readLines)
    for (i in names (logfiles)) {

        if (sum (nchar (ret [[i]])) > 0) {

            ret [[i]] <- c (
                paste0 (
                    "# ---------   ",
                    toupper (i),
                    "   ----------"
                ),
                "",
                ret [[i]]
            )
        }
    }

    ret <- paste0 (unlist (ret), collapse = "\n")

    if (nchar (ret) <= 1) {

        ret <- paste0 (
            "No stdout or stderr files found for ",
            repourl
        )
    }

    return (ret)
}
