# plumber.R


# --------------------------------------------------
# ----------------   editorcheck   -----------------
# --------------------------------------------------

#* Run full range of editor checks and post result to a GitHub issue
#* @param repourl The URL for the repo being checked
#* @param repo The 'context.repo' parameter defining the repository from which
#* the command was invoked.
#* @param issue_id The id of the issue form which the command was invoked
#* @get /editorcheck
function (repourl, repo, issue_id) {

    repourl <- as.character (repourl) [1]
    repo <- as.character (repo) [1]
    issue_id <- as.integer (issue_id) [1]

    logfiles <- roreviewapi::stdout_stderr_cache (repourl)

    ps <- callr::r_bg (func = roreviewapi::editor_check,
                       args = list (repourl = repourl,
                                    repo = repo,
                                    issue_id = issue_id),
                       stdout = logfiles$stdout,
                       stderr = logfiles$stderr,
                       supervise = TRUE)

    return ("Editor check started")
}


# --------------------------------------------------
# -----------   editorcheck_contents   -------------
# --------------------------------------------------

#* Alternative version of editorcheck endpoint that directly returns result,
#* rather than than posting to GitHub issue
#* @param repourl The URL for the repo being checked
#* @get /editorcheck_contents
function (repourl) {

    out <- roreviewapi::editor_check (repourl,
                                      post_to_issue = FALSE)

    return (paste0 (out, collapse = "\n"))
}



# --------------------------------------------------
# --------------   other endpoints   ---------------
# --------------------------------------------------

#* @get /mean
function (n = 10) {

    return (mean (rnorm (n)))
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

    return (ret)
}

#* @get /clear_cache
function () {

    cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
    chk <- unlink (cache_dir, recursive = TRUE)

    ifelse (chk == 0,
            "Cache directory successfully removed",
            "Unable to remove cache directory")
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

            ret [[i]] <- c (paste0 ("# ---------   ",
                                    toupper (i),
                                    "   ----------"),
                            "",
                            ret [[i]])
        }
    }

    ret <- paste0 (unlist (ret), collapse = "\n")

    if (nchar (ret) <= 1) {

        ret <- paste0 ("No stdout or stderr files found for ",
                       repourl)
    }

    return (ret)
}
