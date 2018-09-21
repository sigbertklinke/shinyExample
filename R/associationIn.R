#' associationIn
#'
#' Constructs a slider widget to select a association value with following defaults
#' \describe{
#' \item{\code{min}}{0}
#' \item{\code{max}}{+1}
#' \item{\code{value}}{0}
#' \item{\code{step}}{0.01}
#' }
#'
#' @inheritParams shiny::sliderInput
#'
#' @return an environment
#' @export
#'
#' @examples
#' associationIn('r', value=0)
associationIn <- function (inputId, label='Association', min=0, max=+1, value=0, step=0.01, 
                              round = FALSE, format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                              width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                              timezone = NULL, dragRange = TRUE) {
  args  <- as.list(match.call())
  fargs <- as.list(formals('associationIn'))
  for (arg in names(args)) fargs[[arg]] <- args[[arg]]
  do.call("sliderIn", fargs)
}
