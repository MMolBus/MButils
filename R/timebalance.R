################################################################################
# timebalance
# obtain time balance comparing expected time and employed time in a process
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-11-25
################################################################################
#R functions
#' timebalance
#' 
#' Obtain time balance comparing expected time and employed time in a process
#' 
#' @param expected.time A string. A vector with the expected time to reach
#' process achievement. It can be the sum of the total expected time or the
#' partial times that sum up to the total expected time. Format: "hh:mm".
#' @param employed.time A string. A vector with the time employed to reach
#' process achievement. It can be the sum of the total employed time or the
#' partial times that sum up to the total employed time. Format: "hh:mm".
#' @param justified.time A string. A vector with the total time not directly
#' employed in the process but justified as part of the necessary time to
#' achieve the process. It can be the sum of the total justified time or the
#' partial times that sum up to the total justified time. Format: "hh:mm".
#' @return time balance between expected time and employed  + justified time.
#' @author Manuel Molina-Bustamante
#' @examples
#' time.balance(expected.time = "8:00", employed.time = "5:30",
#' justified.time = "2:00")
#' @export
timebalance <- 
  function(expected.time, employed.time, justified.time = "00:00"){
    
    # Convert times to seconds
    to.seconds <- function(time) {
      time <- strptime(time, format = "%H:%M")
      as.numeric(time$hour) * 3600 + as.numeric(time$min) * 60
    }
    
    exp_seconds <- sum(to_seconds(expected.time))
    emp_seconds <- sum(to_seconds(employed.time))
    jus_seconds <- sum(to_seconds(justified.time))
    
    # Calculate time balance in seconds
    time_balance_sc <- emp_seconds + jus_seconds - exp_seconds
    
    # define sign of the balance
    sign_time <- ifelse(time_balance_sc < 0, "-", "")
    
    # Calculate hours and minutes
    hours <- floor(abs(time_balance_sc) / 3600)
    minutes <- floor((abs(time_balance_sc) %% 3600) / 60)
    
    # Format to hh:mm
    time_balance_hhmm <- sprintf("%s%02d:%02d", sign_time, hours, minutes)
    
    # Print the result
    time_balance_hhmm
    
    return(time_balance_hhmm)
  }



