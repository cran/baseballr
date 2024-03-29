#' @title **MLB Positions** 
#' @return Returns a tibble with the following columns
#'  |col_name              |types     |
#'  |:---------------------|:---------|
#'  |position_short_name   |character |
#'  |position_full_name    |character |
#'  |position_abbreviation |character |
#'  |position_code         |character |
#'  |position_type         |character |
#'  |position_formal_name  |character |
#'  |game_position         |logical   |
#'  |pitcher               |logical   |
#'  |fielder               |logical   |
#'  |outfield              |logical   |
#'  |position_display_name |character |
#' @export
#' @examples \donttest{
#'   try(mlb_positions())
#' }
mlb_positions <- function(){
  
  mlb_endpoint <- mlb_stats_endpoint("v1/positions")
  query_params <- list()
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr = {
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      positions <- jsonlite::fromJSON(jsonlite::toJSON(resp), flatten = TRUE)  %>% 
        janitor::clean_names() %>% 
        as.data.frame() %>% 
        dplyr::rename(
          "position_short_name" = "short_name",
          "position_full_name" = "full_name",
          "position_abbreviation" = "abbrev",
          "position_code" = "code",
          "position_type" = "type",
          "position_formal_name" = "formal_name",
          "position_display_name" = "display_name") %>% 
        dplyr::select(c(
          "position_short_name", "position_full_name",
          "position_abbreviation", "position_code", 
          "position_type", "position_formal_name",
          "position_display_name", "outfield", "game_position",
          "pitcher", "fielder")) %>%
        make_baseballr_data("MLB Positions data from MLB.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  
  return(positions)
}

