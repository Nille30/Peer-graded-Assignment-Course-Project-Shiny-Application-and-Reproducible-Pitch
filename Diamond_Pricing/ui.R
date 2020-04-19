
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
    
    # Title of the application
    titlePanel("Diamond price prediction"),
    
    # Sidebar to select relevant options
    sidebarLayout(
        sidebarPanel(
            helpText("This app predicts the price of diamonds base on selected characteristics"),
            h3(helpText("Select:")),
            sliderInput("car", label=h4("Weight of the Diamond in Carats"),min = 0, max = 5,value = 2 , step = 0.1),
            selectInput("col", label = h4("Color of the Diamond"),
                        choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                       "F" = "F", "G" ="G",
                                       "H" = "H", "I" = "I",
                                       "J" = "J")),
            h6(helpText("D (best) to J (worst)")),
            selectInput("clar", label = h4("Clarity of the Diamond"), 
                        choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                       "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                       "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
            h6(helpText("a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best)")),
            selectInput("cut", label = h4("Cut of the Diamond"), 
                        choices = list("All Cuts" = "*", "Fair" = "Fair", "Good" = "Good",
                                       "Very Good" = "Very Good", "Premium" = "Premium",
                                       "Ideal" = "Ideal")),
            h6(helpText("Quality of the cut")),
        ),
        
        # Shows a plot of all diamonds and a linear regression
        mainPanel(
            plotOutput("distPlot"),
            h4("The predicted value of your given diamond is:"),
            h3(textOutput("diamond"))
        )
    )
))
