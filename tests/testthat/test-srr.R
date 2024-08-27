test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_WORKFLOW"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("srr", {
    path <- srr::srr_stats_pkg_skeleton ()

    expect_message (
        srr_rep <- srr::srr_report (path, view = FALSE)
    )

    counts <- srr_counts_from_report (srr_rep)
    expect_true (grepl ("^The following standards are missing", counts))

    # Fill all standards, leaving single "TODO":
    f <- file.path (path, "R", "srr-stats-standards.R")
    x <- readLines (f)
    x <- c (x [seq_len (grep ("^NULL", x) [1])], "")
    s_todo <- x [grep ("srrstatsNA", x)]
    s_todo <- regmatches (s_todo, regexpr ("\\{.*\\}", s_todo))
    s_todo <- gsub ("\\{|\\}", "", s_todo)

    x_g <- srr:::get_standards_checklists ("general")
    x_r <- srr:::get_standards_checklists ("regression")
    x_r <- x_r [-(grep (s_todo, x_r, fixed = TRUE))]

    x_s <- c (x_g, x_r)
    ptn <- "- [ ] **"
    x_s <- x_s [grep (ptn, x_s, fixed = TRUE)]
    x_s <- gsub (ptn, "#' @srrstats {", x_s [grep (ptn, x_s, fixed = TRUE)], fixed = TRUE)
    x_s <- gsub ("\\*\\*G", "{G", x_s)
    x_s <- gsub ("\\*\\*R", "{R", x_s)
    x_s <- gsub ("\\*\\*", "}", x_s)
    x_s <- gsub ("^\\s+\\#", "#", x_s)

    writeLines (c (x, x_s, "NULL"), f)

    # Also need to re-label "TODO"
    f <- file.path (path, "R", "test.R")
    x <- gsub ("srrstatsTODO", "srrstats", readLines (f))
    writeLines (x, f)

    srr_rep <- srr::srr_report (path, view = FALSE)
    counts <- srr_counts_from_report (srr_rep)
    # No errors, so starts with compliance report:
    expect_true (grepl ("^\\#\\#\\s+\\'srr\\' standards compliance", counts))
    # Should pass count checks, so state that it may be submitted:
    expect_true (grepl ("may be submitted", counts, fixed = TRUE))
    # But should include non-zero counts of stds not complied with:
    expect_true (grepl ("Not complied with", counts, fixed = TRUE))
})
