#' @title Save the Same Slice Across Images
#' @description Save the same slice across a set of images provided. Saves images in png or PDF formats.
#' Others can be added upon request through a GitHub issue. Wraps [oro.nifti::image()].
#' @param imgs A `character` `vector` of file paths to the image(s) or local `list` of
#' `nifti` class objects.
#' @param outfiles A `character` `vector` of file paths corresponding to the name of the output file(s).
#' @param format The format in which to save the image slice. Only 'png' and 'pdf' are supported currently.
#' Users can include the image format in the file path (i.e. test.png) or exclude. If excluded `outfiles`
#' pasted with the `format` input.
#' @param width The width of the device. The default is 480 px for `format = 'png'` and
#' 7 inches for `format = 'pdf'`.
#' @param height The height of the device. The default is 480 px for `format = 'png'` and
#' 7 inches for `format = 'pdf'`.
#' @param units The units in which height and width are given. Can be 'px' (pixels, the default),
#' 'in' (inches), 'cm' or 'mm'. This is only allowed with `format = 'png'`. Specifying a unit will be
#' ignored with `format = 'pdf'` will be ignored and instead inches are used. The default is set to 'px'.
#' @param ... Arguments passed to the [oro.nifti::image()] function may be provided here.
#' Common useful arguements include `z` is the slice to be displayed (ignored when plot.type = "multiple"),
#' `col` is grayscale (by default), `plane` is the plane of acquisition to be displayed (choices are ‘axial’, ‘coronal’, ‘sagittal’).
#' @importFrom dplyr if_else
#' @importFrom grDevices dev.off pdf png
#' @importFrom neurobase check_nifti
#' @importFrom oro.nifti image
#' @importFrom stringr str_detect
#' @return A list of simple output from [grDevices::png()] or [grDevices::pdf()]. Image slice(s) are
#' saved to `outfiles`.
#' @export
#'
#' @examples \dontrun{
#' # `rtapas` has example probability map data available for use
#' # Load and create a list of 2 example NIFTI objects from `rtapas`
#' images = list(rtapas::pmap1, rtapas::pmap2)
#' save_slices(imgs = images,
#'             outfiles = c('/Users/alval/Desktop/test_pmap1', '/Users/alval/Desktop/test_pmap2.png'), # Change to a file path where you would like to save the example images. Note we can include or exclude the file extension.
#'             format = 'png',
#'             width = 480,
#'             height = 480,
#'             units = 'px',
#'             z = 2,
#'             col = oro.nifti::hotmetal(70),
#'             plane = 'axial',
#'             plot.type = 'single')
#' }

save_slices <- function(imgs,
                        outfiles,
                        format = c('png', 'pdf'),
                        width = NULL,
                        height = NULL,
                        units = NULL,
                        ...){

  # Check that imgs and outfiles are the same length
  if(length(imgs) != length(outfiles)){
    stop('imgs length does not match outfiles.')
  }

  # Check that outfiles has file extension
  outfiles = dplyr::if_else(stringr::str_detect(outfiles, paste0('.', format)),
                            outfiles,
                            paste0(outfiles, '.', format))

  save_a_slice <- function(i){
    # load the image
    img = neurobase::check_nifti(imgs[[i]])
    if(format == 'png'){
      # Set default width and height for png setting to 480
      # These defaults are the grDevices::png() default
      if(is.null(width)){
        width = 480
      }
      if(is.null(height)){
        height = 480
      }
      if(is.null(units)){
        units = 'px'
      }
      # Save the single slice as a png
      grDevices::png(file = outfiles[i], width = width, height = height)
      oro.nifti::image(img, ...)
      grDevices::dev.off()

    } else if (format == 'pdf'){
      # Set default width and height for png setting to 480
      # These defaults are the grDevices::pdf() default
      if(is.null(width)){
        width = 7
      }
      if(is.null(height)){
        height = 7
      }
      # Save the single slice as a PDF
      grDevices::pdf(file = outfiles[i], width = width, height = height)
      oro.nifti::image(img, ...)
      grDevices::dev.off()
    } else {
      stop('format must be \'png\' or \'pdf\'')
    }
  }

  lapply(1:length(imgs), save_a_slice)
}

