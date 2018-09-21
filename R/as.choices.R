#' as.choices
#'
#' Creates a list with named elements according to \code{txt}. 
#' The list elements are the numbers from 1 to \code{length(txt)}. 
#'
#' @param txt character vector: element names  
#' @param inc logical vector: if a specific \code{txt} element should be included (default:\code{NULL} means all elements are included)
#'
#' @return a list
#' @export
#'
#' @examples
#' as.choices(c("German", "English"))
#' as.choices(c("German", "English", "Spanish"), c(TRUE, FALSE, TRUE))
as.choices <- function(txt, inc=NULL) {
  if (is.null(inc)) inc <- rep(TRUE, length(txt))
  ret        <- as.list((1:length(txt))[inc])
  names(ret) <- txt[inc]
  ret
}