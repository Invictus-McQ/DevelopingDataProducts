library(shiny)
library(shinythemes)
library(DT)

function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  output$mytable <- DT::renderDataTable({
    DT::datatable(head(mtcars[, c(input$xcol, input$ycol)], 4))})

  output$plot1 <- renderPlot({
    palette(c( "#8DD3C7", "#FFFFB3", "#BEBADA", "#FB8072",
               "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })}