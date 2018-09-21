#' Variable selection functions
#'
#' \itemize{
#'   \item \code{is.true} for any variable it returns \code{TRUE}, default at \code{\link{varIn}}
#'   \item \code{is.numeric} see \code{\link[base]{is.numeric}}
#'   \item \code{is.integer} see \code{\link[base]{is.integer}}
#'   \item \code{is.factor} see \code{\link[base]{is.factor}}
#'   \item \code{is.ordered} see \code{\link[base]{is.ordered}}
#'   \item \code{is.binary} returns \code{TRUE} if \code{x} takes only two values
#' }
#'   
#' @param x vector: variable values
#'
#' @return logical: if \code{x} fulfills the requirement 
#' @export
#'
#' @examples
#' sapply(mtcars, is.true)
#' sapply(mtcars, is.binary)
is.true <- function(x) { return(TRUE) }

##' @rdname is.true
##' @export
is.binary <- function(x) { (length(unique(x))==2) }