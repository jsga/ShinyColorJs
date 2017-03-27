#' boderCol_numericInput
#'
#' \code{boderCol_numericInput} assigns a placeholder to a numeric input
#'
#' This function shoudl be used inside \code{UI.R} of a shiny app.
#'
#' @Id ID of the numericInput
#' @color string indicating the color of the border. Detault equal to #ff0000
#' @px width of the border in pixels. By default, equal to 2.
#'
#' @examples
#'
#' @author Javier Saez Gallego



boderCol_numericInput = function(id,color = "#ff0000",px=2){
  runjs( paste0("document.getElementById('",id,"').style.border = '",px,"px solid ",color,"'"))
  message(paste0("document.getElementById('",id,"').style.border = '",px,"px solid ",color,"'"))
}




