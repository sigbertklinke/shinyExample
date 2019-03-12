#' setSelection
#'
#' Set the \code{selectable} attribute of the internally stored data sets.
#'
#' @param name character: name of variable
#' @param is function: function which returns for a vector \code{TRUE} or \code{FALSE}
#'
#' @return nothing
#' @export
#'
#' @examples
#' library("MASS)
#' setData(BOSTON=Boston)
#' setSelection('var1', is.numeric)
setSelection <- function(name, is) {
  for (i in seq(length(mmstat$data))) {
    sel <- attr(mmstat$data[[i]], 'selectable') 
    if (is.null(sel)) { 
      sel  <- matrix(0, nrow=length(mmstat$data[[i]]), ncol=0)
      seln <- c()
    } else {
      seln <- colnames(sel)
    }
    sel <- cbind(sel, sapply(mmstat$data[[i]], is))
    colnames(sel) <- c(seln, name)
    attr(mmstat$data[[i]], 'selectable') <- sel 
  }
}