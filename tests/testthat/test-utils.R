test_all <- identical (Sys.getenv ("RRT_TEST_ALL"), "true")
# identical (Sys.getenv ("GITHUB_JOB"), "test-coverage")
testthat::skip_if (!test_all)

# The 'get_github_user()' is not authorized on gh runners

test_that ("utils symbols", {
    expect_equal (symbol_tck (), ":heavy_check_mark:")
    expect_equal (symbol_crs (), ":heavy_multiplication_x:")
})

test_that ("utils gh user", {
    g <- get_github_user ()
    expect_type (g, "character")
    expect_length (g, 1L)

    expect_equal (get_github_user ("invalid-token"), "")
})

test_that ("utils authorization", {
    # No secret is never authorized, whatever the token in the container:
    expect_false (is_user_authorized ())
    expect_false (is_user_authorized (NULL))
    expect_false (is_user_authorized (""))
    expect_false (is_user_authorized (c ("a", "b")))
    expect_false (is_user_authorized ("invalid-token"))

    withr::with_envvar (c (PKGCHECK_TOKEN = "abc"), {
        expect_true (is_user_authorized ("abc"))
        expect_false (is_user_authorized ("abd"))
    })
    # Empty PKGCHECK_TOKEN must not match an empty secret:
    withr::with_envvar (c (PKGCHECK_TOKEN = ""), {
        expect_false (is_user_authorized (""))
    })
})

test_that ("utils gh branch", {
    repourl <- "https://github.com/ropensci/software-review"
    b <- get_branch_from_url (repourl)
    expect_null (b)
    expect_true (url_exists (repourl))

    repourl <- "https://github.com/ropensci/software-review/tree/other"
    b <- get_branch_from_url (repourl)
    expect_equal (b, "other")
    expect_false (url_exists (repourl))
})

test_that ("is R pkg", {
    repourl <- "https://github.com/ropensci/software-review"
    expect_false (url_is_r_pkg (repourl))
    repourl <- "https://github.com/ropensci-review-tools/roreviewapi"
    expect_true (url_is_r_pkg (repourl))
    repourl <- "https://github.com/ropensci-review-tools/roreviewapi/tree/gh-pages"
    expect_false (url_is_r_pkg (repourl))
})
