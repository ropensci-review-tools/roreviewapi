
#' Post review checks to GitHub issue
#'
#' @param cmt Single character string with comment to post.
#' @param repo The repository to post to (obtained directly from bot).
#' @param issue_id The number of the issue to post to.
#' @export
post_to_issue <- function (cmt, repo, issue_id) {

    if (!grepl ("github", repo))
        repo <- paste0 ("https://github.com/", repo)

}
