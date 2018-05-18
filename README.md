
[![Travis build status](https://travis-ci.org/avalcarcel9/aliviateR.svg?branch=master)](https://travis-ci.org/avalcarcel9/aliviateR)

[![Coverage status](https://codecov.io/gh/avalcarcel9/aliviateR/branch/master/graph/badge.svg)](https://codecov.io/github/avalcarcel9/aliviateR?branch=master)

[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/avalcarcel9/aliviateR?branch=master&svg=true)](https://ci.appveyor.com/project/avalcarcel9/aliviateR)

<!-- README.md is generated from README.Rmd. Please edit that file -->
aliviateR
=========

The goal of aliviateR is to help automate the process of building packages. I hope to eventually write and include some functions that I constantly am coding for research.

Installation
------------

`aliviateR` is currently only available as a development version from [GitHub](https://github.com/). You can download this version with:

``` r
# install.packages("devtools")
devtools::install_github("avalcarcel9/aliviateR")
```

For any issues, please feel free to email me or submit and issue.

Functions
---------

Currently, there are 5 functions available through `aliviateR`. Below I will define the functions.

The first function is very simple and just prints a generic roxygen header for a function and/or data.

``` r
aliviateR::printroxygenheader(func = TRUE,
                              data = FALSE)
```

By default it returns only a function header but you can choose to return both or just a data header by changing the logicals.

The next function is `aliviateR::alval_flow()`. This function will create the project directory for a package similar to `File > New Project > R package`. In addition to creating the package directory filled in the proper package form, it allows you to edit the description with your personal information, add a vignette, add testing options, and adds the readme files.

``` r
alval_flow(path = NULL, 
           pkg_name = NULL, 
           vignette_name = NULL,
           testing = TRUE, 
           title = "What the Package Does (One Line, Title Case)",
           description = "What the package does (one paragraph).",
           firstname = "Alessandra", 
           lastname = "Valcarcel",
           email = "alval@pennmedicine.com", 
           role = c("aut", "cre"))
```

Feel free to change the `firstname`, `lastname`, and `email` fields and use on your own. Type `?aliviateR::alval_flow` for documentation.

The next function `aliviateR::alval_git` initializes a GitHub repo for your package, adds, commits, and pushes the package contents to GitHub. **This requires that GitHub is properly configured on your machine and with RStudio.** For more information on configuration see [RStudio Support](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN), [R packages by Hadley Wickham](http://r-pkgs.had.co.nz/git.html), and [Blog](http://happygitwithr.com/rstudio-git-github.html).

At the minium you need your GitHub username and email set up as well as a token set up in your .Renviron. R also has to know where your ssh keys are. You can check if this is done already by running:

``` r
usethis::use_git_config()
Sys.getenv("GITHUB_PAT")
git2r::cred_ssh_key()
```

If these are properly set up then `aliviateR::alval_git()` should run.

``` r
alval_git(pkg_path = NULL, 
          credentials = NULL)
```

You'll need to specify the path to your package. By default the credentials are NULL. This arguement is passed to `devtools::usethis::use_git()` so check our their documentation for more info though `NULL` should still run. I set it to something special `credentials = alval` for a specialized path to my credentials. The other option is to input your own if `NULL` doesn't seem to work. After you run this, check that the package folder is set up as a repo on your GitHub.

The `aliviateR::alval_badges()` function adds continuous integration and coverage checks. Additionally, it returns the badges you can add to your readme.

``` r
alval_badges(pkg_path = NULL, 
             gh_username = NULL, 
             interactive = TRUE,
             travis = TRUE,
             coverage = TRUE, 
             appveyor = TRUE,
             cran = TRUE)
```

You'll specify the path to your package and GitHub username. Running this will prompt many of the continous integration sites to open (if `interactive = TRUE`) and you can configure the setting options interactively. If you have already done this and just need the badges then set `interactive = FALSE`. You only need to to copy and paste the badges you specified into your readme.

The `aliviateR::sort_filepaths()` function is a little different than the previous functions. It doesn't help with building packages but is useful in everday research. This function should be used when you would like to sort a data.frame or tibble of filepaths by an ID contained inside the filepath. The ID must be larger than 3 numbers. A tibble will be returned with an additional `id` column.

``` r
sort_filepaths(filepaths)
```

For a full example of my flow see the [vignette](https://github.com/avalcarcel9/aliviateR/blob/master/vignettes/vignette.Rmd) for an example.
