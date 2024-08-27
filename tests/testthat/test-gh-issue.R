test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_WORKFLOW"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("gh issue template check", {
    orgrepo <- "ropensci/software-review"
    issue_num <- 633
    chk <- check_issue_template (orgrepo, issue_num)

    expect_type (chk, "character")
    expect_length (chk, 1L)
    expect_false (nzchar (chk))
    expect_true (attr (chk, "proceed_with_checks"))
})
