################################################################################
# endingtime
# Get ending time of a process when giving starting time and duration
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-11-26
################################################################################
#R functions
#' Calculate the Ending Time of a Process
#'
#' This function calculates the ending time of a process given a start time and 
#' a duration.
#'
#' @param start.time A character string representing the start time in "hh:mm" 
#' format.
#' @param duration A character string representing the duration in "hh:mm" 
#' format.
#'
#' @return A POSIXct object representing the end time in "yyyy-mm-dd hh:mm:ss" 
#' format.
#'
#' @examples
#' endingtime("08:00", "03:30")
#' 
#' @export
# function ----------------------------------------------------------------
endingtime <- 
  function(start.time, duration){

# Convert start time to POSIXct object (assuming today's date)
start_time <- 
  as.POSIXct(paste(Sys.Date(), start.time), format = "%Y-%m-%d %H:%M")
# Convert duration to period object
duration <- 
  lubridate::hm(duration)

# Calculate end time
end_time <- start_time + duration
print(end_time)
}
