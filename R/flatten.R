#' flatten
#'
#' Flattens recursively a nested list to a simple list.
#'
#' @param lst list: nested list
#' @param prefix character: prefix  (default: '')
#' @param sep character: separator for list elements (default: '$')
#'
#' @return simplified list
#' @export
#'
#' @examples
#' flatten(list(a=1, b=list(c=2, d=3)))
flatten <- function(lst, prefix='', sep='$') {
  ret   <- list()
  names <- names(lst)
  index <- 1:length(lst)
  if (nchar(prefix)) names <- paste(prefix, names, sep=sep)
  for (i in index) {
    if (is.list(lst[[i]])) {
      rlst <- flatten(lst[[i]], names[[i]])
      ret  <- c(ret, rlst)
    } else{
      ret[[names[i]]] <- lst[[i]]
    }
  }
  ret
}
