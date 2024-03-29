#' serve plumber API to report on packages
#'
#' The API exposes the single POST points of `report` to download software from
#' the given URL and return a textual analysis of its structure and
#' functionality.
#'
#' @param port Port for API to be exposed on
#' @param cache_dir Directory where previously downloaded repositories are
#' cached
#' @param os Name of operating system, passed to \pkg{remotes} package to
#' install system dependencies.
#' @param os_release Name of operating system release, passed to \pkg{remotes}
#' package to install system dependencies.
#' @return Nothing; calling this starts a blocking process.
#'
#' @family main
#' @export
serve_api <- function (port = 8000L,
                       cache_dir = NULL,
                       os = "",
                       os_release = "") {

    if (os != "") {
        Sys.setenv ("ROREVIEWAPI_OS" = os)
    }
    if (os_release != "") {
        Sys.setenv ("ROREVIEWAPI_OS_RELEASE" = os_release)
    }

    ip <- data.frame (utils::installed.packages ())

    f <- fs::path (
        ip$LibPath [ip$Package == "roreviewapi"],
        "roreviewapi", "plumber.R"
    )

    # ----------cache_dir set up----------
    if (is.null (cache_dir)) { # allows tempdir() to be passed for CRAN tests

        requireNamespace ("pkgcheck")

        cache_dir <- Sys.getenv ("PKGCHECK_CACHE_DIR")
        if (!nzchar (cache_dir)) {
            cache_dir <- fs::path (rappdirs::user_cache_dir (), "R", "pkgcheck")
            # normalizePath resolves `~` to /root instead of /home:
            if (grepl ("^\\/root", cache_dir)) {
                cache_dir <- gsub ("^\\/root", "/home", cache_dir)
            }
        }

        if (!fs::file_exists (cache_dir)) {
            fs::dir_create (cache_dir, recurse = TRUE)
        }
    }

    Sys.setenv ("PKGCHECK_CACHE_DIR" = cache_dir)

    # ----------log_dir set up----------
    log_dir <- here::here ("logs")
    Sys.setenv ("ROREVAPI_LOG_DIR" = log_dir)
    if (!fs::dir_exists (log_dir)) {
        fs::dir_create (log_dir)
    }

    log_file <- fs::file_temp ("roreviewapi_", tmp_dir = log_dir, ext = ".log")
    Sys.setenv ("ROREVAPI_LOG_FILE" = log_file)
    logger::log_appender (logger::appender_tee (log_file))

    convert_empty <- function (string) {
        ifelse (string == "", "-", string)
    }

    # ----------local static dir set up----------
    static_dir <- fs::path (cache_dir, "static")
    if (!fs::file_exists (static_dir)) {
        fs::dir_create (static_dir, recurse = TRUE)
    }

    # ----------plumber process set up----------
    pr <- plumber::pr (f)

    pr <- plumber::pr_static (pr, "/assets", static_dir)

    # pr$registerHooks(
    pr <- plumber::pr_hooks (
        pr,
        list (
            preroute = function () {
                # Start timer for log info
                tictoc::tic ()
            },
            postroute = function (req, res) {
                end <- tictoc::toc (quiet = TRUE) # nolint
                # Log details about the request and the response
                # TODO: Sanitize log details - perhaps in convert_empty
                logger::log_info ('{convert_empty(req$REMOTE_ADDR)} "{convert_empty(req$HTTP_USER_AGENT)}" {convert_empty(req$HTTP_HOST)} {convert_empty(req$REQUEST_METHOD)} {convert_empty(req$PATH_INFO)} {convert_empty(req$QUERY_STRING)} {convert_empty(res$status)} {round(end$toc - end$tic, digits = getOption("digits", 5))}') # nolint
            }
        )
    )

    plumber::pr_run (pr,
        host = "0.0.0.0",
        port = as.integer (port)
    )
}
