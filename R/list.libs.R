#' list.libs
#'
#' Collects all parameters \code{\link[base]{library}} and \code{\link[base]{require}} commands in a 
#' set of (R) files. In case that the parsing of a file fails a warning with the error message(s) will be 
#' displayed.
#'
#' @inheritParams base::list.files
#' @param quiet logical: display the files analysed
#'
#' @return a table with \code{\link[base]{library}} and \code{\link[base]{require}} calls including frequencies
#' @importFrom utils installed.packages
#' @export
#'
#' @examples
#' list.libs(path=find.package("shinyExample"))
#' \dontrun{
#'   # install missing libraries
#'   eval(parse(text=attr(ll, "install"))) 
#'   # load all libraries
#'   eval(parse(text=attr(ll, "library")))
#' }
list.libs <- function (path = ".", pattern ="*.R$", all.files = FALSE,
                       full.names = TRUE, recursive = TRUE,
                       ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE,
                       quiet=FALSE) {
  exprapply <- function(e, depth) {
    #print(paste(depth, e))
    ret <- c()
    if ('expression' %in% class(e)) {
      for (i in seq(e)) {
        ei  <- as.character(e[[i]])
        #print(ei)
        if (ei[1] %in% c('library', 'require')) {
          ret <- c(ret, ei[-1]) 
        } else {
          ret <- c(ret, exprapply(e[[i]], depth+1))     
        }
      }
    }
    ret
  }
  #
  lof <- list.files(path=path, pattern=pattern, all.files=all.files, full.names=full.names, 
                    recursive=recursive, ignore.case=ignore.case, include.dirs=include.dirs, 
                    no..=no..)
  libs <- c()
  for (fn in lof) {
    if (!quiet) cat(fn, "\n")
    pfn  <- try(parse(fn), silent=TRUE)
    if (class(pfn)=='try-error') {
      warning(sprintf("%s: parse failed, file ignored\n%s", fn, geterrmessage()))
    } else libs <- c(libs, exprapply(pfn, 0))
  }
  tab  <- table(libs)
  mpkg <- setdiff(names(tab), installed.packages()[,1])
  attr(tab, 'install') <- paste0('install.packages("', mpkg, '")', collapse="\n")
  attr(tab, "library") <- paste0('library("', names(tab), '")', collapse="\n")
  tab
}