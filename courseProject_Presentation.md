Quarter Mile Time Prediction based on Horsepower
========================================================
author: Gueller
date: 29 July 2020
autosize: true

Overview & User Interface
========================================================
**Overview**

This app allows the User to predict the Quarter Mile Time of a vehicle
based on the Horsepower.

The data that is used in the prediction is the Motor Trend Car Road Tests
collected from model year vehicles 1973-1974.  Admittedly, the data used 
to provide the predictions is a little dated.

**User Interface**

The User Interface is simple and has two inputs:
- Slider: The slider allows the user to select the horspower of the given vehicle.
- Checkbox: The checkbox allows the user to see the number of cylinders the vehicles in the data set had.

Graph Code
========================================================

This is the code that will produces the graph that displays the data points, the prediction line and the select horsepower.


```r
if(input$showCyl) {
        # Set the colors for the number of cylinders
        colors <- c("#91732d", "#2d9163", "#912d5e")
        colors2 <- colors[as.factor(mtcars$cyl)]
        # Plots the data, line and selected point
        plot(mtcars$hp, mtcars$qsec, xlab="Horsepower",
             ylab="Quarter Mile Time", bty="n", pch=16, cex=1.5,
             xlim=c(50, 350), ylim=c(14, 24), col=colors2)
             legend("topright", title="Number of Cylinders", 
                    legend=levels(as.factor(mtcars$cyl)),
                    fill=colors)
             abline(mdl, col="#63646e", lwd=2)
        points(hpInput, model1pred(), col="#63646e", pch=16, cex=2)
        }
```

Solution Code
========================================================

This code produces the model and makes the prediction.  Code later pushes
the solution (predicted Quarter Mile Time) back to the UI.


```r
shinyServer(function(input, output) {
    mdl <- lm(qsec ~ hp, data = mtcars)
    
    model1pred <- reactive({
        hpInput <- input$sliderHP
        predict(mdl, newdata = data.frame(hp=hpInput))
    })
```

Closing
========================================================

Thank you for your attention. 

A demo of the ap can be accessed at:

[Quarter Mile Prediction](http://)
