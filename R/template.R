#' template
#'
#' Replaces in text the terms \code{\{\{...\}\}} by the parameters given in \code{...}. Either a \code{text} or \code{file} must be given.  
#'
#' @param text character: text in which is replaced
#' @param file character: name fo file 
#' @param ... list of parameeter for replacing
#'
#' @return character: replaced text
#' @export
#'
#' @examples
#' template(text='{{a}}+1', a='test')
template <- function (text=NULL, file=NULL, ...) {
  as_character <- function(obj) {
    if (is.null(obj)) return('NULL')
    as.character(obj)
  }
  if (is.null(text)) {
    if (is.null(file)) stop('Either "file" or "text" must be set')
    text <- readLines(file)
  }
  text <- paste(text, collapse="\n")
  g    <- gregexpr(pattern = '{{.*?}}', text, perl=TRUE)
  objs <- unique(unlist(regmatches(text, g)))
  objs <- substr(objs, 3, nchar(objs)-2)
  args <- flatten(list(...))
  for (obj in objs) {
    replacement <- if (is.null(args[[obj]])) '' else as.character(args[[obj]])
    text <- gsub(sprintf('{{%s}}', obj), replacement, text, fixed=TRUE)
  }
  text
}
