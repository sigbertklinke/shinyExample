#' toInt
#' 
#' Converts \code{x} to an integer. 
#' If the conversion fails or the integer is outside \code{min} and \code{max} then \code{NA_integer_} is returned
#'
#' @param x input object
#' @param min numeric: minimal value
#' @param max numeric: maximal value
#'
#' @return a single integer value
#' @export
#'
#' @examples
#' toInt(3.0)
#' toInt("3.0")
#' toInt("test")
toInt <- function(x, min=-Inf, max=+Inf) {
  x <- suppressWarnings(as.integer(x))
  if (length(x)!=1) return(NA_integer_)
  if(is.na(x)) return(NA_integer_)
  if (x<min) return(NA_integer_)  
  if (x>max) return(NA_integer_)  
  x
}

#' toNum
#'
#' Converts \code{x} to a numeric. 
#' If the conversion fails or the value is outside \code{min} and \code{max} then \code{NA} is returned
#'
#' @param x input object
#' @param min numeric: minimal value
#' @param max numeric: maximal value
#'
#' @return a single integer value
#' @export
#'
#' @examples
#' toNum(3.0)
#' toNum("3.0")
#' toNum("test")
toNum <- function(x, min=-Inf, max=+Inf) {
  x <- suppressWarnings(as.numeric(x))
  if (length(x)!=1) return(NA)
  if(is.na(x)) return(NA)  
  if (x<min) return(NA)  
  if (x>max) return(NA)
  x 
}

#' toLog
#'
#' Converts \code{x} to a logical. If the conversion fails \code{NA} is returned.
#' 
#' @param x input object
#'
#' @return a single logical value
#' @export
#'
#' @examples
#' toLog(3.0)
#' toLog("T")
#' toLog("test")
toLog <- function(x) {
  x <- suppressWarnings(as.logical(x))
  if (length(x)!=1) NA else x
}