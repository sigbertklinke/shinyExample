#' getText
#'
#' Translates a given message into another language.
#'
#' @param msg character vector
#'
#' @return vector of translated messages
#' @export
#'
#' @examples
#' pomessage <- translations()
#' getText('Test)
getText <- function(msg) {
  po <- get('pomessages')
  if (po$local) {
    po$stats$count[msg] <- po$stats$count[msg]+1
    po$stats$count[msg][is.na(po$stats$count[msg])] <- 1
  }
  if (po$sel==0) return(msg)
  ret <- msg
  pos <- match(msg, po$msgs[[po$sel]]$id)
  ind <- (1:length(pos))[!is.na(pos)]
  ret[ind] <- po$msgs[[po$sel]]$str[pos[ind]]
  return(ret)
}
