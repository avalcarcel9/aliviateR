#' @title Obtain a tibble of filepaths
#' @description Obtain a tibble of filepaths by supplying directory paths and pattern (if necessary) of files.
#' @param path A vector of paths for which to obtain the filepaths to specific files
#' @param pattern NULL by default does not supply a pattern of files to obtain.
#' If a pattern is required input a vector of patterns that align with the paths supplied.
#' @param full.names TRUE by default. Arguement passed to list.files(). Returns full path of file.
#' @param sort TRUE by default will sort the filepaths by a subject ID contained inside of the path. FALSE will not sort.
#' @param id_pattern By default is a 3 digit pattern. Searches for the pattern indicated as a subject ID.
#' @export
#' @importFrom dplyr bind_cols
#' @importFrom magrittr  %>%
#' @return A tibble of filepaths.

multiple_filepaths <- function(path, pattern = NULL, full.names = TRUE, sort = TRUE, id_pattern = "[0-9][0-9][0-9]+"){
  # Create an empty list for storage of each filepath
  filepaths = list()
  if(is.null(pattern) == FALSE){
    # Obtain filepaths with a pattern
    for(i in 1:length(path)){
      filepaths[[i]] = list.files(path = path[i], pattern = pattern[i], full.names = full.names)
    }
  }
  if(is.null(pattern) == TRUE){
    # Obtain filepath with no pattern
    for(i in 1:length(path)){
      filepath[[i]] = list.files(path = path[i], full.names = full.names)
    }
  }

  # Name list elements based on paths
  names(filepaths) = path
  # Create a tibble to overwrite the list
  filepaths = dplyr::bind_cols(filepaths)

  # Sort the filepaths and add an ID column if sort is TRUE
  if(sort == TRUE){
    # Sort based on the ID
    filepaths = sort_filepaths(filepaths = filepaths, id_pattern = id_pattern)
  }

  return(filepaths)
}
