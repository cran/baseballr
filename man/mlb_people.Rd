% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_people.R
\name{mlb_people}
\alias{mlb_people}
\title{\strong{Find Biographical Information for MLB Players}}
\usage{
mlb_people(person_ids = NULL)
}
\arguments{
\item{person_ids}{MLBAMIDs for players of interest. Multiple IDs should be provided in a vector separated by a comma.}
}
\value{
Returns a tibble with the following columns:\tabular{ll}{
   col_name \tab types \cr
   id \tab integer \cr
   full_name \tab character \cr
   link \tab character \cr
   first_name \tab character \cr
   last_name \tab character \cr
   primary_number \tab character \cr
   birth_date \tab character \cr
   current_age \tab integer \cr
   birth_city \tab character \cr
   birth_state_province \tab character \cr
   birth_country \tab character \cr
   height \tab character \cr
   weight \tab integer \cr
   active \tab logical \cr
   use_name \tab character \cr
   middle_name \tab character \cr
   boxscore_name \tab character \cr
   nick_name \tab character \cr
   gender \tab character \cr
   is_player \tab logical \cr
   is_verified \tab logical \cr
   draft_year \tab integer \cr
   mlb_debut_date \tab character \cr
   name_first_last \tab character \cr
   name_slug \tab character \cr
   first_last_name \tab character \cr
   last_first_name \tab character \cr
   last_init_name \tab character \cr
   init_last_name \tab character \cr
   full_fml_name \tab character \cr
   full_lfm_name \tab character \cr
   strike_zone_top \tab numeric \cr
   strike_zone_bottom \tab numeric \cr
   pronunciation \tab character \cr
   primary_position_code \tab character \cr
   primary_position_name \tab character \cr
   primary_position_type \tab character \cr
   primary_position_abbreviation \tab character \cr
   bat_side_code \tab character \cr
   bat_side_description \tab character \cr
   pitch_hand_code \tab character \cr
   pitch_hand_description \tab character \cr
}
}
\description{
\strong{Find Biographical Information for MLB Players}
}
\examples{
\donttest{
  try(mlb_people(person_ids = 502671))
  try(mlb_people(person_ids = c(502671,605151)))
}
}
