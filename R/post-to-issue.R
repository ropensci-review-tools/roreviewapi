#' Post review checks to GitHub issue
#'
#' @param cmt Single character string with comment to post.
#' @param repo The repository to post to (obtained directly from bot).
#' @param issue_id The number of the issue to post to.
#' @return URL of the comment within the nominated issue
#' @family github
#' @export
post_to_issue <- function (cmt, repo, issue_id) {

    # Pasting comments straight to `gh --body` fails with any internally nested
    # single- or double-quotes, but all works well when read from file, so:
    f <- tempfile (fileext = ".txt")
    # 'cmt' is then written to this tempfile below.

    gh_content <- get_gh_args (cmt, repo, issue_id, f)

    writeLines (gh_content$cmt, f)

    system2 ("gh", args = gh_content$args, stdout = TRUE)
}

get_gh_args <- function (cmt, repo, issue_id, f) {

    if (grepl ("^Oops\\,\\ssomething went wrong", cmt)) {

        repo_bug <- "ropensci-review-tools/roreviewapi"
        args <- list (
            "issue",
            "create",
            "--title", "'pkgcheck failure'",
            "--label", "bug",
            "--repo", repo_bug,
            "--body-file", f
        )
        cmt <- paste0 (
            "There was a problem checking submission for [",
            repo,
            "](https://github.com/",
            repo,
            ") submitted in issue [",
            issue_id,
            "](https://github.com/ropensci/software-review/issues/",
            issue_id,
            ")"
        )

    } else {

        repo <- gsub ("https://github.com/", "", repo)

        args <- list (
            "issue",
            "comment",
            issue_id,
            "--repo", repo,
            "--body-file", f
        )
    }

    list (cmt = cmt, args = args)
}
