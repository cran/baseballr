% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_team_history.R
\name{mlb_team_history}
\alias{mlb_team_history}
\title{\strong{MLB Teams History}}
\usage{
mlb_team_history(team_ids = NULL, start_season = NULL, end_season = NULL)
}
\arguments{
\item{team_ids}{The team_id(s) to return historical data for.}

\item{start_season}{The start_season to return historical data for from the given year to present.}

\item{end_season}{The end_season to return historical data for from the the creation to the given year.}
}
\value{
Returns a tibble with the following columns\tabular{ll}{
   col_name \tab types \cr
   all_star_status \tab character \cr
   team_id \tab integer \cr
   team_full_name \tab character \cr
   link \tab character \cr
   season \tab integer \cr
   team_code \tab character \cr
   file_code \tab character \cr
   team_abbreviation \tab character \cr
   team_name \tab character \cr
   location_name \tab character \cr
   first_year_of_play \tab character \cr
   short_name \tab character \cr
   franchise_name \tab character \cr
   club_name \tab character \cr
   active \tab logical \cr
   venue_id \tab integer \cr
   venue_name \tab character \cr
   venue_link \tab character \cr
   spring_venue_id \tab integer \cr
   spring_venue_link \tab character \cr
   league_id \tab integer \cr
   league_name \tab character \cr
   league_link \tab character \cr
   sport_id \tab integer \cr
   sport_link \tab character \cr
   sport_name \tab character \cr
}
}
\description{
\strong{MLB Teams History}
}
\examples{
\donttest{
  try(mlb_team_history(team_ids = 147))
}
}
