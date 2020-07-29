# quarterMile

library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Quarter Mile Time From Horsepower"),
        strong("Overview"),
        p("This application uses the Motor Trend Car Road 
            Tests data from 1973-1974 model year vehicles to
            predict Quarter Mile Time based on Horsepower."),
        p("The default view plots the points in color, the color
            indicates the number of cylinders.  The user has the option
            to turn off the color and consider the data visually soley
            by Horsepower."),
        strong("User Interface"),
        h5("Slider - Use the slider to enter the desired Horsepower"),
        h5("Checkbox - Use the checkbox to toggle the colored points on/off
            (color indicates number of cylinders)"),
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