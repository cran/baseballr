
cols <- c(
  "sport_id", "sport_code", "sport_link", "sport_name", 
  "sport_abbreviation", "sort_order", "active_status"
)

test_that("MLB Sports Info", {
  skip_on_cran()
  
  x <- mlb_sports_info(sport_id=1)
  
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
