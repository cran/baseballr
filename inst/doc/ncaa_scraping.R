## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----ncaa_teams---------------------------------------------------------------
library(baseballr)
library(dplyr)
ncaa_teams_df <- load_ncaa_baseball_teams()

## ----ncaa_teams_website-------------------------------------------------------
try(ncaa_teams(year = most_recent_ncaa_baseball_season(), division = "1"))

## ----ncaa_scrape_batting------------------------------------------------------

team_id <- ncaa_teams_df %>% 
  dplyr::filter(.data$team_name == "Florida St.") %>% 
  dplyr::select("team_id") %>% 
  dplyr::distinct() %>% 
  dplyr::pull("team_id")

year <- most_recent_ncaa_baseball_season()

ncaa_team_player_stats(team_id = team_id, year = year, "batting")


## ----ncaa_scrape_pitching-----------------------------------------------------
ncaa_team_player_stats(team_id = team_id, year = year,  "pitching")

## ----ncaa_sch_id_lu-----------------------------------------------------------
ncaa_school_id_lu("Vand")

