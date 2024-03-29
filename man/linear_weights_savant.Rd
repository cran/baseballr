% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics_linear_weights_savant.R
\name{linear_weights_savant}
\alias{linear_weights_savant}
\title{\strong{Generate linear weight values for events using Baseball Savant data}}
\usage{
linear_weights_savant(df, level = "plate appearance")
}
\arguments{
\item{df}{A data frame generated from Baseball Savant that has been run through
the \code{run_expectancy_code()} function.}

\item{level}{Whether to calculate linear weights the plate appearance or pitch
level. Defaults to 'plate appearance'.}
}
\value{
Returns a tibble with the following columns:\tabular{ll}{
   col_name \tab types \cr
   events \tab character \cr
   linear_weights_above_average \tab numeric \cr
   linear_weights_above_outs \tab numeric \cr
}
}
\description{
This function allows a user to generate linear weight values for events using Baseball Savant data. Output includes both linear weights above average and linear weights above outs for home runs, triples, doubles, singles, walks, hit by pitches, and outs.
}
\examples{
\donttest{
 try({
   df <- statcast_search(start_date = "2016-04-06", end_date = "2016-04-15", 
                         playerid = 621043, player_type = 'batter') 
   df <- run_expectancy_code(df, level = "plate appearances")
   linear_weights_savant(df, level = "plate appearance")
 })
}
}
