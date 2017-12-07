library(shiny)
library(shinythemes)
library(DT)

fluidPage(theme = shinytheme("lumen"),
          
pageWithSidebar(
  headerPanel('MTCARS k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(mtcars[c(1, 3:7)]), 
                selected=names(mtcars)[[1]]),
    selectInput('ycol', 'Y Variable', names(mtcars[c(1, 3:7)]),
                selected=names(mtcars)[[3]]),
    numericInput('clusters', 'Number of Clusters', 3,
                 min = 1, max = 8)
  ),
  mainPanel(
    DT::dataTableOutput("mytable"),
    plotOutput('plot1')
    
  )
)
)
