# plumber.R


# --------------------------------------------------
# ----------------   editorcheck   -----------------
# --------------------------------------------------

#* Run full range of editor checks
#* @param u The URL for a repo
#* @post /editorcheck
function (u) {

    cache_dir <- Sys.getenv ("pkgcheck_cache_dir")
    local_repo <- roreviewapi::dl_gh_repo (u)

    check <- roreviewapi::editor_check (local_repo)
    a <- attributes (check)
    u <- roreviewapi::push_to_gh_pages (check)
    check <- strsplit (check, "\n") [[1]]
    check <- gsub (a$network_file, u [1], check)
    check <- gsub (a$srr_report_file, u [2], check)

    eic_instr <- c ("",
                    "---",
                    "",
                    "## Editor-in-Chief Instructions:",
                    "")

    if (!a$srr_okay) {

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

    message ("unlinking ", local_repo)
    junk <- unlink (local_repo, recursive = TRUE)

    noteworthy <- ifelse (a$is_noteworthy,
                          c (paste0 ("This package has some noteworthy ",
                                     "properties, see 'Package Statistics' ",
                                     "details below"),
                             ""),
                          "")

    out <- paste0 (c (check, eic_instr), collapse = "\n")


    return (out)
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
