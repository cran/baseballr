% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_job_types.R
\name{mlb_job_types}
\alias{mlb_job_types}
\title{\strong{MLB Job Types}}
\usage{
mlb_job_types()
}
\value{
Returns a tibble with the following columns\tabular{ll}{
   col_name \tab types \cr
   job_code \tab character \cr
   job \tab character \cr
   sort_order \tab integer \cr
}
}
\description{
\strong{MLB Job Types}
}
\examples{
\donttest{
  try(mlb_job_types())
}
}
