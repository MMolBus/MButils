################################################################################
# getpath function: 
# obtain windows directory path from clipboard without backslashes 
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2022-11-03
################################################################################

# Charge getpath function into your global environment
#' @export
getpath <- function(){
  x <- readClipboard(raw= F)
  x <-  gsub("\\\\", "/",x)
  return(x)
}
