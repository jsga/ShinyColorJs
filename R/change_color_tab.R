#' change_color_tab
#'
#' \code{change_color_tab} changes the  color of the text of a tabPanel in a tabSetPanel
#'
#' This function should be used inside \code{server.R} of a shiny app.
#'
#' @tabId ID of the tabSetPanel
#' @subTabNumber number of the tab we want to change the color
#' @color string giving the color name, or in CEX
#'
#' @examples
#'
#' require(shiny)
#' require(shinyjs)
#' require(devtools)
#' require(shinyColors)
#'
#' shinyApp(
#'   ui = fluidPage(
#'     useShinyjs(),
#'     mainPanel(
#'       h4('The colors of the tabs react to the numeric inputs.'),
#'       tabsetPanel(
#'         id = "tabSetId",
#'         tabPanel(
#'           "Input must be positive",
#'           numericInput('numPos', label = "This number should be > 0", value = -1)
#'         )
#'       )
#'     )),
#'
#'   server = function(input, output) {
#'     observeEvent(input$numPos, {
#'       # Change the color of the tab when numPos is negative
#'       if (input$numPos <= 0) {
#'         change_color_tab("tabSetId", 1, 'red')
#'       } else{
#'         change_color_tab("tabSetId", 1, 'black')
#'       }
#'     })
#'   }
#' )
#'
#' @author Javier Saez Gallego


change_color_tab = function(tabId,subTabNumber,color){
  command_js = paste0("document.getElementById('",tabId,"').children[",subTabNumber-1,"].children[0].style.color = '",color,"'")
  runjs(command_js)
}
