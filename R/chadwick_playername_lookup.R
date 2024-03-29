#' @rdname chadwick_player_name_lu
#' @title **Look up Baseball Player Name by ID**
#' @description This function allows you to query the Chadwick Bureau's public register of baseball players and the various IDs associated with them in different systems of record.
#' @param id An integer or character string representing a player ID in a baseball database, cross-referenced through the Chadwick Bureau's public register of baseball players.
#' @return A data frame of baseball players and the various IDs associated with them in different systems of record.
#'  |col_name         |types     |
#'  |:----------------|:---------|
#'  |name_first       |character |
#'  |name_last        |character |
#'  |name_given       |character |
#'  |name_suffix      |character |
#'  |name_nick        |character |
#'  |birth_year       |integer   |
#'  |mlb_played_first |integer   |
#'  |key_mlbam        |integer   |
#'  |key_retro        |character |
#'  |key_bbref        |character |
#'  |key_fangraphs    |integer   |
#' @export
#' @examples \donttest{
#'   try(playername_lookup(4885))
#'   try(playername_lookup("kaaihki01"))
#' }

playername_lookup <- function(id) {
  if (!exists("chadwick_player_lu_table")) {
    chadwick_player_lu_table <- chadwick_player_lu()
  }
  
  x <- chadwick_player_lu_table %>% 
    dplyr::filter(id == .data$key_mlbam | id == .data$key_retro | id == .data$key_bbref | id == .data$key_fangraphs) %>%
    dplyr::select("name_first", "name_last", "name_given", "name_suffix",
                  "name_nick", "birth_year", "mlb_played_first", "key_mlbam", 
                  "key_retro", "key_bbref", "key_fangraphs")
  x <- x %>%
    make_baseballr_data("Player Name Lookup from the Chadwick Bureau's public register of baseball players",Sys.time())
  return(x)
}
