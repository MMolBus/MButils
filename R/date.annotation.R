################################################################################
# date.annotation function: 
# obtain annotation of datetime as string  
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2022-12-14
################################################################################
#R functions

#' Copy directory to R understanding format.
#' @param date "POSIXct" "POSIXt" file. Default Sys.time()
#'
#' @return "character" traslation of date time as YYYYMMDD_HHMMSS
#'
#' @author Manuel Molina-Bustamante
#' @examples
#' date.annotation(date = "2022-12-14 13:09:53 CET")
#' ##"20221214_130953"
#' date.annotation()
#' ##"20221214_130953"
#' 
#' @export

date.annotation <- 
  function(date = Sys.time()){
  date <-
    as.character(date)
  date <-
    gsub(".{3}$", "00", date)
  date <-
    gsub(":", "", date)
  date <-
    gsub("-", "", date)
  date <-
    gsub(" ", "-", date)
  return(date)
}
