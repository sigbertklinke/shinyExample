#' dataMake
#'
#' Creates a list of data sets (only data frames are allowed!) and saves them to a file. These file(s) can be used in \code{\link{dataIn}}. 
#'
#' @param file character: name of RDS file
#' @param ... list of named(!) data set(s) 
#'
#' @return nothing
#' @export
#' @importFrom utils capture.output str
#'
#' @examples
#' dataMake('MA.rds', MotorTrend=mtcars, AndersonIris=iris)
dataMake <- function(file, ...) {
  if (file.exists(file)) warning(sprintf('file "%s" will be overwritten', file))
  args  <- list(...)
  nargs <- names(args)
  obj   <- list()
  allowed <- c('data.frame')
  for (i in 1:length(args)) {
    if (nchar(nargs[i])) {
      if (!any(allowed %in% class(args[[i]]))) {
        warning(sprintf('data set "%s" has wrong type: ignored', nargs[[i]]))  
      } else {
        obj[[nargs[i]]] <- args[[i]]
      }
    } else {
      sout <- capture.output(str(args[[i]]))
      warning("unnamed data set\n", sout)
    }
  }
  saveRDS(obj, file=file)
  str(obj)
}