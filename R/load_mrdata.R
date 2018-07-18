#' @title Load Multiple .RData Files
#' @description Loads multiple .RData and .rda files
#' @param path The path to the folder where the multiple files are stored
#' @param pattern The pattern of the files inside the folder to import
#' @export

load_mrdata <- function(path, pattern){
  files = list.files(path = path, pattern = pattern)
  setwd(path)
  data = sapply(files, function(x) mget(load(x)), simplify = TRUE)
  return(data)
}
