#' selectLanguage
#'
#' Choose a language.
#'
#' @param index integer: number of language to use 
#'
#' @return invisibly the selected language
#' @export
#'
#' @examples
#' selectLanguage(1)
selectLanguage <- function(index) {
  index <- as.integer(index)
  if (index %in% seq(mmstat$lang)) mmstat$lang$sel <- index 
  invisible(mmstat$lang$sel)
}