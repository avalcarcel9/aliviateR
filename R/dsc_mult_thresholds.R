#' @title Calculate Sørensen–Dice index for a probability map using multiple thresholds
#' @description Calculates Sørensen–Dice index for a probability map using multiple thresholds
#' @param gold_standard A vector or nifti of the gold standard to compare using Sørensen–Dice. Class must match prob_map.
#' @param prob_map A vector or nifti of the probability map to compare at multiple thresholds with the gold_standard. Class must match gold_standard.
#' @param thresholds A vector of thresholds to use on the probability map
#' @param mask NULL by default assumes that gold_standard and prob_map are already vectors. If niftis are supplied then a mask must be provided to vectorize the gold_standard and prob_map.
#' @export
#' @importFrom tibble tibble
#' @return A tibble with a column of the user-defined thresholds (threshold) and the Sørensen–Dice (dsc) values is returned.

dsc_mult_thresholds <- function(gold_standard, prob_map, thresholds, mask = NULL){
  # Obtain predicted dsc when 2 vectors are supplied
  if(is.null(mask) == TRUE & (is.numeric(gold_standard) != is.numeric(prob_map))){
    stop("Either 'gold_standard' or 'prob_map' is not a vector.")
  }
  # When objects are nifti but no mask is provided return a message to supply a mask
  if(is.null(mask) == TRUE & class(gold_standard)[1] == 'nifti' & class(gold_standard)[1] == 'nifti'){
    stop("'mask' must be provided if 'gold_standard' and 'prob_map' are nifti")
  }

  # when a mask is supplied and objects are nifti
  if(is.null(mask) == FALSE & class(gold_standard)[1] == 'nifti' & class(gold_standard)[1] == 'nifti'){
    # turn niftis into vectors
    prob_map = c(prob_map[mask == 1])
    gold_standard = c(gold_standard[mask == 1])
  }

  # calculate dsc for each threshold
  pred_lesion = sapply(thresholds, function(x){ifelse(prob_map>x,1,0)})
  pred_dsc = apply(pred_lesion, 2, dsc, gold_standard = gold_standard)
  pred_dsc = tibble::tibble(threshold = thresholds, dsc = pred_dsc)
  return(pred_dsc)

}
