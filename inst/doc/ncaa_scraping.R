## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----ncaa_scrape_batting------------------------------------------------------
library(baseballr)
library(dplyr)
ncaa_scrape(736, 2021, "batting") %>%
  select(year:OBPct)

## ----ncaa_scrape_pitching-----------------------------------------------------
ncaa_scrape(736, 2021, "pitching") %>%
  select(year:ERA)

## ----ncaa_sch_id_lu-----------------------------------------------------------
ncaa_school_id_lu("Vand")

