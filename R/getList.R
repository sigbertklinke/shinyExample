#' getList
#'
#' Creates a list with element names replaced by \code{link{getText}}.
#'
#' @param ... named elements of a list
#'
#' @return renamed list
#' @export
#'
#' @examples
#' getList(BOSTON=1, MTCARS=2)
getList <- function(...) {
  args <- list(...)
  names(args) <- getText(names(args))
  args
}