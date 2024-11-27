################################################################################
# MButils::endingtime test 
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-11-26
################################################################################

# install packages --------------------------------------------------------

library(testthat)
library(lubridate)

# Tests -------------------------------------------------------------------

test_that("endingtime function works correctly", {
  expect_equal(endingtime("08:00", "03:30"),
               as.POSIXct(paste(Sys.Date(), "11:30:00"),
                          format = "%Y-%m-%d %H:%M:%S"))
  expect_equal(endingtime("23:00", "02:00"),
               as.POSIXct(paste(Sys.Date() + 1, "01:00:00"),
                          format = "%Y-%m-%d %H:%M:%S"))
})

