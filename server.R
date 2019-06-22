library(shiny)
library(MASS)
library(ggplot2)
shinyServer(function(input, output) {
    fit <- lm(estperf ~ mmax + cach, data = cpus)
    
    fitpredict <- reactive({
        mmaxInput <- input$sldmmax
        cachInput <- input$sldcach
        predict(fit, newdata = data.frame(mmax=mmaxInput,
                                          cach=cachInput))
    })
    output$plot <- renderPlot({
        g <- qplot(x=estperf,y=mmax,aes(colour=cach),data = cpus)
        g
    })
    
    output$pred <- renderText({
        fitpredict()
    })

})
