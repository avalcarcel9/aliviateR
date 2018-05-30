#' @title Sorts a data.frame or tibble of filepaths
#' @description Sorts a data.frame or tibble of filepaths.
#' In the filepaths, it is assumed you have an ID that is at least 3 digits long.
#' The function will sort each column in the input, check each row of IDs matches, and add a new column of the ID.
#' @param filepaths A data.frame or tibble of filepaths with an ID contained
#' @param id_pattern By default is a 3 digit pattern. Searches for the pattern indicated as a subject ID.
#' @export
#' @importFrom magrittr %>%
#' @importFrom stringr str_extract
#' @importFrom tibble tibble as_tibble is.tibble
#' @importFrom dplyr mutate mutate_all funs
#' @return A sorted tibble of filepaths with an ID column
#'@examples
#' \dontrun{
#' files = tibble::tibble(files1 = c('/Desktop/subject_111.csv', '/Desktop/subject_123.csv', '/Desktop/subject_902'),
#'                        files2 = c('/Documents/subject_111.csv', '/Documents/subject_902', '/Documents/subject_123.csv'))
#'
#' sort_filepaths(filepaths = files)
#'}

sort_filepaths <- function(filepaths, id_pattern = "[0-9][0-9][0-9]+"){

  # function that extracts string values larger than 3 numbers
  extract_number <- function(column){stringr::str_extract(column, id_pattern)}

  # check if input is a tibble
  if(tibble::is.tibble(filepaths)==FALSE){
    # if not make a tibble and sort
    filepaths = tibble::as_tibble(filepaths)
    filepaths = dplyr::mutate_all(filepaths, sort)
  } else{
    # if so sort
    filepaths = dplyr::mutate_all(filepaths, sort)
  }

  # Extract numbers from filepaths (i.e. ID)
  detect_id = filepaths %>%
    mutate_all(., dplyr::funs(extract_number))

  # Check that all number from filepaths are equal
  if(all(sapply(detect_id, identical, detect_id[[1]])) == TRUE){
    filepaths = filepaths %>%
      dplyr::mutate(id = extract_number(filepaths[[1]]))

    # If the ID pattern does not contain special characters make it numeric
    if(all(stringr::str_detect(filepaths$id, "[_/.]") ==FALSE)){
      filepaths = filepaths %>%
        dplyr::mutate(id = as.numeric(id))
    }

    return(filepaths)
  } else {
    return("Columns do not match")
  }
}
