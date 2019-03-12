#' setData
#'
#' To store data sets in the library internal object \code{mmstat}.
#'
#' @param ... named list of data sets
#'
#' @return invisibly the names of all stored data sets
#' @export
#'
#' @examples
#' library("MASS)
#' setData(BOSTON=Boston)
setData <- function(...) {
  mmstat$data <- list(...)
  invisible(names(mmstat$data))
}