#' change_bgcolor_tab
#'
#' \code{change_bgcolor_tab} changes the background color of a tabPanel in a tabSetPanel
#'
#' This function shoudl be used inside \code{server.R} of a shiny app.
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
#'         ),
#'         tabPanel(
#'           "Input must be negative",
#'           numericInput('numNeg', label = "This number should be < 0", value = 1)
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
#'
#'     observeEvent(input$numNeg, {
#'       # Change the background color of the tab when numNeg is positive
#'       if (input$numNeg >= 0) {
#'         change_bgcolor_tab("tabSetId", 2, '#ffc266')
#'       } else{
#'         change_bgcolor_tab("tabSetId", 2, 'white')
#'       }
#'     })
#'   }
#' )
#'
#' @author Javier Saez Gallego


change_bgcolor_tab = function(tabId,subTabNumber,color){
  command_js = paste0("document.getElementById('",tabId,"').children[",subTabNumber-1,"].children[0].style.background = '",color,"'")
  runjs(command_js)
}
