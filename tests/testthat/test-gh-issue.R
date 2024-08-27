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

test_that ("post_to_issue functionality", {
    repo <- "ropensci/test"
    issue_id <- 1L
    cmt <- "Yep"
    f <- tempfile (fileext = ".txt")

    args <- get_gh_args (cmt, repo, issue_id, f)
    expect_equal (args$cmt, cmt)
    expect_equal (names (args), c ("cmt", "args"))
    expect_length (args$args, 7L)

    cmt <- "Oops, something went wrong"
    args <- get_gh_args (cmt, repo, issue_id, f)
    expect_false (args$cmt == cmt)
    expect_true (grepl ("There was a problem", args$cmt, fixed = TRUE))
    expect_equal (names (args), c ("cmt", "args"))
    expect_length (args$args, 10L)
})
