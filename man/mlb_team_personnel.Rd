% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_team_personnel.R
\name{mlb_team_personnel}
\alias{mlb_team_personnel}
\title{\strong{MLB Team Personnel}}
\usage{
mlb_team_personnel(team_id = NULL, date = NULL)
}
\arguments{
\item{team_id}{Team ID to return team coach information for.}

\item{date}{Date to return team coach information for.}
}
\value{
Returns a tibble with the following columns\tabular{ll}{
   col_name \tab types \cr
   jersey_number \tab character \cr
   job \tab character \cr
   job_id \tab character \cr
   title \tab character \cr
   person_id \tab integer \cr
   person_full_name \tab character \cr
   person_link \tab character \cr
}
}
\description{
\strong{MLB Team Personnel}
}
\examples{
\donttest{
  try(mlb_team_personnel(team_id = 137, date = "08/28/2016"))
}
}
