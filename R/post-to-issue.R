
#' Post review checks to GitHub issue
#'
#' @param cmt Single character string with comment to post.
#' @param repo The repository to post to (obtained directly from bot).
#' @param issue_id The number of the issue to post to.
#' @return URL of the comment within the nominated issue
#' @export
post_to_issue <- function (cmt, repo, issue_id) {

    if (grepl ("github", repo))
        repo <- gsub ("https://github.com/", "", repo)

    args <- list ("issue",
                  "comment",
                  issue_id,
                  "--repo", repo,
                  "--body", paste0 ("'", cmt, "'"))

    system2 ("gh", args = args, stdout = TRUE)
}
