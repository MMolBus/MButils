################################################################################
# MButils::directorytree test 
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-12-04
################################################################################

# install packages --------------------------------------------------------
library(testthat)

# Load MButils
library(MButils)

# Tests --------------------------------------------------------------------

test_that("directorytree works correctly", {
  
  # Create a temporary directory for testing
  temp_dir <- tempdir()
  dir.create(file.path(temp_dir, "subdir1"))
  dir.create(file.path(temp_dir, "subdir2"))
  file.create(file.path(temp_dir, "subdir1", "file1.txt"))
  file.create(file.path(temp_dir, "subdir2", "file2.txt"))
  
  # Test with only_directories = TRUE
  tree <- directorytree(temp_dir, only_directories = TRUE)
  expect_true("subdir1" %in% names(tree$children))
  expect_true("subdir2" %in% names(tree$children))
  expect_false("file1.txt" %in% names(tree$children$subdir1$children))
  
  # Test with only_directories = FALSE
  tree <- directorytree(temp_dir, only_directories = FALSE)
  expect_true("subdir1" %in% names(tree$children))
  expect_true("subdir2" %in% names(tree$children))
  expect_true("file1.txt" %in% names(tree$children$subdir1$children))
  expect_true("file2.txt" %in% names(tree$children$subdir2$children))
})