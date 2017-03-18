#' This is a working minimal example that shows how to change the background color and the color of the text of the tabs in a tabSetPanel

library(shiny)
require(shinyjs)
source('change_color_tab')
source('change_bgcolor_tab') 

shinyApp(
  ui = fluidPage(
    useShinyjs(),
    mainPanel(
      h4('The colors of the tabs react to the numeric inputs.'),
      tabsetPanel(
        id = "tabSetId",
        tabPanel(
          "Input must be positive",
          numericInput('numPos', label = "This number should be > 0", value = -1)
        ),
        tabPanel(
          "Input must be negative",
          numericInput('numNeg', label = "This number should be < 0", value = 1)
        )
      )
    )),
  
  server = function(input, output) {
    observeEvent(input$numPos, {
      # Change the color of the tab when numPos is negative
      if (input$numPos <= 0) {
        change_color_tab("tabSetId", 1, 'red')
      } else{
        change_color_tab("tabSetId", 1, 'black')
      }
    })
    
    observeEvent(input$numNeg, {
      # Change the background color of the tab when numNeg is positive
      if (input$numNeg >= 0) {
        change_bgcolor_tab("tabSetId", 2, '#ffc266')
      } else{
        change_bgcolor_tab("tabSetId", 2, 'white')
      }
    })
  }
)