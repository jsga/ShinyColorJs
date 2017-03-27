# shinyFiddle
This R package includes a set of functions that allow the user to modify the following details that cannnot be modified directly by the dfeault functions:
1. Add placeholder to numericInput elements 
2. Change the boder color of a numericInput 
3. Change the color of the tab title  
4. Change background color of a tab

# Example

## Intall package
```{r}
require(devtools)
install_github('jsga/shinyFiddle')
```

## Example: showcase

The example can be simply run by `shinyFiddle_example()`, or, similarly, by the following example:

```{r}
  require(shiny)
  require(shinyjs)
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
```