% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{request_with_proxy}
\alias{request_with_proxy}
\title{\strong{Retry http request with proxy}}
\usage{
request_with_proxy(url, ...)
}
\arguments{
\item{url}{Request url}

\item{...}{passed to httr::RETRY}
}
\description{
This is a thin wrapper on httr::RETRY
}
\keyword{internal}
