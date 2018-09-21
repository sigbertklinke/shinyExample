#' confidenceLevelIn
#'
#' Constructs a slider to select a confidence level with following defaults:
#' \describe{
#' \item{\code{label}}{if \code{percent==TRUE} then \emph{Confidence level (%)} else \emph{Confidence level}}
#' \item{\code{min}}{if \code{percent==TRUE} then \emph{80} else \emph{0.8}}
#' \item{\code{max}}{if \code{percent==TRUE} then \emph{99.99} else \emph{0.999}}
#' \item{\code{value}}{if \code{percent==TRUE} then \emph{95} else \emph{0.95}}
#' \item{\code{step}}{if \code{percent==TRUE} then \emph{0.1} else \emph{0.001}}
#' }
#' 
#' @inheritParams shiny::sliderInput
#' @param percent logical: use 95 or 0.95 (default: FALSE)

#' @return an environment
#' @export
#'
#' @examples
#' confidenceLevelIn('cl')
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
