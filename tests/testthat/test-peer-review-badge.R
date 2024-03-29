test_that ("readme_has_peer_review_badge() errors when no README.md", {
    temp_dir <- fs::path (withr::local_tempdir (), "package-path")
    fs::dir_create (temp_dir)
    withr::local_dir (temp_dir)
    expect_snapshot (
        readme_has_peer_review_badge (),
        error = TRUE,
        transform = function (x) sub ("at .*package-path", "at package-path", x)
    )
})

test_that ("readme_has_peer_review_badge() works with badgeless README.md", {
    temp_dir <- fs::path (withr::local_tempdir (), "package-path")
    fs::dir_create (temp_dir)
    withr::local_dir (temp_dir)
    fs::file_create ("README.md")
    expect_match (readme_has_peer_review_badge (), "Missing software review badge")
})

test_that ("readme_has_peer_review_badge() works when no software review badge", {
    temp_dir <- fs::path (withr::local_tempdir (), "package-path")
    fs::dir_create (temp_dir)
    withr::local_dir (temp_dir)
    fs::file_create ("README.md")
    writeLines (
        "[![Project Status: Concept](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)",
        "README.md"
    )
    expect_match (readme_has_peer_review_badge (), "Missing software review badge")
    expect_match (readme_has_peer_review_badge (issue_id = 3), "Missing software review badge")
})

test_that ("readme_has_peer_review_badge() works when HTTP software review badge", {
    temp_dir <- fs::path (withr::local_tempdir (), "package-path")
    fs::dir_create (temp_dir)
    withr::local_dir (temp_dir)
    fs::file_create ("README.md")
    writeLines (
        "[![Status at rOpenSci Software Peer Review](http://badges.ropensci.org/3_status.svg)](https://github.com/ropensci/software-review/issues/3)",
        "README.md"
    )
    expect_match (readme_has_peer_review_badge (), "not http")
    expect_match (readme_has_peer_review_badge (issue_id = 3), "not http")
})

test_that ("readme_has_peer_review_badge() works when HTTPS software review badge", {
    temp_dir <- fs::path (withr::local_tempdir (), "package-path")
    fs::dir_create (temp_dir)
    withr::local_dir (temp_dir)
    fs::file_create ("README.md")
    writeLines (
        "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/3_status.svg)](https://github.com/ropensci/software-review/issues/3)",
        "README.md"
    )
    expect_equal (readme_has_peer_review_badge (), "Found software review README badge. :tada:")
    expect_equal (readme_has_peer_review_badge (issue_id = 3), "Found software review README badge. :tada:")
    expect_match (readme_has_peer_review_badge (issue_id = 33), "Missing")
})
