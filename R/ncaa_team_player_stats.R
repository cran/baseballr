#' @rdname ncaa_team_player_stats
#' @title **Scrape NCAA baseball Team Player Stats (Division I, II, and III)**
#' @description This function allows the user to obtain batting or pitching statistics for any school affiliated with the NCAA at the division I, II, or III levels. The function acquires data from the NCAA's website (stats.ncaa.org) and returns a tibble.
#' @param team_id The numerical ID that the NCAA website uses to identify a team
#' @param year The season for which data should be returned, in the form of "YYYY". Years currently available: 2013-2017.
#' @param type A string indicating whether to return "batting" or "pitching" statistics
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A data frame with the following variables
#'  
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |year          |integer   |
#'    |team_name     |character |
#'    |team_id       |numeric   |
#'    |conference_id |integer   |
#'    |conference    |character |
#'    |division      |numeric   |
#'    |player_id     |integer   |
#'    |player_url    |character |
#'    |player_name   |character |
#'    |Yr            |character |
#'    |Pos           |character |
#'    |Jersey        |character |
#'    |GP            |numeric   |
#'    |GS            |numeric   |
#'    |BA            |numeric   |
#'    |OBPct         |numeric   |
#'    |SlgPct        |numeric   |
#'    |R             |numeric   |
#'    |AB            |numeric   |
#'    |H             |numeric   |
#'    |2B            |numeric   |
#'    |3B            |numeric   |
#'    |TB            |numeric   |
#'    |HR            |numeric   |
#'    |RBI           |numeric   |
#'    |BB            |numeric   |
#'    |HBP           |numeric   |
#'    |SF            |numeric   |
#'    |SH            |numeric   |
#'    |K             |numeric   |
#'    |DP            |numeric   |
#'    |CS            |numeric   |
#'    |Picked        |numeric   |
#'    |SB            |numeric   |
#'    |RBI2out       |numeric   |
#'  
#' @import dplyr
#' @import rvest
#' @importFrom stringr str_split
#' @export
#' @examples
#' \donttest{
#'   try(ncaa_team_player_stats(team_id = 234, year = 2023, type = "batting"))
#' }

ncaa_team_player_stats <- function(team_id, year = most_recent_ncaa_baseball_season(), type = 'batting', ...) {
  
  if (is.null(team_id)) {
    cli::cli_abort("Enter valid team_id")
  }
  if (is.null(year)) {
    cli::cli_abort("Enter valid year as a number (YYYY)")
  }
  if (is.null(type) | !(type %in% c("batting","pitching", "fielding"))) {
    cli::cli_abort("Enter valid type: 'batting', 'pitching'")
  }
  
  if (year < 2013) {
    stop('you must provide a year that is greater than or equal to 2013')
  }
  headers <- httr::add_headers(.headers = .ncaa_headers())
  tryCatch(
    expr = {
      if (type == "batting") {
        id <- load_ncaa_baseball_season_ids() %>% 
          dplyr::filter(.data$season == year) %>% 
          dplyr::select("id")
        type_id <- load_ncaa_baseball_season_ids() %>% 
          dplyr::filter(.data$season == year) %>% 
          dplyr::select("batting_id")
        url <- paste0("http://stats.ncaa.org/team/",team_id,"/stats?game_sport_year_ctl_id=", id, "&id=", id)
        
        team_stats_resp <- request_with_proxy(url = url, ..., headers)
        
        check_status(team_stats_resp)
        
        payload <- team_stats_resp %>% 
          httr::content(as = "text", encoding = "UTF-8") %>% 
          xml2::read_html()
        
        data_read <- payload
        
        data <- (data_read %>%
                   rvest::html_elements("table"))[[3]] %>%
          rvest::html_table()
        df <- as.data.frame(data)
        df$year <- year
        df$team_id <- team_id
        df <- df %>%
          dplyr::left_join(load_ncaa_baseball_teams(),
                           by = c("team_id" = "team_id", "year" = "year"))
        df <- df %>% 
          dplyr::select("year", "team_name", "conference", "division", tidyr::everything())
        df$Player <- gsub("x ", "", df$Player)
        if (!"RBI2out" %in% names(df)) {
          df$RBI2out <- NA
        }
        
        if('OPP DP' %in% colnames(df) == TRUE) {
          df <- df %>%
            dplyr::rename(DP = "OPP DP")
        }
        
        df <- df %>% dplyr::select(
          "year","team_name","conference","division","Jersey","Player",
          "Yr","Pos","GP","GS","BA","OBPct","SlgPct","R","AB",
          "H","2B","3B","TB","HR","RBI","BB","HBP","SF","SH",
          "K","DP","CS","Picked","SB","RBI2out","team_id","conference_id")
        
        character_cols <- c("year", "team_name", "conference", "Jersey", "Player",
                            "Yr", "Pos")
        
        numeric_cols <- c("division", "GP", "GS", "BA", "OBPct", "SlgPct", "R", "AB",
                          "H", "2B", "3B", "TB", "HR", "RBI", "BB", "HBP", "SF", "SH",
                          "K", "DP", "CS", "Picked", "SB", "RBI2out", "team_id", "conference_id")
        
        suppressWarnings(
          df <- df %>%
            dplyr::mutate_at(vars(character_cols), function(x){as.character(x)})
        )
        suppressWarnings(
          df <- df %>%
            dplyr::mutate_at(vars(numeric_cols), function(x){as.numeric(as.character(x))})
        )
        
      } else {
        year_id <- load_ncaa_baseball_season_ids() %>% 
          dplyr::filter(.data$season == year) %>% 
          dplyr::select("id")
        type_id <- load_ncaa_baseball_season_ids() %>% 
          dplyr::filter(.data$season == year) %>% 
          dplyr::select("pitching_id")
        url <- paste0("http://stats.ncaa.org/team/", team_id, "/stats?id=", year_id, "&year_stat_category_id=", type_id)
        
        team_stats_resp <- request_with_proxy(url = url, ..., headers)
        
        check_status(team_stats_resp)
        
        payload <- team_stats_resp %>% 
          httr::content(as = "text", encoding = "UTF-8") %>% 
          xml2::read_html()
        
        data_read <- payload
        
        data <- (data_read %>%
                   rvest::html_elements("table"))[[3]] %>%
          rvest::html_table()
        df <- as.data.frame(data)
        df <- df[,-6]
        df$year <- year
        df$team_id <- team_id
        df <- df %>%
          dplyr::left_join(load_ncaa_baseball_teams(), by = c("team_id" = "team_id", "year" = "year"))
        df <- df %>% 
          dplyr::select("year", "team_name", "conference", "division", tidyr::everything())
        df$Player <- gsub("x ", "", df$Player)
        
        df <- df %>% dplyr::select( 
          "year","team_name","conference","division","Jersey","Player",
          "Yr","Pos","GP","App","GS","ERA","IP","H","R",
          "ER","BB","SO","SHO","BF","P-OAB",
          "2B-A","3B-A","Bk","HR-A","WP","HB",
          "IBB","Inh Run","Inh Run Score",
          "SHA","SFA","Pitches","GO","FO","W","L",
          "SV","KL","team_id","conference_id")
        
        character_cols <- c("year", "team_name", "conference", "Jersey", "Player",
                            "Yr", "Pos")
        
        numeric_cols <- c("division",  "GP", "App", "GS", "ERA", "IP", "H", "R", "ER",
                          "BB", "SO", "SHO", "BF", "P-OAB", "2B-A", "3B-A", "Bk", "HR-A",
                          "WP", "HB", "IBB", "Inh Run", "Inh Run Score", "SHA", "SFA",
                          "Pitches", "GO", "FO", "W", "L", "SV", "KL", "team_id", "conference_id")
        suppressWarnings(
          df <- df %>%
            dplyr::mutate_at(vars(character_cols), function(x){as.character(x)})
        )
        suppressWarnings(
          df <- df %>%
            dplyr::mutate_at(vars(numeric_cols), function(x){as.numeric(as.character(x))})
        )
      }
      
      player_url <- data_read %>%
        html_elements('#stat_grid a') %>%
        html_attr('href') %>%
        as.data.frame() %>%
        dplyr::rename("player_url" = ".") %>%
        dplyr::mutate(player_url = paste0('http://stats.ncaa.org', .data$player_url))
      
      player_names_join <- data_read %>%
        html_elements('#stat_grid a') %>%
        html_text() %>%
        as.data.frame() %>%
        dplyr::rename("player_names_join" = ".")
      
      player_id <-
        stringr::str_split(
          pattern = '&stats_player_seq=',  
          string = player_url$player_url, simplify = TRUE)[,2] %>%
        as.data.frame() %>%
        dplyr::rename("player_id" = ".")
      
      player_url_comb <- dplyr::bind_cols(player_names_join, player_id, player_url)
      
      df <- df %>% 
        dplyr::left_join(player_url_comb, by = c('Player' = 'player_names_join'))
      df <- df %>% 
        dplyr::rename("player_name" = "Player")
      
      df <- df %>%
        dplyr::mutate_at(vars(player_url), as.character) %>%
        dplyr::mutate_at(c("conference_id", "player_id", "year"), as.integer) %>%
        dplyr::select(
          "year",
          "team_name",
          "team_id",
          "conference_id",
          "conference",
          "division",
          "player_id",
          "player_url",
          "player_name",
          "Yr",
          "Pos",
          "Jersey",
          tidyr::everything()) %>% 
      make_baseballr_data(glue::glue("NCAA Baseball Team {stringr::str_to_title(type)} Stats data from stats.ncaa.org"),Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments provided"))
    },
    finally = {
    }
  )
  return(df)
}


#' @rdname ncaa_scrape
#' @title **(legacy) Scrape NCAA baseball Team Player Stats (Division I, II, and III)**
#' @inheritParams ncaa_team_player_stats
#' @return A data frame with the following variables
#'  
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |year          |integer   |
#'    |team_name     |character |
#'    |team_id       |numeric   |
#'    |conference_id |integer   |
#'    |conference    |character |
#'    |division      |numeric   |
#'    |player_id     |integer   |
#'    |player_url    |character |
#'    |player_name   |character |
#'    |Yr            |character |
#'    |Pos           |character |
#'    |Jersey        |character |
#'    |GP            |numeric   |
#'    |GS            |numeric   |
#'    |BA            |numeric   |
#'    |OBPct         |numeric   |
#'    |SlgPct        |numeric   |
#'    |R             |numeric   |
#'    |AB            |numeric   |
#'    |H             |numeric   |
#'    |2B            |numeric   |
#'    |3B            |numeric   |
#'    |TB            |numeric   |
#'    |HR            |numeric   |
#'    |RBI           |numeric   |
#'    |BB            |numeric   |
#'    |HBP           |numeric   |
#'    |SF            |numeric   |
#'    |SH            |numeric   |
#'    |K             |numeric   |
#'    |DP            |numeric   |
#'    |CS            |numeric   |
#'    |Picked        |numeric   |
#'    |SB            |numeric   |
#'    |RBI2out       |numeric   |
#'    
#' @keywords legacy
#' @export
ncaa_scrape <- ncaa_team_player_stats