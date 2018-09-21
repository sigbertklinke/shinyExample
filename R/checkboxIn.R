#' checkboxIn
#'
#' Creates a checkbox element.
#'
#' @inheritParams shiny::checkboxInput
#'
#' @return an environment
#' @export
#'
#' @examples
#' checkboxIn('rug', 'Show observations')
checkboxIn <- function (inputId, label, value = FALSE, width = NULL) {
  # error handling
  if (missing(inputId)) stop('"inputId" missing')
  if (missing(label)) stop('"label" missing')
  #
  #browser()
  ui <- paste0("UI", inputId)
  add_ID(inputId, 'checkboxInput')
  add_ID(ui, 'uiOutput')
  args  <- as.list(match.call())
  fargs <- formals(shiny::checkboxInput)
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  fargs$label <- paste0('getText("', eval(fargs$label), '")')
  class(fargs$label) <- 'huglawurza!'
  newShiny('checkboxInput',
           Id      = inputId,
           Value   = paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(', value ,') else return(val) }'),
           Server  = paste0('output$', ui, "<- renderUI({\n#RENDERUI\n", str_call('checkboxInput', fargs, lib='shiny'), "\n})"),
           Sidebar = str_call('uiOutput', list(outputId=ui))
  )
}