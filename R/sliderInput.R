#' sliderInput
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
#' sliderInput('mean', 'Mean', -3, 3, 0, 0.1)
sliderInput <- function (inputId, label, min, max, value, step = NULL, round = FALSE,
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
  eargs <- list()
  for (arg in names(fargs)) {
    if (arg!='...') {
      eargs[[arg]] <- if(is.null(args[[arg]])) fargs[[arg]] else args[[arg]]
      if (class(eargs[[arg]])=='if') eargs[[arg]] = eval(eargs[[arg]])
    }
  }
  if ('...' %in%  names(fargs)) {
    ellipsis <- list(...)
    for (arg in names(ellipsis)) eargs[[arg]] <- ellipsis[[arg]]
  }
  ret <- list(Id=inputId,
              Server=paste0('output$', ui, "<- renderUI({\n", str_call(args[[1]], eargs, lib='shiny'), "\n})"),
              Sidebar=str_call('uiOutput', list(outputId=ui)))
  class(ret) <- c(args[[1]], 'shiny')
  ret
}
