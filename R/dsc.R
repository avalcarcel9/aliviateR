#' @title Calculate Sørensen's-Dice
#' @description Calculate Sørensen's-Dice between two vectors or NIFTIs
#' @param gold_standard a binary 0,1 vector or nifti object to compare
#' @param comp_method a binary 0,1 vector or nifti object to compare
#' @export
#' @return Returns single Sørensen's-Dice calculation. Should be between 0 and 1.
#' @examples \dontrun{
#' gold_standard = c(1,0,1,0,1,0,0)
#' comp_method =c(0,0,1,0,1,0,0)
#' dsc(gold_standard = gold_standard, comp_method = comp_method)}

dsc <- function(gold_standard, comp_method){
  # Check inputs are binary 0 and 1
  if(all(gold_standard == 0 | gold_standard == 1) == FALSE | all(comp_method == 0 | comp_method == 1) == FALSE){
    return('Inputs are not binary 0 or 1. Please check gold_standard and comp_method are both 0/1 binary.')
  } 
  
  # Calculate DSC for vector inputs
  if(is.numeric(gold_standard) & is.numeric(comp_method) & (length(gold_standard) == length(comp_method))){
    dsc = (2*sum(gold_standard * comp_method))/(sum(gold_standard) + sum(comp_method))
    # Calculate DSC for images after checking both are nifti and the same dimension
  } else if(class(gold_standard)[1] == 'nifti' & class(comp_method)[1] == 'nifti' & all(dim(gold_standard) == dim(comp_method))){
    dsc = (2*sum(gold_standard * comp_method))/(sum(gold_standard) + sum(comp_method))
    # If these are not true then classes or dimensions  
  } else{
    return('Inputs do not match. Please check both inputs are niftis or vectors. Also check niftis or vectors are of the same length or dimension')
  }
  
  return(dsc)
}