#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tibble)
library(tidyverse)
library(stringi)
library(stringr)
library(tm)


df_prediction <- readRDS("data/df_prediction.rds")
data("mpg")

predict_ngram <- function(sentence_input, maxresult = 3){
    removelinks <- function(x) {gsub("?(f|ht)tp(s?)://(.*)[.][a-z]+", "", x)}
    sentence_input <- tolower(sentence_input)
    sentence_input <- str_squish(sentence_input)
    sentence_input <- removelinks(sentence_input)
    sentence_input <- removePunctuation(sentence_input)
    
    partial_answer <- tibble(value = character(),
                             n = integer(),
                             level = double(),
                             prediction = character())
    
    answer <- partial_answer
    
    #answer <- multigram %>% filter(sentence_input == value)
    
    while(sapply(strsplit(sentence_input, " "), length) > 0){
        partial_answer <- df_prediction %>% filter(sentence_input == value) #%>% filter(prediction %in% sentence_options)
        #print(answer)
        #print(sentence_input)
        ifelse (sapply(strsplit(sentence_input, " "), length) <= 1, sentence_input <- "", sentence_input <- sub(".+? ", "", sentence_input))
        #print(head(answer,1))
        answer <- rbind(answer,partial_answer)
    }
    answer %>% head(maxresult) %>% select(prediction) %>% rename("Next Possible Word(s):" = prediction)
    
}

#pred <- data.frame(row.names = "A")
pred <- predict_ngram("", 3)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    reactive({
    
    phrase <- input$text
    
    #if (phrase != ""){
        
    #}

    })
    output$answer_table <- renderTable(predict_ngram(input$text, input$n_pred_result)) 
    # output$answer <- renderText(paste(input$text,"paste"))
    
})
