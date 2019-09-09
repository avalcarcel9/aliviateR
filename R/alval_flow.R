#' @title Generates an R package
#' @description Generates an R package according to Ali Valcarcel's workflow.
#'   This essentially wraps the usethis package functions that I always use when
#'   creating an R package
#' @param path Path where you will be storing your package
#' @param pkg_name Name of package you are creating
#' @param vignette_name NULL or name of vignette file to be generated. NULL by
#'   default will not generate a vignette or associated files
#' @param testing FALSE by default. Logical for building testing material
#'   through usethis
#' @param data TRUE by default. Logical for adding data to package structure.
#' @param title Package title to be put in description
#' @param description Description to be put in description
#' @param firstname First name. Defaults to my first name
#' @param lastname Last name. Defaults to my last name
#' @param email Email. Defaults to my email.
#' @param role Default is author and creator
#' @export
#' @import usethis
#' @importFrom utils person
#' @return Folder in specified R path with R package related objects. Vignette
#'   may be opened if specified.
#' @examples \dontrun{
#' alval_flow(path = '/Users/alval/Desktop',
#' pkg_name = "test",
#' vignette_name = NULL,
#' testing = FALSE,
#' data = TRUE
#' title = "What the Package Does (One Line, Title Case)",
#' description = "What the package does (one paragraph).",
#' firstname = "Alessandra (Ali)",
#' middlename = "M.",
#' lastname = "Valcarcel",
#' email = "alval@pennmedicine.com",
#' role = c("aut", "cre"))}

alval_flow <- function(path = NULL,
                       pkg_name = NULL,
                       vignette_name = NULL,
                       testing = TRUE,
                       data = TRUE,
                       title = "What the Package Does (One Line, Title Case)",
                       description = "What the package does (one paragraph).",
                       firstname = "Alessandra",
                       lastname = "Valcarcel",
                       email = "alval@pennmedicine.com",
                       role = c("aut", "cre")){
  # Simple Check for proper path and inputs
  if(is.null(path) | is.null(pkg_name)){
    return('Need to specify a path to place the package and a name for the package')
  } else if(dir.exists(path) == FALSE){
    return('Path does not exist. Please verify.')
  } else {
    full_path = file.path(path, pkg_name)
  }

  # Create R Package
  usethis::create_package(path = full_path, open = FALSE)

  # Use Roxygen with markdown
  usethis::use_roxygen_md()

  # Create skeleton readme files with common sections
  usethis::use_readme_rmd(open = FALSE)
  usethis::use_readme_md(open = FALSE)

  # Performs general setup for vignettes and initializes a new vignette
  if(is.null(vignette_name)==FALSE){
    usethis::use_vignette(vignette_name)
  }
  # Sets up testing infrastructure
  if(testing == TRUE){
    usethis::use_testthat()
  }
  if(data == TRUE){
    usethis::use_data()
  }

  # Populate description
  defaults = list(
    Package = pkg_name,
    Version = "0.0.1",
    Title = title,
    Description = description,
    `Author@R` = cat(paste0('c(person(given = "', firstname, '",',
                        'family = "', lastname, '",',
                        'email = "', email, '",',
                        'role = ', 'c(', paste0('"',role[1], '"',',', '"',role[2], '"') ,')', ')')),
    Maintainer = person(given = firstname,
                        family = lastname,
                        email = email),
    License = "GPL-2",
    Encoding = "UTF-8",
    LazyData = "true",
    ByteCompile = "true"
  )

  usethis::use_description(defaults)
  message('Be sure to edit Author@R text with info below.')
  message(cat(paste0('c(person(given = "', firstname, '",',
                     'family = "', lastname, '",',
                     'email = "', email, '",',
                     'role = ', 'c(', paste0('"',role[1], '"',',', '"',role[2], '"') ,')', ')')))
}
