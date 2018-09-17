#' sampleSizeIn
#'
#' Constructs a slider widget to select a sample size. For the not documented parameters see \code{\link[shiny]{sliderInput}}
#'
#' @param inputId character: The input slot that will be used to access the value.
#' @param label character: Display label for the control, or \code{NULL} for no label.
#' @param min numeric: The minimum value (inclusive) that can be selected (default: 30)
#' @param max numeric: The maximum value (inclusive) that can be selected (default: 1000)
#' @param value numeric: The initial value of the slider
#' @param step numeric: Specifies the interval between each selectable value on the slider (if NULL, a heuristic is used to determine the step size, default: 10) 
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
#' @param percent logical: use 95 or 0.95 (default: FALSE)
#'
#' @return
#' @export
#'
#' @examples
#' sampleSizeIn('n', value=50)
sampleSizeIn <- function (inputId, label, min, max, value, step, round = TRUE,
                          format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                          width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                          timezone = NULL, dragRange = TRUE, log=FALSE) {
  args  <- as.list(match.call())
  fargs <- as.list(formals('sampleSizeIn'))
  for (arg in names(args)) fargs[[arg]] <- args[[arg]]
  fargs$log <- NULL
  do.call("sliderIn", fargs)
}