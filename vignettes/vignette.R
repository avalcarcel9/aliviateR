## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("avalcarcel9/aliviateR")

## -----------------------------------------------------------------------------
library(aliviateR)

## -----------------------------------------------------------------------------
aliviateR::printroxygenheader(func = TRUE,
                              data = FALSE)

## ---- eval = FALSE------------------------------------------------------------
#  alval_flow(path = '/Users/alval/Box/Research',
#             pkg_name = 'GoT',
#             vignette_name = 'GoT Vignette',
#             testing = FALSE,
#             data = FALSE,
#             title = "Scrape Game of Thrones (GoT) Data",
#             description = "Scrapes Game of Thrones (GoT) data from multiple sources. The package can scrape scripts from episodes available on from www.genius.com. Additionally, the package can scrape character lists from http://awoiaf.westeros.org/index.php/List_of_characters and https://www.hbo.com/game-of-thrones/cast-and-crew. Lastly, the package can scrape death timeline data from https://deathtimeline.com/.",
#             firstname = "Alessandra",
#             lastname = "Valcarcel",
#             email = "alval@pennmedicine.com",
#             role = c("aut", "cre"))

## ---- eval = FALSE------------------------------------------------------------
#  usethis::use_git_config()
#  Sys.getenv("GITHUB_PAT")
#  git2r::cred_ssh_key()

## ---- eval = FALSE------------------------------------------------------------
#  alval_git(pkg_path = '/Users/alval/Box/Research/GoT',
#            credentials = 'alval')

## ---- eval = FALSE------------------------------------------------------------
#  badges = alval_badges(pkg_path = '/Users/alval/Box/Research/GoT',
#                        gh_username = 'avalcarcel9',
#                        interactive = TRUE,
#                        travis = TRUE,
#                        coverage = TRUE,
#                        appveyor = TRUE)
#  badges$travis_badge
#  badges$coverage_badge
#  badges$appveyor_badge

## ---- eval = FALSE------------------------------------------------------------
#  devtools::check(pkg = '/Users/alval/Box/Research/GoT)

## -----------------------------------------------------------------------------
files = tibble::tibble(files1 = c('/Desktop/subject_111.csv', '/Desktop/subject_123.csv', '/Desktop/subject_902'),
                       files2 = c('/Documents/subject_111.csv', '/Documents/subject_902', '/Documents/subject_123.csv'))

sort_filepaths(filepaths = files)

## -----------------------------------------------------------------------------
files = tibble::tibble(files1 = c('/Desktop/subject_111.csv', '/Desktop/subject_123.csv', '/Desktop/subject_902'),
                       files2 = c('/Documents/subject_111.csv', '/Documents/subject_902', '/Documents/subject_123.csv'))

sort_filepaths(filepaths = files, id_pattern = "[0-9][0-9]")

## -----------------------------------------------------------------------------
list.files('/Users/alval/Documents/ISBI_Challenge_2015/training/training01/preprocessed/')
list.files('/Users/alval/Documents/ISBI_Challenge_2015/training/training01/masks/')

## -----------------------------------------------------------------------------
paths = c('/Users/alval/Documents/ISBI_Challenge_2015/training/training01/preprocessed', '/Users/alval/Documents/ISBI_Challenge_2015/training/training01/masks')
patterns = c('flair_pp', 'mask1')
multiple_filepaths(path = paths, 
                   pattern = patterns, 
                   full.names = TRUE, 
                   sort = TRUE,
                   id_pattern = "[0-9][0-9]_[0-9][0-9]")

## -----------------------------------------------------------------------------
gold_standard = c(1,1,1,0,0,1,1,1)
comp_method = c(0,1,0,1,0,0,1,1)
dsc(gold_standard = gold_standard, comp_method = comp_method)

## -----------------------------------------------------------------------------
prob_map =  runif(100, 0, 1)
gold_standard = ifelse(prob_map > 0.9, 1, 0)
thresholds = seq(from = 0, to = 1, by = 0.05)

dsc_mult_thresholds(gold_standard, 
                    prob_map, 
                    thresholds, 
                    mask = NULL)

## ---- eval = FALSE------------------------------------------------------------
#  load_mrdata(path,
#              pattern)

## ---- eval = FALSE------------------------------------------------------------
#  save_slices(imgs,
#              outfiles,
#              format = c('png', 'pdf'),
#              width = NULL,
#              height = NULL,
#              units = NULL,
#              ...)

## ---- eval = FALSE------------------------------------------------------------
#  # `rtapas` has example probability map data available for use
#  # Load and create a list of 2 example NIFTI objects from `rtapas`
#  images = list(rtapas::pmap1, rtapas::pmap2)
#  save_slices(imgs = images,
#              outfiles = c('/Users/alval/Desktop/test_pmap1', '/Users/alval/Desktop/test_pmap2.png'), # Change to a file path where you would like to save the example images. Note we can include or exclude the file extension.
#              format = 'png',
#              width = 480,
#              height = 480,
#              units = 'px',
#              z = 2,
#              col = oro.nifti::hotmetal(70),
#              plane = 'axial',
#              plot.type = 'single')

