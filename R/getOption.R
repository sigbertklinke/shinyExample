#' getOption
#'
#' Allow the user to examine a variety of global options which affect the way in which R computes and displays its results.
#' An option of the form '\strong{m}mstat.\strong{c}ol.\strong{p}opulation' can be examined by the short form 'mcp' if unique.
#'
#' @inheritParams base::getOption
#'
#' @return The current value set for option x, or NULL if the option is unset.
#' @export
#'
#' @examples
#' getOption('mmstat.col.population')
#' getOption('mcp')
getOption <- function (x, default=NULL) {
  aopt <- abbreviatedOptions()
  pos  <- which(aopt==x)
  n    <- if (length(pos)) names(aopt)[pos] else x
  ret  <- base::getOption(n, default)       
  names(ret) <- n
  ret
}

#' abbreviatedOptions
#'
#' Returns the short forms for all global options.
#'
#' @return a character vector with full and abbreviated option names
#' @export
#'
#' @examples
#' abbreviatedOptions()
abbreviatedOptions <- function() {
  onames  <- names(.Options)
  snames  <- strsplit(names(.Options), '.', fixed=TRUE)
  anames  <- sapply(snames, function(e) { paste0(substring(e, 1, 1), collapse='') })
  dups    <- duplicated(anames) | duplicated(anames,fromLast = TRUE) 
  ret     <- anames[!dups]
  names(ret) <- onames[!dups] 
  ret
}