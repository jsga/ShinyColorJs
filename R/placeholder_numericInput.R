#' placeholder_numericInput
#'
#' \code{placeholder_numericInput} assigns a placeholder to a numeric input
#'
#' This function shoudl be used inside \code{UI.R} of a shiny app.
#'
#' @tabId ID of the numericInput
#' @placeHolder string indicating the placeHolder
#'
#' @examples
#'
#' @author Javier Saez Gallego


placeholder_numericInput = function(id,placeHolder = ""){
  runjs( paste0("document.getElementById('",id,"').placeholder = '",placeHolder,"'"))
}
