# roreviewapi

<!-- badges: start -->

[![R build
status](https://github.com/ropenscilabs/roreviewapi/workflows/R-CMD-check/badge.svg)](https://github.com/ropenscilabs/roreviewapi/actions?query=workflow%3AR-CMD-check)
[![Project Status:
Concept](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

Plumber API to report on package structure and function. Uses
functionality provided by the
[`pkgcheck`](https://github.com/ropenscilabs/pkgcheck) and
[`pkgstats`](https://github.com/ropenscilabs/pkgstats) packages which
are not on CRAN and must first be installed by running either one of the
following two chunks of code:

``` r
remotes::install_github("ropenscilabs/pkgstats")
remotes::install_github("ropenscilabs/pkgcheck")
```

or,

``` r
pak::pkg_install("ropenscilabs/pkgstats")
pak::pkg_install("ropenscilabs/pkgcheck")
```

The [`pkgstats`](https://github.com/ropenscilabs/pkgstats) package also
requires both [`ctags`](https://ctags.io) and [GNU
`global`](https://www.gnu.org/software/global/) to be installed. See
package description and those links for how to install those libraries
on your system.

Once both of these packages have been successfully installed, the
`roreviewapi` package can then be loaded via a `library` call:

``` r
library(roreviewapi)
```

This package also uses the [github GraphQL
API](https://developer.github.com/v4) which requires a local github
token to be stored with an unambiguous name including `GITHUB` and maybe
`QL`, if alternative `GITHIB` tokens already exist. This can be obtained
from github (via your user settings), and stored using

``` r
Sys.setenv("GITHUB_QL" = "<my_token>")
```

This can also be set permanently by putting this line in your
`~/.Renviron` file (or creating this if it does not yet exist).

The package also works by locally caching previously analysed packages,
in a `roreviewapi` subdirectory of the location determined by

``` r
rappdirs::user_cache_dir()
```

You may manually erase the contents of this subdirectory at any time at
no risk.

## Usage

The server associated with this package can be built by cloning this
repository, and modifying the associated
[`Dockerfile`](https://github.com/ropenscilabs/roreviewapi/blob/master/Dockerfile)
by inserting a GitHub token (as `GITHUB_PAT`). Then in the local
directory holding a clone of this repo:

    docker build -t roreviewapi .
    docker run -it -p 8000:8000 --rm roreviewapi
