# nocov start
.onLoad <- function (libname, pkgname) { # nolint

    requireNamespace ("pkgcheck") # to load pkgcheck_cache_dir

    cdir <- getOption ("pkgcheck.cache_dir")
    if (!is.null (cdir)) {
        Sys.setenv ("PKGCHECK_CACHE_DIR" = cdir)
    }

    invisible ()
}

.onUnload <- function (libname, pkgname) { # nolint

    Sys.unsetenv ("PKGCHECK_CACHE_DIR")
}
# nocov end
