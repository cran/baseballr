#' @title **MLB Standings Types** 
#' @return Returns a tibble with the following columns
#'  |col_name                   |types     |
#'  |:--------------------------|:---------|
#'  |standings_type_name        |character |
#'  |standings_type_description |character |
#' @export
#' @examples \donttest{
#'   try(mlb_standings_types())
#' }
mlb_standings_types <- function(){
  
  mlb_endpoint <- mlb_stats_endpoint("v1/standingsTypes")
  query_params <- list()
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr = {
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      standings_types <- jsonlite::fromJSON(jsonlite::toJSON(resp), flatten = TRUE)  %>% 
        janitor::clean_names() %>% 
        as.data.frame() %>% 
        dplyr::rename(
          "standings_type_name" = "name",
          "standings_type_description" = "description") %>%
        make_baseballr_data("MLB Standings Types data from MLB.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  
  return(standings_types)
}

