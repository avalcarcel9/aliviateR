% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_slices.R
\name{save_slices}
\alias{save_slices}
\title{Save the Same Slice Across Images}
\usage{
save_slices(
  imgs,
  outfiles,
  format = c("png", "pdf"),
  width = NULL,
  height = NULL,
  units = NULL,
  ...
)
}
\arguments{
\item{imgs}{A `character` `vector` of file paths to the image(s) or local
`list` of `nifti` class objects.}

\item{outfiles}{A `character` `vector` of file paths corresponding to the
name of the output file(s).}

\item{format}{The format in which to save the image slice. Only 'png' and
'pdf' are supported currently. Users can include the image format in the
file path (i.e. test.png) or exclude. If excluded `outfiles` pasted with
the `format` input.}

\item{width}{The width of the device. The default is 480 px for `format =
'png'` and 7 inches for `format = 'pdf'`.}

\item{height}{The height of the device. The default is 480 px for `format =
'png'` and 7 inches for `format = 'pdf'`.}

\item{units}{The units in which height and width are given. Can be 'px'
(pixels, the default), 'in' (inches), 'cm' or 'mm'. This is only allowed
with `format = 'png'`. Specifying a unit will be ignored with `format =
'pdf'` will be ignored and instead inches are used. The default is set to
'px'.}

\item{...}{Arguments passed to the [oro.nifti::image()] function may be
provided here. Common useful arguments include `z` is the slice to be
displayed (ignored when plot.type = "multiple"), `col` is grayscale (by
default), `plane` is the plane of acquisition to be displayed (choices are
'axial', 'coronal', 'sagittal').}
}
\value{
A list of simple output from [grDevices::png()] or
  [grDevices::pdf()]. Image slice(s) are saved to `outfiles`.
}
\description{
Save the same slice across a set of images provided. Saves
  images in png or PDF formats. Others can be added upon request through a
  GitHub issue. Wraps [oro.nifti::image()].
}
\examples{
\dontrun{
# `rtapas` has example probability map data available for use
# Load and create a list of 2 example NIFTI objects from `rtapas`
images = list(rtapas::pmap1, rtapas::pmap2)
save_slices(imgs = images,
            outfiles = c('/Users/alval/Desktop/test_pmap1',
            '/Users/alval/Desktop/test_pmap2.png'),
#  Change to a file path where you would like to save the example images.
# Note we can include or exclude the file extension.
            format = 'png',
            width = 480,
            height = 480,
            units = 'px',
            z = 2,
            col = oro.nifti::hotmetal(70),
            plane = 'axial',
            plot.type = 'single')
}
}
