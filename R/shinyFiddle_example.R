#' shinyFiddle_example
#'
#' \code{shinyFiddle_example} This is just an shiny showcase for the functionalities of shinyFiddle package.
#'
#' @examples
#' shinyFiddle_example()
#'
#' @author Javier Saez Gallego


shinyFiddle_example = function(){
  require(shiny)
  require(shinyjs)
  require(devtools)
  require(shinyFiddle)


  shinyApp(
    #--------------------
    # User Interface side
    #--------------------
    ui = fluidPage(
      useShinyjs(),
      mainPanel(
        h4('Showcase for library(shinyColors)'),
        tabsetPanel(
          id = "tabSetId",

          tabPanel(
            "Placeholder",
            numericInput('num1', label = "Numeric Input with placeholder",value="")
          ),

          tabPanel(
            "Border color",
            numericInput('num2', label = "Colored border", value = -1)
          ),

          tabPanel(
            "Input must be positive",
            numericInput('numPos', label = "This number should be > 0", value = -1)
          ),
          tabPanel(
            "Input must be negative",
            numericInput('numNeg', label = "This number should be < 0", value = 1)
          )
        )
      )
    ),


    #--------------------
    # Server side
    #--------------------
    server = function(input, output) {

      observe({
        # Change the placeholder of the numeric input
        placeholder_numericInput('num1','Input some numbers here')

        # Change the border color
        boderCol_numericInput('num2',color = "#ff0000")
      })


      observeEvent(input$numPos, {
        # Change the color of the tab when numPos is negative
        if (input$numPos <= 0) {
          change_color_tab("tabSetId", 3, 'red')
        } else{
          change_color_tab("tabSetId", 3, 'black')
        }
      })

      observeEvent(input$numNeg, {
        # Change the background color of the tab when numNeg is positive
        if (input$numNeg >= 0) {
          change_bgcolor_tab("tabSetId", 4, '#ffc266')
        } else{
          change_bgcolor_tab("tabSetId", 4, 'white')
        }
      })
    }
  )

}
