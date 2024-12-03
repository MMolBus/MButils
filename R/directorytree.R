################################################################################
# directorytree
# create a directory tree structure starting from a specified path.
# ------------------------------------------------------------------------------
# Author: Manuel Molina-Bustamante
# Date of creation: 2024-12-03
################################################################################
# R functions
#' Create a Directory Tree
#'
#' This function creates a directory tree structure starting from a specified 
#' path.
#'
#' @param path A character string specifying the root directory path.
#' @param only.directories A logical value indicating whether to include only 
#' directories (TRUE) or both files and directories (FALSE). Default is TRUE.
#' @return A Node object representing the directory tree.
#' @examples
#' \dontrun{
#' tree <- directory.tree("/path/to/directory", only.directories = TRUE)
#' print(tree)
#' }
#' @export
# function ----------------------------------------------------------------
directorytree <- function(path, only.directories = T) {
  
  # Create a new Node object with the base name of the provided path
  root <- Node$new(basename(path))
  
  # Check if only directories should be listed
  if(only.directories == T){
    
    # Get a list of all directories within the specified path
    tips <- list.dirs(path, recursive = TRUE, full.names = TRUE)
  } else {
    
    # Get a list of all files and directories within the specified path
    tips <- list.files(path, recursive = TRUE, full.names = TRUE)
  }
  
  # Iterate over each item in the list
  for (tip in tips) {
    
    # Split the path into its components
    parts <- strsplit(tip, "/")[[1]]
    
    # Start from the root node
    actual_node <- root
    
    # Iterate over each part of the path
    for (part in parts) {
      
      # If the part is not already a child of the current node, add it
      if (!part %in% names(actual_node$children)) {
        actual_node$AddChild(part)
      }
      
      # Move to the child node
      actual_node <- actual_node$children[[part]]
    }
  }
  
  # Return the root node, which now represents the directory tree
  return(root)
}