#' @title **MLB Review Reasons** 
#' @return Returns a tibble with the following columns
#'  |col_name                  |types     |
#'  |:-------------------------|:---------|
#'  |review_reason_code        |character |
#'  |review_reason_description |character |
#' @export
#' @examples \donttest{
#'   try(mlb_review_reasons())
#' }
mlb_review_reasons <- function(){
  
  mlb_endpoint <- mlb_stats_endpoint("v1/reviewReasons")
  query_params <- list()
  
  mlb_endpoint <- httr::modify_url(mlb_endpoint, query = query_params)
  
  tryCatch(
    expr = {
      resp <- mlb_endpoint %>% 
        mlb_api_call()
      review_reasons <- jsonlite::fromJSON(jsonlite::toJSON(resp), flatten = TRUE)  %>% 
        janitor::clean_names() %>% 
        as.data.frame() %>% 
        dplyr::rename(
          "review_reason_code" = "code",
          "review_reason_description" = "description"
        ) %>%
        make_baseballr_data("MLB Review Reasons data from MLB.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  return(review_reasons)
}

