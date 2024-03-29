% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb.R
\name{mlb}
\alias{mlb}
\title{\strong{MLB Functions Overview}}
\description{
\describe{
\item{\code{mlb_batting_orders()}:}{ Retrieve batting orders for a given MLB game.}
\item{\code{mlb_draft()}:}{ Retrieve draft pick information by year.}
\item{\code{mlb_pbp()}:}{ Acquire pitch-by-pitch data for Major and Minor League games.}
\item{\code{mlb_game_info()}:}{ Retrieve additional game information for major and minor league games.}
\item{\code{mlb_game_pks()}:}{ Get MLB Game Info by Date and Level.}
\item{\code{mlb_schedule()}:}{ Find game_pk values for professional baseball games (major and minor leagues).}
\item{\code{mlb_probables()}:}{ Retrieve probable starters for a given MLB game.}
}
}
\details{
\subsection{\strong{Retrieve batting orders for a given MLB game}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_batting_orders(game_pk=566001)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Retrieve draft pick information by year}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_draft(year= 2018)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Acquire pitch-by-pitch data for Major and Minor League games}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_pbp(game_pk = 575156)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Retrieve additional game information for major and minor league games}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_game_info(game_pk = 566001)
}\if{html}{\out{</div>}}
}

\subsection{\strong{Get MLB Game Info by Date and Level}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_game_pks("2019-04-29")
}\if{html}{\out{</div>}}
}

\subsection{\strong{Find game_pk values for professional baseball games (major and minor leagues)}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_schedule(season = "2019")
}\if{html}{\out{</div>}}
}

\subsection{\strong{Retrieve probable starters for a given MLB game}}{

\if{html}{\out{<div class="sourceCode r">}}\preformatted{  mlb_probables(566001)
}\if{html}{\out{</div>}}
}
}
