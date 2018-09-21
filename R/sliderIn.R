#' sliderIn
#'
#' Constructs a slider widget to select a numeric value from a range. 
#'
#' @inheritParams shiny::sliderInput
#'
#' @return an environment
#' @export
#'
#' @examples
#' sliderIn('mean', 'Mean', -3, 3, 0, 0.1)
sliderIn <- function (inputId, label, min, max, value, step = NULL, round = FALSE,
                      format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                      width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                      timezone = NULL, dragRange = TRUE) {
  # error handling
  if (missing(inputId)) stop('"inputId" missing')
  if (missing(label)) stop('"label" missing')
  if (missing(min)) stop('"min" missing')
  if (missing(max)) stop('"max" missing')
  if (missing(value)) stop('"value" missing')
  #
  ui <- paste0("UI", inputId)
  add_ID(inputId, 'sliderInput')
  add_ID(ui, 'uiOutput')
  args  <- as.list(match.call())
  fargs <- formals(shiny::sliderInput)
  #
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  # handling label
  fargs$label <- paste0('getText("', eval(fargs$label), '")')
  class(fargs$label) <- 'huglawurza'
  newShiny('sliderInput',
           Id      = inputId,
           Value   = paste0('if(param=="input$', inputId, '") { if(is.null(val)||(val< ', min, ')||(val> ',  max, ')) return(', value ,') else return(val) }'),
           Server  = paste0('output$', ui, "<- renderUI({\n#RENDERUI\n", str_call('sliderInput', fargs, lib='shiny'), "\n})"),
           Sidebar = str_call('uiOutput', list(outputId=ui))
           )
}
