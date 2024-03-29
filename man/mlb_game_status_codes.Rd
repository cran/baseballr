% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_game_status_codes.R
\name{mlb_game_status_codes}
\alias{mlb_game_status_codes}
\title{\strong{MLB Game Status Codes}}
\usage{
mlb_game_status_codes()
}
\value{
Returns a tibble with the following columns\tabular{ll}{
   col_name \tab types \cr
   abstract_game_state \tab character \cr
   coded_game_state \tab character \cr
   detailed_state \tab character \cr
   status_code \tab character \cr
   reason \tab character \cr
   abstract_game_code \tab character \cr
}
}
\description{
\strong{MLB Game Status Codes}
}
\examples{
\donttest{
  try(mlb_game_status_codes())
}
}
