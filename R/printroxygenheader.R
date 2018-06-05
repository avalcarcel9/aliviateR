#' @title Prints Roxygen Header
#' @param func TRUE is default to return a generic function roxygen header
#' @param data FALSE is default to return a generic data roxygen header
#' @description Prints a generic Roxygen header. Can be copied and personalized
#' @export
#' @return Returns a message with header info
#' @examples \dontrun{printroxygenheader()}
#'
printroxygenheader <- function(func = TRUE, data = FALSE){
  if(func == TRUE){
    # save roxygen header info
    title = '#\' @title <Brief Description>'
    description = '#\' @description <Full Description>'
    param = '#\' @param input_parameter <Input Parameter Description>'
    export = '#\' @export <Do you want users to be able to use this function? If not, it is a hidden function.>'
    keywords = '#\' @keywords'
    seealso = '#\' @seealso'
    import = '#\' @import <Load entire package as dependency>'
    importfrom = '#\' @importFrom <Load specific functions from packages as dependencies>'
    return = '#\' @return Object returned'
    aliases = '#\' @aliases'
    examples = '#\' @examples'

    # concatonate the header info onto different lines
    message('Function Header')
    cat(title,
        description,
        param,
        export,
        keywords,
        seealso,
        import,
        importfrom,
        return,
        aliases,
        examples,
        fill = 5)
  }

  if(data == TRUE){
    # save roxygen header info
    title_data = '#\' @title <Brief Description>'
    description_data = '#\' @description <Full Description>'
    name = '#\' @name object_name'
    type = '#\' @docType data'
    use = '#\' @usage object_name'
    keywords = '#\' @keywords <Insert key words if you\'d like>'

    # concatonate the header info onto different lines
    message('Data Header')
    cat(title_data,
        description_data,
        name,
        type,
        use,
        keywords,
        fill = 5)
  }
}

