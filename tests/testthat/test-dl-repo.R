test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_WORKFLOW"), "test-coverage")
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
