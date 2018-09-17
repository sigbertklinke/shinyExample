library(shiny)
library(shinydashboard)
library(shinyWidgets)



as.choices <- function(txt, inc) {
  ret        <- as.list(1:length(txt)[inc])
  names(ret) <- txt[inc]
  ret
}

ui <- dashboardPage(
  dashboardHeader(title="MM*Stat", titleWidth=, disable=FALSE),
  dashboardSidebar(collapsed=FALSE, width=, disable=FALSE,
                   uiOutput(outputId="UIr"),
                   uiOutput(outputId="UIn"),
                   shiny::tags$div(align="center",
                                   shiny::tags$hr(),
                                   shiny::tags$a(href = 'https://www.sigbertklinke.de', 'Created with shinyExample')
                   )
  ),
  dashboardBody(
    shiny::plotOutput(outputId="plot",
                      width="100%",
                      height="400px",
                      inline=FALSE)
  )
)

server <- function(input, output, session) {
  seed <- list(inBookmark=FALSE)
  
  onBookmark(function(state) {
    state$seed <- seed
  })
  
  onRestore(function(state) {
    seed <- state$seed
    seed$inBookmark <- TRUE
  })
  
  onRestored(function(state) {
    seed$inBookmark <- FALSE
  })
  
  value <- function(val) {
    param <- substitute(val)
    if(param=="input$r") { if(is.null(val)||(val< -1)||(val> 1)) return(0) else return(val) }
    if(param=="input$n") { if(is.null(val)||(val< 30)||(val> 500)) return(30) else return(val) }
    return(val)
  }
  
  output$plot <- shiny::renderPlot({
    #/media/local/sk/syncthing/projekte/R/shinyExample/inst/examples/app/correlation/corr.R
    library("mvtnorm")
    n <- value(input$n)
    r <- value(input$r)
    repeat{
      out <- rmvnorm(n, mean = c(0,0), sigma = matrix(c(1,r,r,1), ncol=2))
      rr  <- cor(out)[1,2]
      if (abs(rr-r)<0.002) break
    }
    plot(out, pch=19, xlim=c(-3,3), ylim=c(-3,3), asp=TRUE, axes=FALSE, xlab="x", ylab="y",
         main=sprintf("Korrelation: %.2f", rr), cex=1/log10(n))
    box()
  })
  output$UIr<- renderUI({
    shiny::sliderInput(inputId="r",
                       label="r",
                       min=-1,
                       max=1,
                       value=0,
                       step=0.01,
                       round=FALSE,
                       ticks=TRUE,
                       animate=FALSE,
                       sep=",",
                       dragRange=TRUE)
  })
  output$UIn<- renderUI({
    shiny::sliderInput(inputId="n",
                       label="n",
                       min=30,
                       max=500,
                       value=30,
                       step=10,
                       round=TRUE,
                       ticks=TRUE,
                       animate=FALSE,
                       sep=",",
                       dragRange=TRUE)
  })
}

shinyApp(ui, server)
