% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlb_game_linescore.R
\name{mlb_game_linescore}
\alias{mlb_game_linescore}
\title{\strong{Retrieve game linescores for major and minor league games}}
\usage{
mlb_game_linescore(game_pk)
}
\arguments{
\item{game_pk}{The unique game_pk identifier for the game}
}
\value{
Returns a tibble with the following columns\tabular{ll}{
   col_name \tab types \cr
   game_pk \tab numeric \cr
   home_team_id \tab character \cr
   home_team_name \tab character \cr
   away_team_id \tab character \cr
   away_team_name \tab character \cr
   num \tab integer \cr
   ordinal_num \tab character \cr
   home_runs \tab integer \cr
   home_hits \tab integer \cr
   home_errors \tab integer \cr
   home_left_on_base \tab integer \cr
   away_runs \tab integer \cr
   away_hits \tab integer \cr
   away_errors \tab integer \cr
   away_left_on_base \tab integer \cr
   home_team_link \tab character \cr
   home_team_season \tab character \cr
   home_team_venue_id \tab character \cr
   home_team_venue_name \tab character \cr
   home_team_venue_link \tab character \cr
   home_team_team_code \tab character \cr
   home_team_file_code \tab character \cr
   home_team_abbreviation \tab character \cr
   home_team_team_name \tab character \cr
   home_team_location_name \tab character \cr
   home_team_first_year_of_play \tab character \cr
   home_team_league_id \tab character \cr
   home_team_league_name \tab character \cr
   home_team_league_link \tab character \cr
   home_team_division_id \tab character \cr
   home_team_division_name \tab character \cr
   home_team_division_link \tab character \cr
   home_team_sport_id \tab character \cr
   home_team_sport_link \tab character \cr
   home_team_sport_name \tab character \cr
   home_team_short_name \tab character \cr
   home_team_record_games_played \tab character \cr
   home_team_record_wild_card_games_back \tab character \cr
   home_team_record_league_games_back \tab character \cr
   home_team_record_spring_league_games_back \tab character \cr
   home_team_record_sport_games_back \tab character \cr
   home_team_record_division_games_back \tab character \cr
   home_team_record_conference_games_back \tab character \cr
   home_team_record_league_record_wins \tab character \cr
   home_team_record_league_record_losses \tab character \cr
   home_team_record_league_record_pct \tab character \cr
   home_team_record_division_leader \tab character \cr
   home_team_record_wins \tab character \cr
   home_team_record_losses \tab character \cr
   home_team_record_winning_percentage \tab character \cr
   home_team_franchise_name \tab character \cr
   home_team_club_name \tab character \cr
   home_team_all_star_status \tab character \cr
   home_team_active \tab character \cr
   away_team_link \tab character \cr
   away_team_season \tab character \cr
   away_team_venue_id \tab character \cr
   away_team_venue_name \tab character \cr
   away_team_venue_link \tab character \cr
   away_team_team_code \tab character \cr
   away_team_file_code \tab character \cr
   away_team_abbreviation \tab character \cr
   away_team_team_name \tab character \cr
   away_team_location_name \tab character \cr
   away_team_first_year_of_play \tab character \cr
   away_team_league_id \tab character \cr
   away_team_league_name \tab character \cr
   away_team_league_link \tab character \cr
   away_team_division_id \tab character \cr
   away_team_division_name \tab character \cr
   away_team_division_link \tab character \cr
   away_team_sport_id \tab character \cr
   away_team_sport_link \tab character \cr
   away_team_sport_name \tab character \cr
   away_team_short_name \tab character \cr
   away_team_record_games_played \tab character \cr
   away_team_record_wild_card_games_back \tab character \cr
   away_team_record_league_games_back \tab character \cr
   away_team_record_spring_league_games_back \tab character \cr
   away_team_record_sport_games_back \tab character \cr
   away_team_record_division_games_back \tab character \cr
   away_team_record_conference_games_back \tab character \cr
   away_team_record_league_record_wins \tab character \cr
   away_team_record_league_record_losses \tab character \cr
   away_team_record_league_record_pct \tab character \cr
   away_team_record_division_leader \tab character \cr
   away_team_record_wins \tab character \cr
   away_team_record_losses \tab character \cr
   away_team_record_winning_percentage \tab character \cr
   away_team_franchise_name \tab character \cr
   away_team_club_name \tab character \cr
   away_team_all_star_status \tab character \cr
   away_team_active \tab character \cr
}
}
\description{
\strong{Retrieve game linescores for major and minor league games}
}
\examples{
\donttest{
  try(mlb_game_linescore(game_pk = 566001))
}
}
