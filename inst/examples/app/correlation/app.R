library(shiny)
library(shinydashboard)
library(shinyWidgets)



# language support
translations <- 
  function (path = ".") 
  {
    po <- new.env()
    po$local <- (Sys.getenv("SHINY_PORT") == "")
    po$files <- list.files(path = path, pattern = "*.po$", full.names = TRUE)
    po$msgs <- list()
    po$stats <- list(count = numeric())
    po$sel <- 0
    if (length(po$files)) {
      for (i in seq(po$files)) {
        pon <- sapply(strsplit(po$files[i], ".", fixed = T), 
                      function(elem) {
                        elem[1]
                      })
        msg <- paste(readLines(paste(path, po$files[i], sep = "/")), 
                     collapse = " ")
        msgid <- regmatches(msg, gregexpr("msgid\\s*\".*?\"", 
                                          msg))
        tmp <- strsplit(msgid[[1]], "\"")
        msgid <- sapply(tmp, function(vec) {
          paste0(vec[2:length(vec)])
        })
        msgstr <- regmatches(msg, gregexpr("msgstr\\s*\".*?\"", 
                                           msg))
        tmp <- strsplit(msgstr[[1]], "\"")
        msgstr <- sapply(tmp, function(vec) {
          paste0(vec[2:length(vec)])
        })
        po$msgs[[pon]] <- list(id = msgid, str = msgstr)
        po$stats$count[msgid] <- 0
        po$stats[[pon]] <- msgid
      }
      po$sel <- 1
    }
    return(po)
  }
pomessages <- translations()

getText <- 
  function (msg) 
  {
    po <- get("pomessages")
    if (po$local) {
      po$stats$count[msg] <- po$stats$count[msg] + 1
      po$stats$count[msg][is.na(po$stats$count[msg])] <- 1
    }
    if (po$sel == 0) 
      return(msg)
    ret <- msg
    pos <- match(msg, po$msgs[[po$sel]]$id)
    ind <- (1:length(pos))[!is.na(pos)]
    ret[ind] <- po$msgs[[po$sel]]$str[pos[ind]]
    return(ret)
  }

as.choices <- 
  function (txt, inc = NULL) 
  {
    if (is.null(inc)) 
      inc <- rep(TRUE, length(txt))
    ret <- as.list((1:length(txt))[inc])
    names(ret) <- txt[inc]
    ret
  }

ui <- dashboardPage(
  dashboardHeader(title="MM*Stat", titleWidth=, disable=FALSE),
  dashboardSidebar(collapsed=FALSE, width=, disable=FALSE,
                   uiOutput("outputId"="UIr"),
                   uiOutput("outputId"="UIn"),
                   shiny::tags$div(align="center",
                                   shiny::tags$hr(),
                                   shiny::tags$a(href = 'https://www.sigbertklinke.de', 'Created with shinyExample'),
                                   shiny::tags$br(),
                                   shiny::tags$a(target="_blank", href="https://www.wihoforschung.de/de/flipps-1327.php",  'Supported by BMBF')
                   )
  ),
  dashboardBody(
    shiny::plotOutput("outputId"="plot",
                      "width"="100%",
                      "height"="400px",
                      "inline"=FALSE)
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
  
  onStop(function() {
    po <- get('pomessages')
    if (po$local) cat(sprintf('gettext("%s"); # %.0f\n', names(po$stats$count), po$stats$count))
  })
  
  value <- function(val) {
    param <- substitute(val)
    if(param=="input$r") { if(is.null(val)||(val< -1)||(val> 1)) return(0) else return(val) }
    if(param=="input$n") { if(is.null(val)||(val< 30)||(val> 500)) return(100) else return(val) }
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
    #RENDERUI
    shiny::sliderInput("inputId"="r",
                       "label"=getText("Correlation (r)"),
                       "min"=-1,
                       "max"=1,
                       "value"=0,
                       "step"=0.01,
                       "round"=FALSE,
                       "format"=NULL,
                       "locale"=NULL,
                       "ticks"=TRUE,
                       "animate"=FALSE,
                       "width"=NULL,
                       "sep"=",",
                       "pre"=NULL,
                       "post"=NULL,
                       "timeFormat"=NULL,
                       "timezone"=NULL,
                       "dragRange"=TRUE)
  })
  output$UIn<- renderUI({
    #RENDERUI
    shiny::sliderInput("inputId"="n",
                       "label"=getText("Sample size"),
                       "min"=30,
                       "max"=500,
                       "value"=100,
                       "step"=10,
                       "round"=TRUE,
                       "format"=NULL,
                       "locale"=NULL,
                       "ticks"=TRUE,
                       "animate"=FALSE,
                       "width"=NULL,
                       "sep"=",",
                       "pre"=NULL,
                       "post"=NULL,
                       "timeFormat"=NULL,
                       "timezone"=NULL,
                       "dragRange"=TRUE)
  })
}

shinyApp(ui, server)
