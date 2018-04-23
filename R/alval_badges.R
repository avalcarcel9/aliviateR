#' @title Add Continuous Integration Badges
#' @description Add continuous integration services to the R package. Additionally provide
#'  badges to your GitHub page to place in the readme.
#' @param pkg_path The path to your package
#' @param gh_username Your GitHub username
#' @param travis TRUE by default adds .travis.yml to the top level directory and opens travis for configuration
#' @param coverage TRUE by default adds coverage reports to a package that is in Travis CI
#' @param appveyor TRUE by default adds a basic appveyor.yml to the top level of a package and opens AppVeyor CI.
#' @param cran TRUE by default adds cran badge for cran versin or not on cran if not on cran
#' @export
#' @importFrom tibble tibble
#' @importFrom usethis use_travis use_coverage use_appveyor
#' @importFrom badgecreatr badge_travis badge_codecov badge_cran
#' @return Tibble with badges based on user inputs. If not input FALSE will be returned.
#' @examples \dontrun{
#' badges = alval_ci(pkg_path = '/Users/alval/Box/Research/aliviateR', gh_username = 'avalcarcel9', coverage = FALSE)
#' badges$travis_badge
#' badges$coverage_badge
#' badges$appveyor_badge}

alval_badges <- function(pkg_path = NULL,
                         gh_username = NULL,
                         travis = TRUE,
                         coverage = TRUE,
                         appveyor = TRUE,
                         cran = TRUE){
  # Check package directory is specified and exists
  if(is.null(pkg_path)){
    return('You need to provide a path to the package')
  } else if(dir.exists(pkg_path)==FALSE){
    return('The path you provided is not valid.')
  }
  # Check gh_username is specified
  if(is.null(gh_username)){
    return('You must enter a GitHub username for gh_username')
  }
  # Get package name from description file
  desc = desc::description$new(pkg_path)
  out = as.list(desc$get(desc$fields()))
  pack =  out$Package
  pack = gsub("[.]", "-", pack)
  repo = paste0(gh_username, "/", pack)

  travis_badge = FALSE
  coverage_badge = FALSE
  appveyor_badge = FALSE
  cran_badge = FALSE

  # Set up ymls and add badge
  if(travis == TRUE){
    # Create travis.yml
    usethis::use_travis(browse = interactive())
    # Add badge to readme
    travis_badge = badgecreatr::badge_travis(ghaccount = gh_username,
                                             ghrepo = repo,
                                             branch = "master")
  }
  if(coverage == TRUE){
    # Set up code coverage
    usethis::use_coverage(type = c("codecov", "coveralls"))
    # Add badge
    coverage_badge = badgecreatr::badge_codecov(ghaccount = gh_username,
                                                ghrepo = pack,
                                                branch = "master")

  }
  if(appveyor == TRUE){
    # Create yml
    usethis::use_appveyor(browse = interactive())
    # Create badge
    appveyor_badge = paste0(
      "[![AppVeyor Build Status](",
      "https://ci.appveyor.com/api/projects/status/github/",
      repo, "?branch=master&svg=true)](",
      "https://ci.appveyor.com/project/", repo, ")")
  }
  if(cran == TRUE){
    cran_badge = badgecreatr::badge_cran(pack)
  }

  message('Please add any non FALSE badges to your README.')
  return(tibble::tibble(travis_badge, coverage_badge, appveyor_badge, cran_badge))
}
