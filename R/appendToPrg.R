#' appendToPrg 
#'
#' Checks for each named element of list \code{left} if exists in the list \code{right} and appends the elements of \code{left}.
#'
#' @param left list
#' @param right list
#'
#' @return the merged list
#' @export
#'
#' @examples
#' l <- list(a=1, b=2)
#' r <- list(a=1, c=3)
#' # Note the r$c is NOT overtaken into the result
#' appendToPrg(l, r)
appendToPrg <- function (left, right) {
  #browser()
  for (ln in names(left)) {
    if (!is.null(right[[ln]])) left[[ln]] <- c(left[[ln]], right[[ln]])
  }
  left
}