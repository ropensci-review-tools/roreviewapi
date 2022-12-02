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
      "http(s)?://badges.ropensci.org/[[:digit:]]*_status.svg",
      badges_links,
      perl = TRUE
    )
  }
  if (!any(is_ropensci_badge(badges_links))) {
    FALSE
  } else {
    TRUE
  }

}

