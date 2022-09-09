## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  out.width = "100%",
  dpi = 320
)

## ----load-packages------------------------------------------------------------
library(baseballr)
library(dplyr)
library(ggplot2)

## ----get-id-------------------------------------------------------------------
burnes_id <- baseballr::playerid_lookup(last_name = "Burnes", first_name = "Corbin") %>% 
  dplyr::pull(mlbam_id)

## ----load-statcast------------------------------------------------------------
burnes_data <- baseballr::statcast_search_pitchers(start_date = "2021-03-01",
                                                   end_date = "2021-12-01",
                                                   pitcherid = burnes_id)

## ----clean-data---------------------------------------------------------------
# The glimpse function is something I use regularly
# to quickly preview the data I'm working with.
# Try it out if you haven't used it before!
# 
# 
# burnes_data %>% dplyr::glimpse()

burnes_cleaned_data <- burnes_data %>% 
  # Only keep rows with pitch movement readings
  # and during the regular season
  dplyr::filter(!is.na(pfx_x), !is.na(pfx_z),
                game_type == "R") %>% 
  dplyr::mutate(pfx_x_in_pv = -12*pfx_x,
                pfx_z_in = 12*pfx_z)
  

## ----movement-plot------------------------------------------------------------
# Make a named vector to scale pitch colors with
pitch_colors <- c("4-Seam Fastball" = "red",
                  "2-Seam Fastball" = "blue",
                  "Sinker" = "cyan",
                  "Cutter" = "violet",
                  "Fastball" = "black",
                  "Curveball" = "green",
                  "Knuckle Curve" = "pink",
                  "Slider" = "orange",
                  "Changeup" = "gray50",
                  "Split-Finger" = "beige",
                  "Knuckleball" = "gold")

# Find unique pitch types to not have unnecessary pitches in legend
burnes_pitch_types <- unique(burnes_cleaned_data$pitch_name)

burnes_cleaned_data %>% 
  ggplot2::ggplot(ggplot2::aes(x = pfx_x_in_pv, y = pfx_z_in, color = pitch_name)) +
  ggplot2::geom_vline(xintercept = 0) +
  ggplot2::geom_hline(yintercept = 0) +
  # Make the points slightly transparent
  ggplot2::geom_point(size = 1.5, alpha = 0.25) +
  # Scale the pitch colors to match what we defined above
  # and limit it to only the pitches Burnes throws
  ggplot2::scale_color_manual(values = pitch_colors,
                              limits = burnes_pitch_types) +
  # Scale axes and add " to end of labels to denote inches
  ggplot2::scale_x_continuous(limits = c(-25,25),
                              breaks = seq(-20,20, 5),
                              labels = scales::number_format(suffix = "\"")) +
  ggplot2::scale_y_continuous(limits = c(-25,25),
                              breaks = seq(-20,20, 5),
                              labels = scales::number_format(suffix = "\"")) +
  ggplot2::coord_equal() +
  ggplot2::labs(title = "Corbin Burnes Pitch Movement",
                subtitle = "2021 MLB Season | Pitcher's POV",
                caption = "Data: Baseball Savant via baseballr", 
                x = "Horizontal Break",
                y = "Induced Vertical Break",
                color = "Pitch Name")

## ----velo-by-inning-----------------------------------------------------------

burnes_velo_by_inning <- burnes_cleaned_data %>% 
  dplyr::filter(pitch_name == "Cutter") %>% 
  dplyr::group_by(inning, pitch_name) %>% 
  dplyr::summarize(average_velo = mean(release_speed, na.rm = TRUE))

burnes_velo_by_inning %>% 
  ggplot2::ggplot(ggplot2::aes(x = inning, y = average_velo, color = pitch_name)) +
  ggplot2::geom_line(size = 1.5, alpha = 0.5, show.legend = FALSE) +
  ggplot2::geom_point(size = 3, show.legend = FALSE) +
  ggplot2::scale_color_manual(values = pitch_colors) +
  ggplot2::scale_x_continuous(breaks = 1:9) +
  ggplot2::scale_y_continuous(limits = c(90, 100)) +
  ggplot2::labs(title = "Corbin Burnes Cutter Velo By Inning",
                subtitle = "2021 MLB Season",
                caption = "Data: Baseball Savant via baseballr",
                x = "Inning",
                y = "Average Velo")


