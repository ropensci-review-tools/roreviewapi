#' Check whether README.md features an rOpenSci software-review badge
#'
#' @param path Path to package source
#' @param issue_number Number of software review submission issue
#'
#' @return A string, empty if the badge was found.
#' @export
#'
has_readme_badge <- function(path = getwd(), issue_number = NULL) {
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

  is_ropensci_badge <- function(badges_links, issue_number) {
    if (is.null(issue_number)) {
      grepl(
        "https://badges.ropensci.org/[[:digit:]]*_status.svg",
        badges_links,
        perl = TRUE
      )
    } else {
      badges_links == sprintf("https://badges.ropensci.org/%s_status.svg", issue_number)
    }
  }

  is_http_ropensci_badge <- function(badges_links, issue_number) {
    if (is.null(issue_number)) {
      grepl(
        "http://badges.ropensci.org/[[:digit:]]*_status.svg",
        badges_links,
        perl = TRUE
      )
    } else {
      badges_links == sprintf("http://badges.ropensci.org/%s_status.svg", issue_number)
    }
  }

  if (!any(is_ropensci_badge(badges_links, issue_number))) {
    if (any(is_http_ropensci_badge(badges_links, issue_number))) {
      "Use https not http in the software review badge."
    } else {
      if (is.null(issue_number)) {
        issue_number <- "<issue-number>"
      }
      paste(
        c(
          "Missing software review badge, add it with", "",
          "```markdown",
          sprintf(
            "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/%s_status.svg)](https://github.com/ropensci/software-review/issues/%s)",
            issue_number, issue_number
          ),
          "```"
        ),
        collapse = "\n"
      )
    }
  } else {
    ""
  }

}

