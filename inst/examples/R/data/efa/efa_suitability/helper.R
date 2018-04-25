matplot <- function(mat, ...) {
  require("plotrix")
  color2D.matplot(mat, ...)
  nmat <- colnames(pr)
  if (!is.null(nmat)) axis(1, at=seq(nrow(mat))-0.5, labels=nmat)
  nmat <- rownames(pr)
  if (!is.null(nmat)) axis(2, at=seq(nrow(mat))-0.5, labels=nmat)
}