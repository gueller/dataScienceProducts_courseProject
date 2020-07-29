#quarterMile

library(shiny)
shinyServer(function(input, output) {
    mdl <- lm(qsec ~ hp, data = mtcars)
    
    model1pred <- reactive({
        hpInput <- input$sliderHP
        predict(mdl, newdata = data.frame(hp=hpInput))
    })
    
    output$plt1 <- renderPlot({
        hpInput <- input$sliderHP
        
        # plot not including the color coded cylinders
        plot(mtcars$hp, mtcars$qsec, xlab="Horsepower",
             ylab="Quarter Mile Time", bty="n", pch=16, cex=1.5,
             xlim=c(50, 350), ylim=c(14, 24))
        abline(mdl, col="#3bc47d", lwd=2)
        points(hpInput, model1pred(), col="#3bc47d", pch=16, cex=2)
        
        # plot including color coded cylinders
        if(input$showCyl) {
        #Set the colors for the number of cylinders
        colors <- c("#91732d", "#2d9163", "#912d5e")
        colors2 <- colors[as.factor(mtcars$cyl)]
        
        plot(mtcars$hp, mtcars$qsec, xlab="Horsepower",
             ylab="Quarter Mile Time", bty="n", pch=16, cex=1.5,
             xlim=c(50, 350), ylim=c(14, 24), col=colors2)
             legend("topright", title="Number of Cylinders", 
                    legend=levels(as.factor(mtcars$cyl)),
                    fill=colors)
             abline(mdl, col="#63646e", lwd=2)
        points(hpInput, model1pred(), col="#63646e", pch=16, cex=2)
        }
    })
    # send the predicted quarter mile time back to the UI
    output$prd1 <- renderText({
        model1pred()
    })
})