#' confidenceLevelIn
#'
#' Constructs a slider to select a confidence level. For the undocumented parameters see \code{\link[shiny]{sliderInput}}
#'
#' @param inputId 
#' @param label character: if \code{percent==TRUE}  \emph{Confidence level (%)} else \emph{Confidence level}
#' @param min numeric: if \code{percent==TRUE}  \emph{80} else \emph{0.8}
#' @param max numeric:  if \code{percent==TRUE}  \emph{99.99} else \emph{0.999}
#' @param value numeric: if \code{percent==TRUE}  \emph{95} else \emph{0.95}
#' @param step numeric: if \code{percent==TRUE}  \emph{0.1} else \emph{0.001}
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
#' confidenceLevelInput('cl')
confidenceLevelIn <- function (inputId, label, min, max, value, step, round = FALSE,
                                  format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                                  width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                                  timezone = NULL, dragRange = TRUE, percent=FALSE) {
  if (percent) {
    if (missing(label)) label <- 'Confidence level (%)'
    if (missing(min))   min   <- 80.0
    if (missing(max))   max   <- 99.9
    if (missing(value)) value <- 95.0
    if (missing(step))  step  <- 0.1
    ret <- sliderIn(inputId, label, min, max, value, step, round , format, locale, ticks, animate,
                    width, sep, pre, post, timeFormat, timezone, dragRange)
  } else {
    if (missing(label)) label <- 'Confidence level'
    if (missing(min))   min   <- 0.8
    if (missing(max))   max   <- 0.999
    if (missing(value)) value <- 0.95
    if (missing(step))  step  <- 0.001
    ret <- sliderIn(inputId, label, min, max, value, step, round , format, locale, ticks, animate,
                    width, sep, pre, post, timeFormat, timezone, dragRange)
  }
  ret
}
