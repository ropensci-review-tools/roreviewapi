% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gh-issue.R
\name{check_issue_template}
\alias{check_issue_template}
\title{Check template variables in GitHub issue}
\usage{
check_issue_template(orgrepo, issue_num)
}
\arguments{
\item{orgrepo}{GitHub organization and repo as single string separated by
forward slash (\code{org/repo}).}

\item{issue_num}{Number of issue from which to extract opening comment}
}
\value{
Comment as character string
}
\description{
Check template variables in GitHub issue
}
\seealso{
Other ropensci: 
\code{\link{is_user_authorized}()},
\code{\link{push_to_gh_pages}()},
\code{\link{readme_has_peer_review_badge}()},
\code{\link{srr_counts}()},
\code{\link{srr_counts_from_report}()},
\code{\link{srr_counts_summary}()},
\code{\link{stats_badge}()}
}
\concept{ropensci}
