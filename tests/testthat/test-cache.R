test_that ("cache construction", {
    org <- "ropensci"
    repo <- "software-review"
    f <- fs::path (fs::path_temp (), "commit_oids.Rds")
    if (fs::file_exists (f)) {
        fs::file_delete (f)
    }

    # TRUE because cache will be created, and so change:
    expect_true (check_cache (org = org, repo = repo))
    expect_true (fs::file_exists (f))

    dat <- readRDS (f)
    expect_s3_class (dat, "data.frame")
    expect_equal (nrow (dat), 1L)
    expect_equal (ncol (dat), 3L)
    expect_equal (names (dat), c ("orgrepo", "oid", "authoredDate"))

    fs::file_delete (f)
    repo <- "test" # No such repo, so no oid or date
    expect_true (check_cache (org = org, repo = repo))
    dat <- readRDS (f)
    expect_false (nzchar (dat$oid))
    expect_false (nzchar (dat$authoredDate))
    expect_equal (dat$orgrepo, "ropensci/test")

    dat$orgrepo <- "org/repo"
    saveRDS (dat, f)
    expect_true (check_cache (org = org, repo = repo))
    dat <- readRDS (f)
    expect_equal (nrow (dat), 2L)
    expect_true (all (c ("org/repo", paste0 (org, "/", repo)) %in% dat$orgrepo))
})

test_that ("stdout + stderr cache", {
    repourl <- "https://github.com/ropensci/software-review"
    cache_files <- stdout_stderr_cache (repourl)
    expect_type (cache_files, "list")
    expect_length (cache_files, 2L)
    expect_equal (names (cache_files), c ("stdout", "stderr"))
})
