test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_WORKFLOW"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("srr", {
    path <- fs::path (fs::path_temp (), "demo")
    if (fs::dir_exists (path)) {
        fs::dir_delete (path)
    }
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

test_that ("srr stats version", {
    v <- stats_version ()
    expect_type (v, "character")
    expect_length (v, 1L)
    expect_true (grepl ("^[0-9]\\.[0-9]$", v))
})

test_that ("html-var", {
    x <- "<!--submission-type-->Standard<!--end-submission-type-->"
    v <- get_html_var (x)
    expect_type (v, "character")
    expect_length (v, 1L)
    expect_equal (v, "Standard")
})

test_that ("stats_badge", {
    expect_null (stats_badge_from_opening_comment (""))
    out <- "Submission type: <!--submission-type-->Not-Stats<!--end-submission-type-->"
    expect_null (stats_badge_from_opening_comment (out))
    out <- c (
        "Submission type: <!--submission-type-->Stats<!--end-submission-type-->",
        "labels: A label"
    )
    expect_null (stats_badge_from_opening_comment (out))
    out [2] <- "labels: approved"
    b <- stats_badge_from_opening_comment (out)
    expect_length (b, 0L) # character(0) rather than NULL
    lbl <- "6/approved-bronze-v1.2"
    out [2] <- paste0 ("labels: ", lbl)
    b <- stats_badge_from_opening_comment (out)
    expect_type (b, "character")
    expect_length (b, 1L)
    expect_equal (b, lbl)

    out <- c (
        "Submission type: <!--submission-type-->Stats<!--end-submission-type-->",
        "Badge grade: <!--statsgrade-->gold<!--end-statsgrade-->"
    )
    b <- stats_badge_from_opening_comment (out)
    expect_type (b, "character")
    expect_length (b, 1L)
    expect_true (grepl ("^6\\/approved\\-gold\\-", b))
})
