#' Check whether README.md features an rOpenSci software-review badge
#'
#' @param path
#'
#' @return A string, empty if the badge was found.
#' @export
#'
has_readme_badge <- function(path = getwd()) {
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

  is_ropensci_badge <- function(badges_links) {
    grepl(
      "https://badges.ropensci.org/[[:digit:]]*_status.svg",
      badges_links,
      perl = TRUE
    )
  }

  is_http_ropensci_badge <- function(badges_links) {
    grepl(
      "http://badges.ropensci.org/[[:digit:]]*_status.svg",
      badges_links,
      perl = TRUE
    )
  }

  if (!any(is_ropensci_badge(badges_links))) {
    if (any(is_http_ropensci_badge(badges_links))) {
      "Use https not http in the software review badge."
    } else {
      paste(
        c(
          "Missing software review badge, add it with", "",
          "```markdown",
          "[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/<issue-number>_status.svg)](https://github.com/ropensci/software-review/issues/<issue-number>)",
          "```"
        ),
        collapse = "\n"
      )
    }
  } else {
    ""
  }

}

