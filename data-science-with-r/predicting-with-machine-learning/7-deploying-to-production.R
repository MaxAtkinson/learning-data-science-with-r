# Shiny - layout/widget based framework for deploying R applications

library(shiny)
library(RColorBrewer)
library(tree)

setwd("~/dev/r/predicting-with-machine-learning/")
load("Train.RData")
load("Tree.RData")
palette <- brewer.pal(3, "Set2")

ui <- fluidPage(
  titlePanel("Iris Species Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "petal.length",
        label = "Petal Length (cm)",
        min = 1,
        max = 7,
        value = 4
      ),
      sliderInput(
        inputId = "petal.width",
        label = "Petal Width (cm)",
        min = 0.0,
        max = 2.5,
        step = 0.5,
        value = 1.5
      )
    ),
    mainPanel(
      textOutput(outputId = "text"),
      plotOutput(outputId = "plot")
    )
  )
)

server <- function(input, output) {
  output$text = renderText({
    # df has 4 cols, one row
    predictors <- data.frame(
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width,
      Sepal.Length = 0,
      Sepal.Width = 0
    )
    
    # Make prediction
    prediction = predict(
      object = model,
      newdata = predictors,
      type = "class"
    )
    
    # Create prediction text
    paste("Predicted: ", as.character(prediction))
  })

  output$plot = renderPlot({
    plot(
      x = iris$Petal.Length,
      y = iris$Petal.Width,
      pch = 19,
      col = palette[as.numeric(iris$Species)],
      main = "Iris Petal Length vs. Width",
      xlab = "Petal Length (cm)",
      ylab = "Petal Width (cm)"
    )
    
    partition.tree(
      model,
      label = "Species",
      add = TRUE
    )
    
    points(
      x = input$petal.length,
      y = input$petal.width,
      col = "red",
      pch = 4,
      cex = 2,
      lwd = 2
    )
  })
}

shinyApp(ui = ui, server = server)

