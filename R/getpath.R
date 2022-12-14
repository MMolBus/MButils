################################################################################
# getpath function: 
# obtain windows directory path from clipboard without backslashes 
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2022-11-03
################################################################################
#R functions

#' Copy directory to R understanding format.
#' @param x String. File path copied from Windows' "copy file path".
#'
#' @return An R usable file path.
#'
#' @author Manuel Molina-Bustamante
#' @examples
#' getpath(x = "C:/Users/User/Documents")
#' getpath()
#' 
#' @export


getpath <- function(x= "clipboard"){
  x <- readClipboard(raw= F)
  x <-  gsub("////", "/",x)
  return(x)
}