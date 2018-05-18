#' @title Obtain a tibble of filepaths
#' @description Obtain a tibble of filepaths by supplying directory paths and patterns (if necessary) of files.
#' @param paths A vector of paths for which to obtain the filepaths to specific files
#' @param patterns NULL by default does not supply a pattern of files to obtain. 
#' If a pattern is required input a vector of patterns that align with the paths supplied.
#' @param full.names TRUE by default. Arguement passed to list.files(). Returns full path of file.
#' @param sort TRUE by default will sort the filepaths by a subject ID contained inside of the path. FALSE will not sort.
#' @export 
#' @importFrom dplyr bind_cols
#' @importFrom magrittr  %>%
#' @importFrom aliviateR sort_filepaths
#' @return A tibble of filepaths.
#' @examples


paths = c('brain_masks', 'mimosa_subject_dfs')
patterns = c('.nii.gz', '.RData')
full.names = TRUE

multiple_filepaths <- function(paths, patterns = NULL, full.names = TRUE, sort = TRUE){
  # Create an empty list for storage of each filepath
  filepaths = list()
  if(is.null(patterns) == FALSE){
    # Obtain filepaths with a pattern
    for(i in 1:length(paths)){
      filepaths[[i]] = list.files(path = paths[i], pattern = patterns[i], full.names = full.names)
    }
  }
  if(is.null(patterns) == TRUE){
    # Obtain filepaths with no pattern
    for(i in 1:length(paths)){
      filepaths[[i]] = list.files(path = paths[i], full.names = full.names)
    }
  }
  
  # Name list elements based on paths
  names(filepaths) = paths
  # Create a tibble to overwrite the list
  filepaths = dplyr::bind_cols(filepaths)
  
  # Sort the filepaths and add an ID column if sort is TRUE
  if(sort == TRUE){
    # Sort based on the ID
    filepaths = sort_filepaths(filepaths = filepaths)
  }
  
  return(filepaths)
}