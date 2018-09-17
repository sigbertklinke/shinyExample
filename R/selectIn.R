#' sliderIn
#'
#' Constructs a slider widget to select a numeric value from a range. For the not documented parameters see \code{\link[shiny]{sliderInput}}
#'
#' @param inputId
#' @param label
#' @param min
#' @param max
#' @param value
#' @param step
#' @param round
#' @param format
#' @param locale
#' @param ticks
#' @param animate
#' @param width
#' @param sep
#' @param pre
#' @param post
#' @param timeFormat
#' @param timezone
#' @param dragRange
#'
#' @return
#' @export
#'
#' @examples
#' selectIn('mean', 'Mean', -3, 3, 0, 0.1)
as.choices <- function(txt, inc=NULL) {
  if (is.null(inc)) inc <- rep(TRUE, length(txt))
  ret        <- as.list((1:length(txt))[inc])
  names(ret) <- txt[inc]
  ret
}
#
selectIn <- function (inputId, label, choices, selected = NULL, multiple = FALSE,
                      selectize = TRUE, width = NULL, size = NULL) {
  # error handling
  if (missing(inputId)) stop('"inputId" missing')
  if (missing(label)) stop('"label" missing')
  if (missing(choices)) stop('"choices" missing')
  #
  ui <- paste0("UI", inputId)
  add_ID(inputId, 'selectInput')
  add_ID(ui, 'uiOutput')
  args  <- as.list(match.call())
  fargs <- formals(shiny::selectInput)
  #
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  # handling label & choices
  choices <- eval(fargs$choices)
  if (!is.null(names(choices))) choices <- names(choices) 
  fargs$choices <- paste0('as.choices(choices', inputId, ')')
  class(fargs$choices) <- 'huglawurza'  
  #
  fargs$label <- paste0('getText("', eval(fargs$label), '")')
  class(fargs$label) <- 'huglawurza'
  #
  ret           <- newShiny('selectInput')
  ret$Id        <- inputId
  ret$Global    <- paste0('choices', inputId, ' <- ', str_call('c', choices))
  if (is.null(selected)) {
    choices     <- eval(choices)
    ret$Value   <- paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(1) else return(as.numeric(val)) }')
  } else {
    ret$Value   <- paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(', selected, ') else return(as.numeric(val)) }')
  }
  ret$Server  <- paste0('output$', ui, "<- renderUI({\n#RENDERUI\n", str_call('selectInput', fargs, lib='shiny'), "\n})")
  ret$Sidebar <- str_call('uiOutput', list(outputId=ui))

  ret
}
