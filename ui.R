#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Data Science Capstone"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("n_pred_result",
                        "Number of words in prediction result:",
                        min = 1,
                        max = 10,
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            textInput("text", label = h3("Text input"), value = "Enter text..."),
        )
    )
))
