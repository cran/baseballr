#' @title **MLB Teams Stats**
#' @param stat_type Stat type to return statistics for.
#' @param game_type Game type to return information for a particular statistic in a particular game type.
#' @param stat_group Stat group to return information and ranking for a particular statistic in a particular group.
#' @param season Year to return information and ranking for a particular statistic in a given year. 
#' @param sport_ids The sport_id(s) to return information and ranking information for.
#' @param sort_stat Sort return based on stat.
#' @param order Order return based on either desc or asc.
#' 
#' @return Returns a tibble with the following columns
#'   |col_name                |types     |
#'   |:-----------------------|:---------|
#'   |total_splits            |integer   |
#'   |season                  |character |
#'   |rank                    |integer   |
#'   |games_played            |integer   |
#'   |ground_outs             |integer   |
#'   |air_outs                |integer   |
#'   |runs                    |integer   |
#'   |doubles                 |integer   |
#'   |triples                 |integer   |
#'   |home_runs               |integer   |
#'   |strike_outs             |integer   |
#'   |base_on_balls           |integer   |
#'   |intentional_walks       |integer   |
#'   |hits                    |integer   |
#'   |hit_by_pitch            |integer   |
#'   |avg                     |character |
#'   |at_bats                 |integer   |
#'   |obp                     |character |
#'   |slg                     |character |
#'   |ops                     |character |
#'   |caught_stealing         |integer   |
#'   |stolen_bases            |integer   |
#'   |stolen_base_percentage  |character |
#'   |ground_into_double_play |integer   |
#'   |number_of_pitches       |integer   |
#'   |plate_appearances       |integer   |
#'   |total_bases             |integer   |
#'   |rbi                     |integer   |
#'   |left_on_base            |integer   |
#'   |sac_bunts               |integer   |
#'   |sac_flies               |integer   |
#'   |babip                   |character |
#'   |ground_outs_to_airouts  |character |
#'   |catchers_interference   |integer   |
#'   |at_bats_per_home_run    |character |
#'   |team_id                 |integer   |
#'   |team_name               |character |
#'   |team_link               |character |
#'   |splits_tied_with_offset |list      |
#'   |splits_tied_with_limit  |list      |
#'   |type_display_name       |character |
#'   |group_display_name      |character |
#' @export
#' @examples \donttest{
#'   try(mlb_teams_stats(stat_type = 'season', stat_group = 'hitting', season = 2021))
#' }
mlb_teams_stats <- function(stat_type = NULL,
                            game_type = NULL,
                            stat_group = NULL,
                            season = NULL,
                            sport_ids = NULL,
                            sort_stat = NULL,
                            order = NULL){
  
  sport_ids <- paste(sport_ids, collapse = ',')
  mlb_endpoint <- mlb_stats_endpoint("v1/teams/stats")
  query_params <- list(
    stats = stat_type,
    gameType = game_type,
    group = stat_group,
    season = season,
    sportIds = sport_ids,
    sortStat = sort_stat,
    order = order
  )
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr={
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      stats_leaders <- jsonlite::fromJSON(jsonlite::toJSON(resp[['stats']]), flatten = TRUE)  
      stats_leaders$season <- NULL
      stats <- stats_leaders %>% 
        tidyr::unnest("splits") %>% 
        janitor::clean_names()  %>% 
        as.data.frame() %>% 
        dplyr::select(-"exemptions") %>%
        make_baseballr_data("MLB Teams Stats data from MLB.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  colnames(stats)<-gsub("stat_", "", colnames(stats))
  return(stats)
}

