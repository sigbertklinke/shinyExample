library("shiny")

shinyUI(fluidPage(
  div(class="navbar navbar-static-top",
      div(class = "navbar-inner", 
          fluidRow(column(12, div(class = "brand pull-left", "PCA - Best line"))
          ))),
  sidebarLayout(
    sidebarPanel(
      sliderInput("angle", "Line angle (in degree)", 0, 180, 90),
      hr(),
      tableOutput("outputValues")
    ),
    mainPanel(plotOutput("outputPlot"))
  )
))