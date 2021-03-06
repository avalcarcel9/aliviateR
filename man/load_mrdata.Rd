% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_mrdata.R
\name{load_mrdata}
\alias{load_mrdata}
\title{Load Multiple R Data Files}
\usage{
load_mrdata(path, pattern, bind_rows = TRUE)
}
\arguments{
\item{path}{The path to the folder where the multiple files are stored}

\item{pattern}{The pattern of the files inside the folder to import}

\item{bind_rows}{By default is set to TRUE. Will bind rows of the multiple
data frames supplied by the path.}
}
\description{
Loads multiple .RData, .rda, or .rds files
}
