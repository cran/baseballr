#' @rdname statcast_leaderboards
#' @title **Query Baseball Savant Leaderboards**
#'
#' @description This function allows you to read leaderboard data from BaseballSavant directly into R as data frame.
#' @param leaderboard The type of leaderboard to retrieve, input as a string. Current
#' options include exit_velocity_barrels, expected_statistics, pitch_arsenal,
#' outs_above_average, directional_oaa, catch_probability, pop_time, sprint_speed, and
#' running_splits_90_ft, arm_strength.
#' @param year The season for which you want data.
#' @param abs The minimum number of batted balls. Applies only to exit_velocity_barrels
#' leaderboards.
#' @param min_pa Minimum number of plate appearances. Can be a number or 'q' for qualified batters.
#' @param min_pitches Minimum number of pitches thrown.
#' @param min_field Minimum number of fieding opportunities.
#' @param min_run Minimum number of running opportunities.
#' @param min_throws Minimum number of throwing opportunities.
#' @param player_type One of either 'batter' or pitcher. For the expected_statistics
#' leaderboard, 'batter-team' and 'pitcher-team' are also available.
#' @param fielding_type One of either 'player' or 'team'.
#' @param oaa_position Can be either the number position of a player or 'if' or 'of' for
#' position categories.
#' @param oaa_roles Can be either the number position of a player or 'if' or 'of' for
#' position categories.
#' @param team An abbreviation for a team. Can be left blank.
#' @param arsenal_type One of either 'n_', 'avg_spin', or 'avg_speed'.
#' @param run_type One of either 'percent' or 'raw'.
#' @param min2b The minimum number of throwing attempts to second base.
#' @param min3b The minimum number of throwing attempts to third base.
#' @param position The numeric position of the player. For DH use 10. Can be left blank.
#' @param bats The handedness of the batter. One of 'R' or 'L'. Can be left blank.
#' @param hand The handedness of the pitcher. One of 'R' or 'L'. Can be left blank.
#' @details oaa_roles argument:
#' 30 = 1B - Straight Up   
#' 31 = 1B - Towards 1B/2B Hole  
#' 32 = 1B - Close to Line  
#' 40 = 2B - Straight Up  
#' 41 = 2B - Shaded Towards 2B Bag  
#' 42 = 2B - Towards 1B/2B Hole  
#' 43 = 2B - Behind First Basemen  
#' 46 = 2B - Up the Middle 
#' 60 = SS - Straight Up  
#' 61 = SS - Towards 3B/SS Hole  
#' 62 = SS - Shaded Towards 2B Bag  
#' 64 = SS - Up the Middle  
#' 50 = 3B - Straight Up  
#' 51 = 3B - Close to Line  
#' 52 = 3B - Towards 3B/SS Hole  
#' 77 = LF - Close to Line  
#' 71 = LF - Leaning Left  
#' 70 = LF - Straight Up  
#' 72 = LF - Leaning Right  
#' 78 = LF - LF Gap 
#' 87 = CF - LF Gap 
#' 81 = CF - Leaning Left 
#' 82 = CF - Leaning Right 
#' 89 = CF - RF Gap 
#' 98 = RF - RF Gap 
#' 91 = RF - Leaning Left  
#' 90 = RF - Straight Up 
#' 92 = RF - Leaning Right 
#' 99 = RF - Close to Line 
#' @return Returns a tibble of Statcast leaderboard data with the following columns (for leaderboard: 'exit_velocity_barrels'):
#' 
#'   |col_name              |types     |
#'   |:---------------------|:---------|
#'   |year                  |numeric   |
#'   |last_name             |character |
#'   |first_name            |character |
#'   |player_id             |integer   |
#'   |attempts              |integer   |
#'   |avg_hit_angle         |numeric   |
#'   |anglesweetspotpercent |numeric   |
#'   |max_hit_speed         |numeric   |
#'   |avg_hit_speed         |numeric   |
#'   |fbld                  |numeric   |
#'   |gb                    |numeric   |
#'   |max_distance          |integer   |
#'   |avg_distance          |integer   |
#'   |avg_hr_distance       |integer   |
#'   |ev95plus              |integer   |
#'   |ev95per-swing         |numeric   |
#'   |ev95percent           |numeric   |
#'   |barrels               |integer   |
#'   |brl_percent           |numeric   |
#'   |brl_pa                |numeric   |
#' 
#' @export
#' @examples \donttest{
#'   try(statcast_leaderboards(leaderboard = "expected_statistics", year = 2018))
#'   try(statcast_leaderboards(leaderboard = "arm_strength", year = 2020))
#' }

statcast_leaderboards <- function(leaderboard = "exit_velocity_barrels",
                                       year = 2020,
                                       abs = 50,
                                       min_pa = 'q',
                                       min_pitches = 100,
                                       min_throws = 100,
                                       min_field = "q",
                                       min_run = 0,
                                       player_type = "batter",
                                       fielding_type = "player",
                                       oaa_position = "",
                                       oaa_roles = "",
                                       team = "",
                                       arsenal_type = "n_",
                                       run_type = "raw",
                                       min2b = 5,
                                       min3b = 0,
                                       position = "",
                                       bats = "",
                                       hand = "") {
  
  ## Exit Velocity Barrels ---------
  if (leaderboard == "exit_velocity_barrels") {

    if (!year %in% c(seq(2015,substr(Sys.time(), 1, 4),1))) {

      message("Exit Velocity and Barrel leaderboards are only available starting in 2015. Please choose an appropriate year.")
    }

    if (!min_pa %in% c('q',1,25,50,100,200,250,350,450,500,600)) {

      message("Please choose one of the following for the minimum number of plate appearances:1,25,50,100,200,250,350,450,500,600")

      return(NULL)
    }

    if (!abs %in% c(0,5,10,20,25,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,250,300,400,500)) {

      message("Please choose one of the following for the number of batted balls: 0,5,10,20,25,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,250,300,400,500")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/statcast_leaderboard?year=", year, "&abs=", abs, "&type=", player_type, "&min=", min_pa, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Expected Statistics ---------
  if (leaderboard == "expected_statistics") {

    if (!year %in% c(seq(2015,substr(Sys.time(), 1, 4),1))) {

      message("Expected Statistics leaderboards are only available starting in 2015. Please choose an appropriate year.")

      return(NULL)
    }

    if (!min_pa %in% c('q',1,25,50,100,200,250,350,450,500,600)) {

      message("Please choose one of the following for the minimum number of plate appearances:1,25,50,100,200,250,350,450,500,600")

      return(NULL)
    }

    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {

      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")

      return(NULL)
    }

    if(!position %in% c("", 1,2,3,4,5,6,7,8,9,10)) {

      message("Please enter one of the following for position: 1,2,3,4,5,6,7,8,9,10")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/expected_statistics?type=", player_type, "&year=", year, "&position=", position, "&team=", team, "&min=", min_pa,"&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Pitch Arsenal ---------
  if (leaderboard == "pitch_arsenal") {

    if (!year %in% c(seq(2017,substr(Sys.time(), 1, 4),1))) {

      message("Pitch Arsenal leaderboards are only available starting in 2017. Please choose an appropriate year.")
    }

    if (!min_pitches %in% c(50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000)) {

      message("Please choose one of the following for the minimum number of pitches: 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000")

      return(NULL)
    }

    if(!hand %in% c("", "R", "L")) {

      message("Please choose either 'R' or 'L' for `hand`, or leave the parameter blank.")

      return(NULL)
    }

    if(!arsenal_type %in% c("n_", "avg_spin", "avg_speed")){

      message("Please enter of the following: 'n_' for percentages, 'avg_spin' for average spin, or 'avg_speed' for average speed.")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/pitch-arsenals?year=", year, "&min=", min_pitches, "&type=", arsenal_type, "&hand=", hand, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Outs Above Average ---------
  if (leaderboard == "outs_above_average") {

    if (!year %in% c(seq(2016,substr(Sys.time(), 1, 4),1))) {

      message("Outs Above Average leaderboards are only available starting in 2016. Please choose an appropriate year.")

      return(NULL)
    }

    if (!min_field %in% c("q",0,5,25,50,75,100,150,200,250)) {

      message("Please choose one of the following for the minimum number of fielding opportunities:'q',0,5,25,50,75,100,150,200,250")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/leaderboard/outs_above_average?type=Fielder&year=", year, "&team=&range=year&min=", min_field, "&pos=", oaa_position, "&roles=", oaa_roles, "&viz=show&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Directional Outs Above Average ---------
  if (leaderboard == "directional_oaa") {

    if (!year %in% c(seq(2016,substr(Sys.time(), 1, 4),1))) {

      message("Directional Outs Above Average leaderboards are only available starting in 2016. Please choose an appropriate year.")

      return(NULL)
    }

    if (!min_field %in% c("q",0,5,25,50,75,100,150,200,250)) {

      message("Please choose one of the following for the minimum number of fielding opportunities:'q',0,5,25,50,75,100,150,200,250")

      return(NULL)
    }

    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {

      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/directional_outs_above_average?year=", year, "&min=", min_field, "&team=", team, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Catch Probability ---------
  if (leaderboard == "catch_probability") {

    if (!year %in% c(seq(2016,substr(Sys.time(), 1, 4),1))) {

      message("Catch Probability Expected Statistic leaderboards are only available starting in 2016. Please choose an appropriate year.")

      return(NULL)
    }

    if (!min_field %in% c("q",0,5,25,50,75,100,150,200,250)) {

      message("Please choose one of the following for the minimum number of fielding opportunities:'q',0,5,25,50,75,100,150,200,250")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/catch_probability_leaderboard?type=", fielding_type, "&min=", min_field, "&year=", year, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Pop Time ---------
  if (leaderboard == "pop_time") {

    if (!year %in% c(seq(2015,substr(Sys.time(), 1, 4),1))) {

      message("Pop Time leaderboards are only available starting in 2015. Please choose an appropriate year.")

      return(NULL)
    }

    if (!min2b %in% c(1,5,10,15,20)) {

      message("Please choose one of the following for the minimum number of throws to second base: 1,5,10,15,20")

      return(NULL)
    }

    if (!min3b %in% c(0,1,5,10,15,20)) {

      message("Please choose one of the following for the minimum number of throws to third base: 0,1,5,10,15,20")

      return(NULL)
    }

    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {

      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/poptime?year=", year, "&team=", team, "&min2b=", min2b, "&min3b=", min3b, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Sprint Speed ---------
  if (leaderboard == "sprint_speed") {

    if (!year %in% c(seq(2015,substr(Sys.time(), 1, 4),1))) {

      message("Pop Time leaderboards are only available starting in 2015. Please choose an appropriate year.")

      return(NULL)
    }

    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {

      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")

      return(NULL)
    }

    if(!position %in% c("", 1,2,3,4,5,6,7,8,9,10)) {

      message("Please enter one of the following for position, or leave the parameter blank: 1,2,3,4,5,6,7,8,9,10")

      return(NULL)
    }

    if (!min_run %in% c(0,5,25,50,75,100,150,200,250)) {

      message("Please choose one of the following for the minimum number of running opportunities: 0,5,25,50,75,100,150,200,250")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/sprint_speed_leaderboard?year=", year, "&position=", position, "&team=", team, "&min=", min_run, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Running Splits 90 ft ---------
  if (leaderboard == "running_splits_90_ft") {

    if (!year %in% c(seq(2017,substr(Sys.time(), 1, 4),1))) {

      message("Pop Time leaderboards are only available starting in 2017. Please choose an appropriate year.")

      return(NULL)
    }

    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {

      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")

      return(NULL)
    }

    if(!position %in% c("", 1,2,3,4,5,6,7,8,9,10)) {

      message("Please enter one of the following for position, or leave the parameter blank: 1,2,3,4,5,6,7,8,9,10")

      return(NULL)
    }

    if (!min_run %in% c(0,5,25,50,75,100,150,200,250)) {

      message("Please choose one of the following for the minimum number of running opportunities: 0,5,25,50,75,100,150,200,250")

      return(NULL)
    }

    if(!bats %in% c("", "R", "L")) {

      message("Please choose either 'R' or 'L' for `bats`, or leave the parameter blank.")

      return(NULL)
    }

    if(!run_type %in% c("percent", "raw")) {

      message("Please choose either 'percent' or 'raw' for 'run_type'.")

      return(NULL)
    }

    url <- paste0("https://baseballsavant.mlb.com/running_splits?type=", run_type, "&bats=", bats, "&year=", year, "&position=", position, "&team=", team, "&min=", min_run, "&csv=true")

    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  ## Arm Strength ---------
  if (leaderboard == "arm_strength") {
    
    if (!year %in% c(seq(2020,substr(Sys.time(), 1, 4),1))) {
      
      message("Arm Strength leaderboards are only available starting in 2020. Please choose an appropriate year.")
      
      return(NULL)
    }
    
    if (!min_throws %in% c(50,100,300,500,1000)) {
      
      message("Please choose one of the following for the minimum number of throws: 50,100,300,500")
      
      return(NULL)
    }
    
    if(!team %in% c("", "ATL", "ARI", "BAL", "BOS", "CHC", "CIN", "CLE", "COL", "CWS", "DET", "HOU", "KC", "LAA", "LAD", "OAK", "MIA", "MIL", "MIN", "NYM", "NYY", "PHI", "PIT", "SD", "SEA", "SF", "STL", "TB", "TEX", "TOR", "WSH")) {
      
      message("If you are trying to query records for a specific team, please be sure to enter one of the following: ATL, ARI, BAL, BOS, CHC, CIN, CLE, COL, CWS, DET, HOU, KC, LAA, LAD, OAK, MIA, MIL, MIN, NYM, NYY, PHI, PIT, SD, SEA, SF, STL, TB, TEX, TOR, WSH")
      
      return(NULL)
    }
    
    if(!position %in% c("", 1,2,3,4,5,6,7,8,9,10)) {
      
      message("Please enter one of the following for position: 1,2,3,4,5,6,7,8,9,10")
      
      return(NULL)
    }
    
    url <- paste0("https://baseballsavant.mlb.com/leaderboard/arm-strength?type=", fielding_type, "&year=", year, "&pos=", position, "&team=", team, "&minThrows=", min_throws,"&csv=true")
    
    payload <- csv_from_url(url, encoding ="UTF-8")
  }
  
  if(!"year" %in% colnames(payload)) {

    payload <- payload %>%
      dplyr::mutate(year = year)
  }

  payload <- payload %>%
    dplyr::select("year", tidyr::everything()) %>%
    make_baseballr_data("MLB Baseball Savant Statcast Leaderboards data from baseballsavant.mlb.com",Sys.time())

  return(payload)
}


#' @rdname scrape_savant_leaderboards
#' @title **(legacy) Query Baseball Savant Leaderboards**
#' @inheritParams statcast_leaderboards 
#' @return Returns a tibble of Statcast leaderboard data.
#' @keywords legacy
#' @export
scrape_savant_leaderboards <- statcast_leaderboards
