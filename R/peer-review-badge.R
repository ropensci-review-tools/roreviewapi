#' Check whether README.md features an rOpenSci software-review badge
#'
#' @inheritParams srr_counts
#'
#' @return A string, empty if the badge was found.
#' @export
#'
readme_badge <- function (repourl, repo = NULL, issue_id = NULL, post_to_issue = TRUE) {

    # Content taken directly from editor_check():
    branch <- roreviewapi::get_branch_from_url (repourl)
    if (!is.null (branch)) {
        repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
    }

    path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)

    out <- roreviewapi::readme_has_peer_review_badge (path, issue_id)

    if (post_to_issue) {

        out <- roreviewapi::post_to_issue (out, repo, issue_id)
    }

    return (out)
}

globalVariables (".")


#' Check whether 'README.md' has a "peer reviewed" badge
#'
#' @param path Local path to package directory.
#' @inheritParams srr_counts
#' @return A string, empty if the badge was found.
#' @family ropensci
#' @export
#'
readme_has_peer_review_badge <- function (path = getwd (), issue_id = NULL) {

    readme_path <- fs::path (path, "README.md")
    if (!fs::file_exists (readme_path)) {
        stop (sprintf ("Can't find README.md at %s", path))
    }

    # https://github.com/ropensci/codemetar/blob/master/R/extract_badges.R
    # Also GPL-3

    xml_cnts <- readme_path |>
        readLines () |>
        commonmark::markdown_xml () |>
        xml2::read_xml ()
    xml_cnts <- xml2::xml_find_all (xml_cnts, ".//d1:link[d1:image]", xml2::xml_ns (xml_cnts)) |>
        xml2::xml_contents ()
    badges_links <- xml_cnts [which (xml2::xml_name (xml_cnts) == "image")] |>
        xml2::xml_attr ("destination")

    is_ropensci_badge <- function (badges_links, issue_id) {
        if (is.null (issue_id)) {
            grepl (
                "https://badges.ropensci.org/[[:digit:]]*_status.svg",
                badges_links,
                perl = TRUE
            )
        } else {
            badges_links == sprintf ("https://badges.ropensci.org/%s_status.svg", issue_id)
        }
    }

    is_http_ropensci_badge <- function (badges_links, issue_id) {
        if (is.null (issue_id)) {
            grepl (
                "http://badges.ropensci.org/[[:digit:]]*_status.svg",
                badges_links,
                perl = TRUE
            )
        } else {
            badges_links == sprintf ("http://badges.ropensci.org/%s_status.svg", issue_id)
        }
    }

    if (!any (is_ropensci_badge (badges_links, issue_id))) {
        if (any (is_http_ropensci_badge (badges_links, issue_id))) {
            out <- "Use https not http in the software review badge."
        } else {
            if (is.null (issue_id)) {
                issue_id <- "<issue-number>"
            }
            out <- paste (
                c (
                    "Missing software review badge in README.md; please add it with", "",
                    "```markdown",
                    sprintf (
                        "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/%s_status.svg)](https://github.com/ropensci/software-review/issues/%s)",
                        issue_id, issue_id
                    ),
                    "```"
                ),
                collapse = "\n"
            )
        }
    } else {
        out <- "Found software review README badge. :tada:"
    }

    return (out)
}
