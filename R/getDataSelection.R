#' getSelectionAttr
#'
#' Returns the matrix attribute \code{selectable} which variables are selectable from data matrix in \code{mmstat}. If the attribute does not exists then 
#' a matrix is returned such that all variables are selectable
#'
#' @param dindex numeric: index of data set
#'
#' @return natrix
#' @export
#'
#' @examples
getSelectionAttr <- function(dindex) {
  ret <- attr(mmstat$data[[dindex]], 'selectable')
  if (is.null(ret)) { # no variables selected
    ret <- matrix(TRUE, ncol=1, nrow=length(mmstat$data[[dindex]]))
    rownames(ret) <- names(mmstat$data[[dindex]])
    colnames(ret) <- 'all'
  }
  ret
}

#' getDataSelection
#'
#' Returns a vector or data frame from the internally stored datasets in \code{mmstat}. 
#'
#' @param dindex numeric: index for data set
#' @param ... numeric: index of variables in the data set, if not given the whole data frame is returned
#' @param simplify logical: simplify the set of selected variables (default: \code{TRUE}) 
#'
#' @return a vector, a data frame or a list of data frames depending on \code{simplify}
#' @export
#'
#' @examples
#' \dontrun{getDataSelection(1)}
getDataSelection <- function (dindex, ..., simplify=TRUE) {
  sattr  <- getSelectionAttr(dindex)
  sel    <- getSelection(sattr, as.list(...))
  nsel   <- ncol(sel)
  ret    <- list()
  for (i in 1:nsel) {
    ret[[i]] <- as.data.frame(mmstat$data[[dindex]][, which(sel[,i]==2)]) 
    attr(ret[[i]], 'varnames') <- names(mmstat$data[[dindex]])[which(sel[,i]==2)] 
  }
  if (simplify) {
    if (nsel>1) {
      retdf <- ret[[1]]
      for (i in 2:nsel) retdf <- cbind(retdf, ret[[i]])
      ret   <- retdf
    } else {
      varn <- attr(ret[[1]], 'varnames')
      ret  <- ret[[1]][,1]
      attr(ret, 'varnames') <- varn
    }
  }
  attr(ret, 'selectable') <- sattr
  ret
}
