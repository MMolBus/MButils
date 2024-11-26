################################################################################
# time.balance function: 
# obtain time balance comparing expected time and employed time in a process
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-11-25
################################################################################
#R functions

#' Obtain time balance comparing expected time and employed time in a process
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
#' 
#' @return time balance between expected time and employed  + justified time.
#'
#' @author Manuel Molina-Bustamante
#' @examples
#' time.balance(expected.time = "8:00", employed.time = "5:30",
#' justified.time = "2:00")
#' 
#' @export
time.balance <- 
  function(expected.time, employed.time, justified.time = 0){
    
    expected.time <- 
      expected.time	%>% 
      strptime(format = "%H:%M") 
    
    exp.seconds  <- 
      sum(as.numeric(expected.time$hour) * 3600 +
            as.numeric(expected.time$min) * 60)
    
    
    employed.time <- 
      employed.time %>% 
      strptime(format = "%H:%M") 
    
    emp.seconds <-
      sum(as.numeric(employed.time$hour) * 3600 +
            as.numeric(employed.time$min) * 60)
    
    
    justified.time <- 
      justified.time %>% 
      strptime(format = "%H:%M")
    
    jus.seconds <-
      sum(as.numeric(justified.time$hour) * 3600 +
            as.numeric(justified.time$min) * 60)
    
    
    time.balance.sc <- emp.seconds + jus.seconds - exp.seconds
    
    hr <- time.balance.sc %/% 3600
    mn <- (time.balance.sc %% 3600) %/% 60
    remaining_sc <- time.balance.sc %% 60
    time.balance <- sprintf("%02d:%02d:%02d", hr, mn, remaining_sc)
    
    return(time.balance)
  }



