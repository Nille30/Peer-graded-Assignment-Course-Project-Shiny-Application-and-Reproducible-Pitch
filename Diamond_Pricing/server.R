
#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
# select columns to be used in the analysis
diamond_data <- diamonds[,c(1:4,7)]
# Define server logic required to draw a plot
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        # select diamond chars based on user input
        diamond_data <- filter(diamond_data, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
        # building of the linear regression model
        fit <- lm( price~carat, diamond_data)
        # prediction of the price 
        pred <- predict(fit, newdata=data.frame(carat=input$car, cut=input$cut, color=input$col, clarity=input$clar))
        # Draws a plot by using ggplot2
        plot <- ggplot(data=diamond_data, aes(x=carat, y=price))+
            geom_point(aes(color=cut), alpha=0.4)+
            geom_smooth(method="lm", color="red")+
            geom_vline(xintercept=input$car, color="black")+
            geom_hline(yintercept=pred, color="black")+
            labs(x="Weight in Carat", y="Price in USD")
        plot
    })
    output$diamond <- renderText({
        diamond_data <- filter(diamond_data, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
        fit <- lm( price~carat, diamond_data)
        pred <- predict(fit, newdata=data.frame(carat=input$car, cut=input$cut, color=input$col, clarity=input$clar))
        res <- paste(round(pred, digits=2), "$")
        res
    })
    
})
