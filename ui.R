#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("slate"),
                  navbarPage("Data Science Capstone",
                             tabPanel(
                                 "Text Prediction",
                                 h3("Instructions"),
                                 p("Just type the text in the box and the application will try to predict the next word resit. You can configure the number of words results using the slider bellow."),
                                 sidebarLayout(
                                     sidebarPanel(
                                         p("Configuration"),
                                         sliderInput("n_pred_result",
                                                     "Number of maximum words in prediction result:",
                                                     min = 1,
                                                     max = 10,
                                                     value = 3)
                                     ),
                                     # Show a plot of the generated distribution
                                     mainPanel(
                                         textInput("text", label = h3("Enter Text:"), value = ""),
                                         # textOutput("answer"),
                                         tableOutput("answer_table"),
                                         
                                     )
                                 )
                             ),
                            
                             tabPanel("About",
                                      h2("About this application"),
                                      p("This is a project of the Data Science Specialization in Coursera of Johns Hopkins University."),
                                      p("The source code is available in ",a(href="https://luizcarlos.shinyapps.io/DataScienceCapstone/","Github"),"."),
                                      p("The presentation about this aplication is available in ", a(href="https://rpubs.com/franze/dsc_presentation","Rpubs"),"."),
                                      p("Author: Luiz Carlos Franzé"),
                                      br(),
                                      br(),
                                      
                             
                             h2("References"),
                             
                             p("Fridolin Wild, Performance Augmentation Lab (PAL), Oxford Brookes University, UK"),
                             a(href="https://cran.r-project.org/web/views/NaturalLanguageProcessing.html","CRAN"),
                             br(),
                             br(),
                             
                             
                             p("Stanford Course"),
                             a(href="https://web.stanford.edu/~jurafsky/NLPCourseraSlides.html","Stanford Coursera course"),
                             br(),
                             br(),
                             
                             p("Ingo Feinerer, Kurt Hornik, David Meyer"),
                             a(href="https://www.jstatsoft.org/article/view/v025i05","Journal  of Statistical Software"),
                             br(),
                             br(),
                             
                             p("AbdulMajedRaja RS"),
                             a(href="https://www.r-bloggers.com/2019/08/how-to-create-unigrams-bigrams-and-n-grams-of-app-reviews/","R-Bloggers"),
                             
                             )
                             
                 )

    # Application title

    # Sidebar with a slider input for number of bins

))
