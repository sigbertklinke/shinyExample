library(shiny)
library(shinydashboard)
library(shinyWidgets)

data <- readRDS("mmstat.RDS")
choicesdata <- names(data)
varTypevar1 <- .Primitive("is.numeric")
choiceslang <- c("German",
"English")

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
    uiOutput("outputId"="UIbreaks"),
uiOutput("outputId"="UIrug"),
uiOutput("outputId"="UIdata"),
uiOutput("outputId"="UIvar1"),
uiOutput("outputId"="UIlang"),
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
    if(param=="input$breaks") { if(is.null(val)||(val< 1)||(val> 50)) return(30) else return(val) }
if(param=="input$rug") { if(is.null(val)) return(FALSE) else return(val) }
if(param=="input$data") { if(is.null(val)) return(1) else return(as.numeric(val)) }
if(param=="input$var1") { if(is.null(val)) return(1) else return(as.numeric(val)) }
if(param=="input$lang") { if(is.null(val)) return(1) else return(as.numeric(val)) }
    return(val)
  }

  output$plot <- shiny::renderPlot({
#/media/local/sk/syncthing/projekte/R/shinyExample/inst/examples/app/histogram/hist.R
x <- data[[value(input$data)]][,value(input$var1)]
hist(x, breaks=seq(min(x), max(x), length.out=value(input$breaks)+1),
     sub=sprintf("Data: %.0f, Var: %.0f", value(input$data), value(input$var1)),
     main=value(input$lang))
if (value(input$rug)) rug(x)
})
output$UIbreaks<- renderUI({
#RENDERUI
shiny::sliderInput("inputId"="breaks",
"label"=getText("Number of bins"),
"min"=1,
"max"=50,
"value"=30,
"step"=NULL,
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
output$UIrug<- renderUI({
#RENDERUI
shiny::checkboxInput("inputId"="rug",
"label"=getText("Show observations"),
"value"=FALSE,
"width"=NULL)
})
output$UIdata<- renderUI({
#RENDERUI
shiny::selectInput("inputId"="data",
"label"=getText("Choose data set"),
"choices"=as.choices(choicesdata),
"selected"=NULL,
"multiple"=FALSE,
"selectize"=TRUE,
"width"=NULL,
"size"=NULL)
})
output$UIvar1<- renderUI({
#RENDERUI
inc<-sapply(data[[value(input$data)]], varTypevar1)
shiny::selectInput("inputId"="var1",
"label"=getText("Choose variable"),
"choices"=as.choices(names(data[[value(input$data)]]), inc),
"selected"=NULL,
"multiple"=FALSE,
"selectize"=TRUE,
"width"=NULL,
"size"=NULL)
})
output$UIlang<- renderUI({
#RENDERUI
shiny::selectInput("inputId"="lang",
"label"=getText("Select language"),
"choices"=as.choices(choiceslang),
"selected"=NULL,
"multiple"=FALSE,
"selectize"=TRUE,
"width"=NULL,
"size"=NULL)
})
}

shinyApp(ui, server)
