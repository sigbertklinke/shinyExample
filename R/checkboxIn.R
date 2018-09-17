#' checkboxIn
#'
#' Creates a checkbox element, for more details see \code{\link[shiny]{checkboxInput}}.
#'
#' @param inputId character: name of checkbox element
#' @param label character: label of input element
#' @param value logical: start value (default: \code{FALSE})
#' @param width numeric: width of input element
#'
#' @return a checkbox for use into \code{\link{makeShinyApp}}
#' @export
#'
#' @examples
#' checkbox('rug', 'Show observations')
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
  ret         <- new.env()
  ret$Id      <- inputId
  ret$Value   <- paste0('if(param=="input$', inputId, '") { if(is.null(val)) return(', value ,') else return(val) }')
  ret$Server  <- paste0('output$', ui, "<- renderUI({\n#RENDERUI\n", str_call('checkboxInput', fargs, lib='shiny'), "\n})")
  ret$Sidebar <- str_call('uiOutput', list(outputId=ui))
  class(ret)  <- c('checkboxInput', 'shiny')
  ret
}