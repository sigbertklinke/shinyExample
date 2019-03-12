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

#' template
#'
#' Replaces in text the terms \code{\{\{...\}\}} by the parameters given in \code{...}. 
#' Note that if the parameters contain \code{\{\{...\}\}} then it will \strong{not} be replaced recursively.
#'
#' @param text character: text in which is replaced
#' @param ... named list of parameters for replacing
#'
#' @return character: replaced text
#' @importFrom utils head tail
#' @export
#'
#' @examples
#' template('{{a}}+1', a='test')
template <- function (text, ...) {
  as_character <- function(obj) {
    if (is.null(obj)) return('NULL')
    as.character(obj)
  }
  #
  #browser()
  text <- paste(text, collapse="\n")
  g    <- gregexpr(pattern = '{{.*?}}', text, perl=TRUE)
  objs <- unique(unlist(regmatches(text, g)))
  objs <- substr(objs, 3, nchar(objs)-2)
  args <- flatten(list(...))
  for (obj in objs) {
    # either {{...}} or {{...::...}}
    sobj <- strsplit(obj, ':', fixed=TRUE)
    if (length(sobj[[1]])>2) {
      if (nchar(head(sobj[[1]], 1))) fname <- obj else fname <- tail(sobj[[1]], 1)
      # {{::...}} -> {{...}}
      if (nchar(tail(sobj[[1]], 1))) pname <- tail(sobj[[1]], 1) else stop(sprintf("unknown replacement '%s'", obj))
      replacement <- paste0(pname, ' <- ', 
                            paste0(deparse(eval(parse(text=fname))), collapse="\n"))
    } else {
      replacement <- if (is.null(args[[obj]])) '' else as.character(args[[obj]])
    }
    text <- gsub(sprintf('{{%s}}', obj), replacement, text, fixed=TRUE)
  }
  text
}
