
#' Post review checks to GitHub issue
#'
#' @param cmt Single character string with comment to post.
#' @param repo The repository to post to (obtained directly from bot).
#' @param issue_id The number of the issue to post to.
#' @return URL of the comment within the nominated issue
#' @family github
#' @export
post_to_issue <- function (cmt, repo, issue_id) {

    if (grepl ("github", repo)) {
          repo <- gsub ("https://github.com/", "", repo)
      }

    # Pasting comments straight to `gh --body` fails with any internally nested
    # single- or double-quotes, but all works well when read from file, so:
    f <- tempfile (fileext = ".txt")
    writeLines (cmt, f)

    args <- list (
        "issue",
        "comment",
        issue_id,
        "--repo", repo,
        "--body-file", f
    )

    system2 ("gh", args = args, stdout = TRUE)
}
