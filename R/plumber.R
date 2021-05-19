# plumber.R


# --------------------------------------------------
# ----------------   editorcheck   -----------------
# --------------------------------------------------

#* Run full range of editor checks
#* @param repourl The URL for the repo being checked
#* @param repo The 'context.repo' parameter defining the repository from which the command was invoked.
#* @param issue_id The id of the issue form which the command was invoked
#* @post /editorcheck
function (repourl, repo, issue_id) {

    repourl <- as.character (repourl) [1]
    repo <- as.character (repo) [1]
    issue_id <- as.integer (issue_id) [1]

    # https://github.com/r-lib/callr/issues/204
    sout <- tempfile ()
    serr <- tempfile ()
    ps <- callr::r_bg (func = roreviewapi::editor_check,
                       args = list (repourl = repourl,
                                    repo = repo,
                                    issue_id = issue_id),
                       stdout = sout,
                       stderr = serr)

    return ("Editor check started")
}


# --------------------------------------------------
# ---------------   goodtoreview   -----------------
# --------------------------------------------------

#* Check whether a package is good to go out to review (intended to be called by
#8 handling editors).
#* @param u The URL for a repo
#* @post /goodtoreview
function (u) {

    repo <- tail (strsplit (u, "/") [[1]], 1)
    org <- tail (strsplit (u, "/") [[1]], 2) [1]

    cache_dir <- Sys.getenv ("pkgcheck_cache_dir")
    updated <- pkgcheck::check_cache (org, repo, cache_dir)

    oids <- readRDS (file.path (cache_dir, "commit_oids.Rds"))
    oid <- oids$oid [oids$orgrepo == paste0 (org, "/", repo)]
    oid_short <- substring (oid, 1, 8)

    local_repo <- pkgcheck::dl_gh_repo (u)
    local_zip <- paste0 (local_repo, ".zip")
    flist <- unzip (local_zip, exdir = cache_dir)

    s <- suppressWarnings (pkgstats::pkgstats (local_repo))
    check <- pkgcheck::pkgstats_checks (s)
    is_noteworthy <- attr (check, "is_noteworthy")
    check <- check [which (!grepl ("^<|^---", check))]

    out <- note <- NULL

    if (is_noteworthy) {

        where <- ifelse (updated,
                         "immediately above. ",
                         paste0 ("in the 'details' section at the ",
                                 "top of this issue. "))
        note <- paste0 ("**Note** This package features some ",
                        "noteworthy statistical properties, as ",
                        "detailed ",
                        where,
                        "Reasons for the features flagged in that ",
                        "section as noteworthy should be clarified ",
                        "by a handling editor prior to progressing.")

        if (updated) {

            i <- grep ("\\#\\#\\# Package Statistics", check) + 1
            out <- c (check [seq (i)],
                      "",
                      paste0 ("Since the previous statistics were generated, ",
                              "the repository has been updated to:"),
                      paste0 ("git hash: [",
                              oid_short,
                              "](https://github.com/",
                              org,
                              "/",
                              repo,
                              "/tree/",
                              oid,
                              ")"),
                      "",
                      check [-seq (i)],
                      "")
        }
    }

    out <- c (out,
              note,
              "",
              "## Handling Editor Instructions:",
              "")

    if (is_noteworthy) {

        out <- c (out,
                  paste0 ("Please address the above noteworthy statistical ",
                          "properties prior to assigning reviewers."))
    } else {

        out <- c (out,
                  paste0 ("This package is a great shape! Please proceed ",
                          "to finding reviewers."))
    }


    message ("unlinking ", local_repo)
    junk <- unlink (local_repo, recursive = TRUE)


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

    log_dir <- Sys.getenv ("log_dir")
    log_file <- Sys.getenv ("log_file")

    ret <- "no log file present"

    if (file.exists (log_file)) {
        ret <- readLines (log_file)
        ret <- rev (tail (ret, n))
    }

    return (ret)
}

#* @get /clear_cache
function () {

    cache_dir <- Sys.getenv ("pkgcheck_cache_dir")
    chk <- unlink (cache_dir, recursive = TRUE)

    ifelse (chk == 0,
            "Cache directory successfully removed",
            "Unable to remove cache directory")
}
