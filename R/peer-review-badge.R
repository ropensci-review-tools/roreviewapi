#' Check whether README.md features an rOpenSci software-review badge
#'
#' @inheritParams srr_counts
#'
#' @return A string, empty if the badge was found.
#' @export
#'
readme_badge <- function(repourl, repo, issue_id, post_to_issue = TRUE) {
  # Content taken directly from editor_check():
  branch <- roreviewapi::get_branch_from_url (repourl)
  if (!is.null (branch)) {
    repourl <- gsub (paste0 ("\\/tree\\/", branch, ".*$"), "", repourl)
  }

  path <- roreviewapi::dl_gh_repo (u = repourl, branch = branch)

  # Then the 'badge' bit:
  out <- has_readme_badge(path, issue_id)

  if (post_to_issue) {

    out <- roreviewapi::post_to_issue (out, repo, issue_id)
  }

  return (out)
}

has_readme_badge <- function(path = getwd(), issue_id = NULL) {
  readme_path <- file.path(path, "README.md")
  if (!file.exists(readme_path)) {
    stop(sprintf("Can't find README.md at %s", path))
  }

  # https://github.com/ropensci/codemetar/blob/master/R/extract_badges.R
  # Also GPL-3

  badges_links <- readme_path %>%
    readLines() %>%
    commonmark::markdown_xml() %>%
    xml2::read_xml() %>%
    xml2::xml_find_all(".//d1:link[d1:image]", xml2::xml_ns(.)) %>%
    xml2::xml_contents(.) %>%
    .[xml2::xml_name(.) == "image"] %>%
    xml2::xml_attr("destination")

  is_ropensci_badge <- function(badges_links, issue_id) {
    if (is.null(issue_id)) {
      grepl(
        "https://badges.ropensci.org/[[:digit:]]*_status.svg",
        badges_links,
        perl = TRUE
      )
    } else {
      badges_links == sprintf("https://badges.ropensci.org/%s_status.svg", issue_id)
    }
  }

  is_http_ropensci_badge <- function(badges_links, issue_id) {
    if (is.null(issue_id)) {
      grepl(
        "http://badges.ropensci.org/[[:digit:]]*_status.svg",
        badges_links,
        perl = TRUE
      )
    } else {
      badges_links == sprintf("http://badges.ropensci.org/%s_status.svg", issue_id)
    }
  }

  if (!any(is_ropensci_badge(badges_links, issue_id))) {
    if (any(is_http_ropensci_badge(badges_links, issue_id))) {
      "Use https not http in the software review badge."
    } else {
      if (is.null(issue_id)) {
        issue_id <- "<issue-number>"
      }
      paste(
        c(
          "Missing software review badge in README.md, add it with", "",
          "```markdown",
          sprintf(
            "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/%s_status.svg)](https://github.com/ropensci/software-review/issues/%s)",
            issue_id, issue_id
          ),
          "```"
        ),
        collapse = "\n"
      )
    }
  } else {
    "Found software review README badge. :tada:"
  }

}

