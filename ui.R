library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("CPU Performance Prediction"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sldmmax",
                        "Maximum Main Memory in Kilobytes:",
                        min = 64,
                        max = 128000,
                        value = 10000),
            sliderInput("sldcach",
                        "Cache size in Kilobytes:",
                        min = 0,
                        max = 1024,
                        value = 64)
        ),
        mainPanel(
            plotOutput("plot"),
            h3("Estimated Performance:"),
            textOutput("pred")
        )
    )
))
