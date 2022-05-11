#' List any direct dependencies which are not latest CRAN versions
#'
#' @param path Path to local package
#' @return Character vector of any packages which can be updated.
#' @family utils
#' @export
rorevapi_updated_pkgs <- function (path) {

    ip <- data.frame (utils::installed.packages ()) [, c ("Package", "Version")]
    ap <- data.frame (utils::available.packages ()) [, c ("Package", "Version")]
    ap <- ap [which (ap$Package %in% ip$Package), ]
    ip <- ip [which (ip$Package %in% ap$Package), ]

    names (ap) [2] <- "Version_CRAN"
    ip$Version_CRAN <- ap$Version_CRAN [match (ip$Package, ap$Package)]
    updates <- ip [which (ip$Version != ip$Version_CRAN), ]

    desc <- file.path (path, "DESCRIPTION")
    if (!file.exists (desc)) {
        return (NULL)
    }
    desc <- data.frame (read.dcf (desc))

    deps <- c (desc$Imports, desc$Suggests) # no depends
    deps <- unlist (strsplit (deps, ","))
    deps <- gsub ("\\n", "", deps)

    updates <- updates$Package [which (updates$Package %in% deps)]

    return (updates)
}
