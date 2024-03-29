% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ncaa_roster.R
\name{ncaa_roster}
\alias{ncaa_roster}
\title{\strong{Get NCAA Baseball Rosters}}
\usage{
ncaa_roster(team_id = NULL, year, ...)
}
\arguments{
\item{team_id}{NCAA id for a school}

\item{year}{The year of interest}

\item{...}{Additional arguments passed to an underlying function like httr.}
}
\value{
A data frame containing roster information, including
IDs and urls for each player (if available)\tabular{ll}{
   col_name \tab types \cr
   player_name \tab character \cr
   class \tab character \cr
   player_id \tab character \cr
   season \tab numeric \cr
   number \tab character \cr
   position \tab character \cr
   player_url \tab character \cr
   team_name \tab character \cr
   conference \tab character \cr
   team_id \tab numeric \cr
   division \tab numeric \cr
   conference_id \tab numeric \cr
}
}
\description{
\strong{Get NCAA Baseball Rosters}
}
\examples{
\donttest{
  try(ncaa_roster(team_id = 104, year = 2023))
}
}
