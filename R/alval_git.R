#' @title Creates package repo on GitHub
#' @description Initializes GitHub repo, adds, commits, and pushes package to GitHub
#' @param pkg_path Path where you will be storing your package
#' @param credentials NULL by default. Option 'alval' is specifically for me. If other
#' specify credentials to be passed to devtools::use_github(credentials = ).
#' @export
#' @importFrom usethis use_git use_github
#' @importFrom git2r cred_ssh_key
#' @return No objected returned. Check your GitHub to see if the package repo was properly configured.
#' @examples \dontrun{
#' alval_git(pkg_path = '/Users/alval/Box/Research/aliviateR', credentials = 'alval')}

alval_git <- function(pkg_path = NULL, credentials = NULL){
  # Check path was specified properly
  if(is.null(pkg_path)){
    return("You must specify a path to the package.")
  }else if(dir.exists(pkg_path) == FALSE){
    return("There is an error with your path.")
  }
  # Check what credential was input
  if(is.null(credentials)==TRUE){
    usethis::use_git(message = "First commit using aliviateR",
                      pkg = pkg_path)
    usethis::use_github(pkg = pkg_path, credentials = NULL)
  } else if(credentials == 'alval'){
    cred = git2r::cred_ssh_key(publickey = "/Users/alval/.ssh/id_rsa.pub",
                               privatekey = "/Users/alval/.ssh/id_rsa")
    usethis::use_github(pkg = pkg_path, credentials = cred)
  } else{
    usethis::use_github(pkg = pkg_path, credentials = credentials)
  }

  return("Seems to have gone properly. Check your GitHub to see if the package repo is up to date.")
}
