## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
# You can install using the pacman package using the following code:
# if (!requireNamespace('pacman', quietly = TRUE)){
#   install.packages('pacman')
# }
# pacman::p_load_current_gh("r-lib/pkgapi")
# library(pkgapi)
# pkg <- pkgapi::map_package(path = "../")
# library(dplyr)
# function_calls <- pkg$calls
# exported <- pkg$defs %>% 
#   dplyr::filter(exported == TRUE) %>% 
#   dplyr::select(all_of(c("name", "file"))) 
# 
# mlb_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^mlb_*"))
# 
# bref_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^bref_*"))
# fg_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^fg_*"))
# sc_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^statcast_*"))
# ncaa_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^ncaa_*"))
# chadwick_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^chadwick_*|^playerid_*|^playername_*"))
# retrosheet_functions <- exported %>% 
#   dplyr::filter(stringr::str_detect(.data$name,pattern = "^retrosheet_*"))
old <- options(rmarkdown.html_vignette.check_title = FALSE)
pkg_name <- "billpetti/baseballr"
url <- paste0("https://raw.githubusercontent.com/", pkg_name, "/master/DESCRIPTION")
x <- readLines(url)
remote_version <- gsub("Version:\\s*", "", x[grep('Version:', x)])

## ----install_baseballr_gs, message=FALSE,eval=FALSE---------------------------
#  # You can install using the pacman package using the following code:
#  if (!requireNamespace('pacman', quietly = TRUE)){
#    install.packages('pacman')
#  }
#  pacman::p_load_current_gh("billpetti/baseballr")

