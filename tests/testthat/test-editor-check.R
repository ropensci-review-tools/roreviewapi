test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_JOB"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("editor check", {
    path <- fs::path (fs::path_temp (), "demo")
    if (fs::dir_exists (path)) {
        fs::dir_delete (path)
    }
    path <- srr::srr_stats_pkg_skeleton ()
    roxygen2::roxygenise (path, load_code = roxygen2::load_source)
    Sys.setenv ("PKGCHECK_CACHE_DIR" = fs::path_temp ())
    checks <- pkgcheck::pkgcheck (path, goodpractice = FALSE)

    res <- collate_editor_check (checks)
    expect_type (res, "character")
    expect_length (res, 1L)

    res <- strsplit (res, "\\n") [[1]]
    expect_true (grepl ("^\\#\\#\\s+Checks for \\[demo", res [1]))
    expect_length (grep ("^\\-\\s\\:heavy\\_multiplication\\_x\\:", res), 10L)
    expect_length (grep ("^\\-\\s\\:heavy\\_check\\_mark\\:", res), 3L)
    # Should have a stats section:
    expect_true (any (grepl ("^(\\#+)\\s1\\.\\s+rOpenSci\\s+Statistical\\s+Standards", res)))
    expect_true (any (grepl ("^(\\#+)\\sEditor\\-in\\-Chief\\s+Instructions\\:", res)))
    expect_true (any (grepl ("Processing may not proceed", res, fixed = TRUE)))

    fs::dir_delete (path)
})

test_that ("editor check with non-default url", {
    path <- fs::path (fs::path_temp (), "demo")
    if (fs::dir_exists (path)) {
        fs::dir_delete (path)
    }
    path <- srr::srr_stats_pkg_skeleton ()
    roxygen2::roxygenise (path, load_code = roxygen2::load_source)
    Sys.setenv ("PKGCHECK_CACHE_DIR" = fs::path_temp ())
    checks <- pkgcheck::pkgcheck (path, goodpractice = FALSE)

    res0 <- strsplit (collate_editor_check (checks), "\\n") [[1]]
    # title ends with direct href to package and nothing else:
    expect_true (grepl ("\\)$", res0 [1]))
    expect_false (grepl ("on branch", res0 [1]))

    checks$info$git$branch <- "testbranch"
    attr (checks, "branch_is_default") <- FALSE
    res1 <- strsplit (collate_editor_check (checks), "\\n") [[1]]
    expect_false (grepl ("\\)$", res1 [1]))
    expect_true (grepl (" on branch \'testbranch\'", res1 [1]))
})

test_that ("editor check with bad url", {

    repourl <- "https://github.com/does-not-exist"
    repo <- "https://github.com/ropensci/software-review"
    issue_id <- 1

    out <- editor_check (
        repourl,
        repo = repo,
        issue_id = issue_id,
        post_to_issue = FALSE
    )
    expect_type (out, "character")
    expect_length (out, 1L)
    expect_true (grepl ("does not appear to be an R package", out))
    expect_true (grepl (repourl, out, fixed = TRUE))

    repourl <- repo # now exists, but still not R package
    out <- editor_check (
        repourl,
        repo = repo,
        issue_id = issue_id,
        post_to_issue = FALSE
    )
    expect_type (out, "character")
    expect_length (out, 1L)
    expect_true (grepl ("does not appear to be an R package", out))
    expect_true (grepl (repourl, out, fixed = TRUE))
})
