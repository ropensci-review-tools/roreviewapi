test_all <- identical (Sys.getenv ("MPADGE_LOCAL"), "true") ||
    identical (Sys.getenv ("GITHUB_WORKFLOW"), "test-coverage")
testthat::skip_if (!test_all)

test_that ("utils symbols", {
    expect_equal (symbol_tck (), ":heavy_check_mark:")
    expect_equal (symbol_crs (), ":heavy_multiplication_x:")
})

test_that ("utils gh user", {
    g <- get_github_user ()
    expect_type (g, "character")
    is_local <- identical (Sys.getenv ("MPADGE_LOCAL"), "true")
    # On GH, 'get_github_user()' returns 'char(0)':
    expect_length (g, as.integer (is_local))

    is_auth <- is_user_authorized ()
    if (is_local) {
        expect_equal (is_user_authorized (), is_auth)
    } else {
        expect_length (is_auth, 0L)
    }
})

test_that ("utils gh branch", {
    repourl <- "https://github.com/ropensci/software-review"
    b <- get_branch_from_url (repourl)
    expect_null (b)
    expect_true (url_exists (repourl))

    repourl <- "https://github.com/ropensci/software-review/tree/other"
    b <- get_branch_from_url (repourl)
    expect_equal (b, "other")
    expect_warning (
        chk <- url_exists (repourl),
        "Requests for \\["
    )
    expect_false (chk)
})
