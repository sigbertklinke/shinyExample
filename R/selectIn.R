#' selectIn
#'
#' Constructs a text selection input element.
#'
#' @inheritParams shiny::selectInput
#'
#' @return an environment
#' @export
#'
#' @examples
#' selectIn('lang', 'Choose', c('German', 'English'))
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
  ret           <- newShiny('selectInput',
                            Id      = inputId,
                            Global  = paste0('choices', inputId, ' <- ', str_call('c', choices)),
                            Server  = paste0('output$', ui, "<- renderUI({\n#RENDERUI\n", str_call('selectInput', fargs, lib='shiny'), "\n})"),
                            Sidebar = str_call('uiOutput', list(outputId=ui))
                            )
  if (is.null(selected)) {
    choices     <- eval(choices)
    ret$Value   <- paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(1) else return(as.numeric(val)) }')
  } else {
    ret$Value   <- paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(', selected, ') else return(as.numeric(val)) }')
  }
  ret
}
