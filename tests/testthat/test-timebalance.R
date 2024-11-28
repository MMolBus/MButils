################################################################################
# MButils::timebalance test 
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-11-27
################################################################################

# install packages --------------------------------------------------------

library(testthat)

# Tests -------------------------------------------------------------------

test_that("timebalance function works correctly", {
  expect_equal(timebalance(expected.time = "08:00", 
                           employed.time = "5:30", 
                           justified.time = "2:30"),
               "-00:30")
  expect_equal(timebalance(expected.time = "08:00", 
                           employed.time = "09:00") 
               ,
               "01:00")
})
