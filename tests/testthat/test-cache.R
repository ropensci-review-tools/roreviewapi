test_that ("cache construction", {
    org <- "ropensci"
    repo <- "software-review"
    # TRUE because cache will be created, and so change:
    expect_true (check_cache (org = org, repo = repo))
    f <- fs::path (fs::path_temp (), "commit_oids.Rds")
    expect_true (fs::file_exists (f))

    dat <- readRDS (f)
    expect_s3_class (dat, "data.frame")
    expect_equal (nrow (dat), 1L)
    expect_equal (ncol (dat), 3L)
    expect_equal (names (dat), c ("orgrepo", "oid", "authoredDate"))
})

test_that ("stdout + stderr cache", {
    repourl <- "https://github.com/ropensci/software-review"
    cache_files <- stdout_stderr_cache (repourl)
    expect_type (cache_files, "list")
    expect_length (cache_files, 2L)
    expect_equal (names (cache_files), c ("stdout", "stderr"))
})
