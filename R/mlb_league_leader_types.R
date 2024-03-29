#' @title **MLB League Leader Types** 
#' @return Returns a tibble with the following columns
#'  |col_name      |types     |
#'  |:-------------|:---------|
#'  |leader_type   |character |
#' @export
#' @examples \donttest{
#'   try(mlb_league_leader_types())
#' }
mlb_league_leader_types <- function(){
  
  mlb_endpoint <- mlb_stats_endpoint("v1/leagueLeaderTypes")
  query_params <- list()
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr = {
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      league_leader_types <- jsonlite::fromJSON(jsonlite::toJSON(resp), flatten = TRUE)  %>% 
        janitor::clean_names() %>% 
        as.data.frame() %>% 
        dplyr::rename(
          "leader_type" = "display_name") %>%
        make_baseballr_data("MLB League Leader Types data from MLB.com",Sys.time())
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  
  return(league_leader_types)
}

