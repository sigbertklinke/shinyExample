#' getMMstat
#'
#' Allows to access the package internal \code{mmstat} environment. 
#'
#' @param ... elements
#'
#' @return the choosen element
#' @export
#'
#' @examples
#' getMMstat('version')
getMMstat <- function (...) {
  ret  <- mmstat
  args <- list(...)
  for (i in seq(args)) ret <- ret[[args[[i]]]]
  ret
}

# not yet used anywhere
setMMstat <- function (...) {
  ret  <- mmstat
  args <- list(...)
  for (i in 1:(length(args)-1)) ret <- ret[[args[[i]]]]
  ret <- args[[length(args)]]
}