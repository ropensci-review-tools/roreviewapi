% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api.R
\name{serve_api}
\alias{serve_api}
\title{serve plumber API to report on packages}
\usage{
serve_api(port = 8000L, cache_dir = NULL, os = "", os_release = "")
}
\arguments{
\item{port}{Port for API to be exposed on}

\item{cache_dir}{Directory where previously downloaded repositories are
cached}

\item{os}{Name of operating system, passed to \pkg{remotes} package to
install system dependencies.}

\item{os_release}{Name of operating system release, passed to \pkg{remotes}
package to install system dependencies.}
}
\value{
Nothing; calling this starts a blocking process.
}
\description{
The API exposes the single POST points of \code{report} to download software from
the given URL and return a textual analysis of its structure and
functionality.
}
\seealso{
Other main: 
\code{\link{collate_editor_check}()},
\code{\link{editor_check}()}
}
\concept{main}
