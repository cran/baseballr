#' @title **MLB Divisions** 
#' @param division_id Return division(s) data for a specific division
#' @param league_id Return division(s) data for all divisions in a specific league
#' @param sport_id Return division(s) for all divisions in a specific sport.
#' @return Returns a tibble with the following columns
#'  |col_name              |types     |
#'  |:---------------------|:---------|
#'  |division_id           |integer   |
#'  |division_name         |character |
#'  |season                |character |
#'  |division_name_short   |character |
#'  |division_link         |character |
#'  |division_abbreviation |character |
#'  |has_wildcard          |logical   |
#'  |sort_order            |integer   |
#'  |num_playoff_teams     |integer   |
#'  |active                |logical   |
#'  |league_id             |integer   |
#'  |league_link           |character |
#'  |sport_id              |integer   |
#'  |sport_link            |character |
#' @export
#' @examples \donttest{
#'   try(mlb_divisions(sport_id = 1))
#' }
mlb_divisions <- function(division_id = NULL,
                          league_id = NULL,
                          sport_id = NULL){
  
  mlb_endpoint <- mlb_stats_endpoint("v1/divisions")
  query_params <- list(
    divisionId = division_id,
    leagueId = league_id,
    sportId = sport_id
  )
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr = {
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      divisions <- jsonlite::fromJSON(jsonlite::toJSON(resp$divisions), flatten = TRUE)  %>% 
        janitor::clean_names() %>% 
        as.data.frame() %>% 
        dplyr::rename(
          "division_id" = "id",
          "division_name" = "name",
          "division_name_short" = "name_short",
          "division_link" = "link",
          "division_abbreviation" = "abbreviation") %>%
        make_baseballr_data("MLB Divisions data from MLB.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  return(divisions)
}

