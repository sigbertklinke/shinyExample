#' str_call
#'
#' Constructs a function call from a name or a function and a list of arguments to be passed to it.
#'
#' @param func character: a non-empty character string naming the function to be called.
#' @param args list: a list of arguments to the function call. The names attribute of args gives the argument names.
#' @param lib character: name of library as prefix ot the function to be called (default: \code{NULL})
#'
#' @seealso \code{\link{do.call}}
#'
#' @return a text representation fo the function call
#' @export
#'
#' @examples
#' do.call('abs', list(x=-10))
#' str_call('abs', list(x=-10))
str_call <- function(func, args, lib=NULL) {
  nargs <- length(args)
  if (nargs>0) {
    targs    <- c()
    argnames <- names(args)
    ld       <- length(args)-length(argnames)
    if (ld>0) argnames <- c(argnames, rep('', ld))
    for (i in 1:length(args)) {
      #browser(expr=(argnames[i]=='choices'))
      carg <- class(args[[i]])
      if (carg=='call') {
        args[[i]] <- eval(args[[i]])
        carg <- class(args[[i]])
      }
      targ <- NULL
      name <- if (nchar(argnames[i])>0) paste0('"', argnames[i], '"=') else ''
#      print(args[[i]]); print(carg)
      if (carg=='NULL')      targ <- paste0(name, 'NULL')
      if (carg=='character') {
        if (length(args[[i]])==1) {
          targ <- paste0(name, '"', args[[i]], '"')
        } else {
          targ <- paste0(name, str_call('c', args[[i]]))      
        }
      }
      if (carg=='list') targ <- paste0(name, str_call('list', args[[i]]))
#      if (carg=='if')        targ <- paste0(name, paste(deparse(args[[i]]), collapse=" "))
      if (carg=='function')  targ <- paste0(name, paste(deparse(args[[i]]), collapse=" "))
      if (is.null(targ)) {
        if (length(args[[i]])==1) {
          targ <- paste0(name, as.character(args[[i]]))
        } else {
          targ <- paste0(name, str_call('c', args[[i]]))      
        }
      }
      #browser()
      targs <- c(targs, targ)
    }
    param <- paste0(targs, collapse=',\n')
  } else {
    param <- ''
  }
  ret <- paste0(if(is.null(lib)) '' else paste0(lib, '::'), func, '(', param, ')')
  class(ret) <- 'mmstat'
  ret
}
