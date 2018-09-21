#' sampleSizeIn
#'
#' Constructs a slider widget to select a sample size with the following defaults
#' \describe{
#' \item{\code{label}}{\emph{Sample size}}
#' \item{\code{min}}{30}
#' \item{\code{max}}{500}
#' \item{\code{value}}{100}
#' \item{\code{step}}{10}
#' }
#' 
#' @inheritParams shiny::sliderInput
#' @param log logical: use a log-scale (not implemented)
#'
#' @return an environment
#' @export
#'
#' @examples
#' sampleSizeIn('n', value=50)
sampleSizeIn <- function (inputId, label='Sample size', min=30, max=500, value=100, step=10, round = TRUE,
                          format = NULL, locale = NULL, ticks = TRUE, animate = FALSE,
                          width = NULL, sep = ",", pre = NULL, post = NULL, timeFormat = NULL,
                          timezone = NULL, dragRange = TRUE, log=FALSE) {
  args  <- as.list(match.call())
  fargs <- as.list(formals('sampleSizeIn'))
  for (arg in names(args)) fargs[[arg]] <- args[[arg]]
  fargs$log <- NULL
  do.call("sliderIn", fargs)
}