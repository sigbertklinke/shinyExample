#' getSelection
#'
#' Based on \code{selecttable} and a set of inputs 
#'
#' @param selectable logical matrix: \code{TRUE} in row i and col j means that variable i in input j can be selected 
#' @param input list of numeric vectors: list of wished input values
#' @param duplicates.ok logical: can variables be selected twice (default: \code{FALSE})
#'
#' @return a logical matrix with the entries 0 (var can not be selected), 1 (var can be selected) and 2 (var is selected)
#' @export
#'
#' @examples
#' sel <- cbind(c(FALSE,FALSE,TRUE,TRUE,FALSE), 
#'              c(TRUE,FALSE,TRUE,FALSE,TRUE), 
#'              c(TRUE,TRUE,FALSE,FALSE,TRUE))
#' getSelection(sel, list(1,1,1))
#' getSelection(sel, list(1,1,1), duplicates.ok=TRUE)
#' getSelection(sel, list(1,1,c(1,2,5)))
getSelection <- function(selectable, input, duplicates.ok=FALSE) {
  # selectable: col varsel, row datavar
  # 0=can not be selected
  # 1=can be selected  
  # 2=is selected (only in result)
  nvar <- nrow(selectable)
  ninp <- ncol(selectable)
  if (length(input)!=ninp) stop('input length does not fit')
  for (i in 1:length(input)) {
    if (is.character(input[[i]])) input[[i]] <- match(input[[i]], rownames(selectable)) 
  }
  newsel <- selectable
  for (i in 1:ninp) {
    for (j in 1:length(input[[i]])) {
      if (newsel[input[[i]][j],i]==1) newsel[input[[i]][j],i] <- 2
    }
  }
  if (!duplicates.ok) {
    # each variable is selected once
    for (i in 1:nvar) {
      pos <- which(newsel[i,] == 2)
      if (length(pos) > 1) newsel[i, pos[-1]] <- 0
      if (length(pos)) {
        newsel[i,]        <- 0
        newsel[i, pos[1]] <- 2
      }
    }
  }
  # ensure that each input has an input
  for (i in 1:ninp) {
    pos <- which(newsel[,i] == 2)
    if (length(pos) == 0) {
      pos1 <- which(newsel[,i] == 1)
      newsel[pos1[1], i] <- 2
    }
  }
  newsel
}