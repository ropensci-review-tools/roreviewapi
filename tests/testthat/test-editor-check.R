test_that ("editor check", {
    path <- srr::srr_stats_pkg_skeleton ()
    roxygen2::roxygenise (path)
    Sys.setenv ("PKGCHECK_CACHE_DIR" = fs::path_temp ())
    checks <- pkgcheck::pkgcheck (path, goodpractice = FALSE)

    res <- collate_editor_check (checks)
    expect_type (res, "character")
    expect_length (res, 1L)

    res <- strsplit (res, "\\n") [[1]]
    expect_true (grepl ("^\\#\\#\\s+Checks for \\[demo", res [1]))
    expect_length (grep ("^\\-\\s\\:heavy\\_multiplication\\_x\\:", res), 11L)
    expect_length (grep ("^\\-\\s\\:heavy\\_check\\_mark\\:", res), 2L)
    # Should have a stats section:
    expect_true (any (grepl ("^(\\#+)\\s1\\.\\s+rOpenSci\\s+Statistical\\s+Standards", res)))
    expect_true (any (grepl ("^(\\#+)\\sEditor\\-in\\-Chief\\s+Instructions\\:", res)))
    expect_true (any (grepl ("Processing may not proceed", res, fixed = TRUE)))
})
