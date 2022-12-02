test_that("has_readme_badge() errors when no README.md", {
  temp_dir <- file.path(withr::local_tempdir(), "package-path")
  dir.create(temp_dir)
  withr::local_dir(temp_dir)
  expect_snapshot(
    has_readme_badge(), error = TRUE,
    transform = function(x) sub("at .*package-path", "at package-path", x)
  )
})

test_that("has_readme_badge() works with badgeless README.md", {
  temp_dir <- file.path(withr::local_tempdir(), "package-path")
  dir.create(temp_dir)
  withr::local_dir(temp_dir)
  file.create("README.md")
  expect_match(has_readme_badge(), "Missing software review badge")
})

test_that("has_readme_badge() works when no software review badge", {
  temp_dir <- file.path(withr::local_tempdir(), "package-path")
  dir.create(temp_dir)
  withr::local_dir(temp_dir)
  file.create("README.md")
  writeLines(
    "[![Project Status: Concept](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)",
    "README.md"
  )
  expect_match(has_readme_badge(), "Missing software review badge")
  expect_match(has_readme_badge(issue_id = 3), "Missing software review badge")
})

test_that("has_readme_badge() works when HTTP software review badge", {
  temp_dir <- file.path(withr::local_tempdir(), "package-path")
  dir.create(temp_dir)
  withr::local_dir(temp_dir)
  file.create("README.md")
  writeLines(
    "[![Status at rOpenSci Software Peer Review](http://badges.ropensci.org/3_status.svg)](https://github.com/ropensci/software-review/issues/3)",
    "README.md"
  )
  expect_match(has_readme_badge(), "not http")
  expect_match(has_readme_badge(issue_id = 3), "not http")
})

test_that("has_readme_badge() works when HTTPS software review badge", {
  temp_dir <- file.path(withr::local_tempdir(), "package-path")
  dir.create(temp_dir)
  withr::local_dir(temp_dir)
  file.create("README.md")
  writeLines(
    "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/3_status.svg)](https://github.com/ropensci/software-review/issues/3)",
    "README.md"
  )
  expect_equal(has_readme_badge(), "Found software review README badge. :tada:")
  expect_equal(has_readme_badge(issue_id = 3), "Found software review README badge. :tada:")
  expect_match(has_readme_badge(issue_id = 33), "Missing")
})
