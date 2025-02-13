test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_JOB"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("dl_repo function", {
    u <- "https://github.com/ropensci-review-tools/issues-tests"
    Sys.setenv ("PKGCHECK_CACHE_DIR" = fs::path_temp ())
    expect_message (
        path <- dl_gh_repo (u),
        "Cloning repo ..."
    )
    expect_type (path, "character")
    expect_true (fs::dir_exists (path))
})

test_that ("other path fns", {
    repourl <- "https://github.com/ropensci-review-tools/issues-tests/tree/branch/subdir"
    expect_equal (get_branch_from_url (repourl), "branch")
    repourl <- "https://github.com/ropensci-review-tools/issues-tests/tree/main/subdir"
    expect_null (get_branch_from_url (repourl))

    expect_equal (get_subdir_from_url (repourl), "subdir")

    u <- rm_subdir_from_url (repourl)
    expect_equal (u, gsub ("\\/tree.*$", "", repourl))
})
