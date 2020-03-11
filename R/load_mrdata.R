#' @title Load Multiple R Data Files
#' @description Loads multiple .RData, .rda, or .rds files
#' @param path The path to the folder where the multiple files are stored
#' @param pattern The pattern of the files inside the folder to import
#' @param bind_rows By default is set to TRUE. Will bind rows of the multiple
#'   data frames supplied by the path.
#' @importFrom purrr map
#' @importFrom stringr str_detect
#' @importFrom dplyr bind_rows
#' @export

load_mrdata <- function(path, pattern, bind_rows = TRUE){
  # Load files from given path
  files = list.files(path = path, pattern = pattern, full.names = TRUE)
  # Are files all .RData
  if(all(stringr::str_detect(files, '.RData')) == TRUE){
    data = sapply(files, function(x) mget(load(x)), simplify = TRUE)
  }
  # Are files all .rds
  else if(all(stringr::str_detect(files, '.rds')) == TRUE){
    data = purrr::map(list.files(path = path, pattern = pattern, full.names = TRUE), readRDS)
  }
  # If not .RData or .rds stop the function
  else if(all(stringr::str_detect(files, '.RData')) == FALSE | all(stringr::str_detect(files, '.rds')) == FALSE){
    stop('Must provide .RData or .rds files.')
  }

  # If bind_rows option is true bind the rows of the data
  if(bind_rows == TRUE){
    data = dplyr::bind_rows(data, .id = "file")
  }

  return(data)
}
