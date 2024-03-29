% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics.R
\name{metrics}
\alias{metrics}
\title{\strong{Metrics Functions Overview}}
\description{
\describe{
\item{\code{fip_plus()}:}{ Calculate FIP and related metrics for any set of data.}
\item{\code{woba_plus()}}{ Calculate wOBA and related metrics for any set of data.}
\item{\code{team_consistency()}}{ Calculate Team-level Consistency.}
\item{\code{label_statcast_imputed_data()}}{ Label Statcast data as imputed.}
\item{\code{run_expectancy_code()}}{ Generate run expectancy and related measures from Baseball Savant data.}
\item{\code{linear_weights_savant()}}{ Generate linear weight values for events using Baseball Savant data.}
}
}
\details{
\subsection{\strong{Calculate Team-level Consistency}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  team_consistency(year=2015)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Calculate FIP and related metrics for any set of data}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  fips_plus(df)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Calculate wOBA and related metrics for any set of data}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  woba_plus(df)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Label Statcast data as imputed}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  statcast_df <- scrape_statcast_savant("2017-05-01", "2017-05-02")
  sc_df <- label_statcast_imputed_data(statcast_df)
  mean(sc_df$imputed)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Generate run expectancy and related measures from Baseball Savant data}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  df <- statcast_search(start_date = "2016-04-06", end_date = "2016-04-15", 
                        playerid = 621043, player_type = 'batter') 
  run_expectancy_code(df, level = "plate appearances")
}\if{html}{\out{</div>}}
}

\subsection{\strong{Generate linear weight values for events using Baseball Savant data}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  df <- statcast_search(start_date = "2016-04-06", end_date = "2016-04-15", 
                        playerid = 621043, player_type = 'batter') 
  df <- run_expectancy_code(df, level = "plate appearances")
  linear_weights_savant(df, level = "plate appearance")
}\if{html}{\out{</div>}}
}
}
