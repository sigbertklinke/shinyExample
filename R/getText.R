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
#' getText('Test')
getText <- function(msg) {
#  poEnv <- get('poEnv')
  #browser()
  if (isLocal()) {
    mmstat$lang$stats$count[msg] <- mmstat$lang$stats$count[msg]+1
    mmstat$lang$stats$count[msg][is.na(mmstat$lang$stats$count[msg])] <- 1
  }
  ret <- msg
  if (length(mmstat$lang$sel) && (mmstat$lang$sel>0)) {
    pos <- match(msg, mmstat$lang$msgs[[mmstat$lang$sel]]$id)
    ind <- (1:length(pos))[!is.na(pos)]
    ret[ind] <- mmstat$lang$msgs[[mmstat$lang$sel]]$str[pos[ind]]
  }
  ret
}