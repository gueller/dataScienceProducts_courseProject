# quarterMile

library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Quarter Mile Time From Horsepower"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderHP", "What is the Horsepower of the car?", 50, 350, value=150),
            checkboxInput("showCyl", "Show/Hide Cylinders", value=TRUE)
        ),
        mainPanel(
            plotOutput("plt1"),
            h4("Predicted Quarter Mile Time:"),
            textOutput("prd1"),
        )
    )
))