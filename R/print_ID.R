#' print_ID
#'
#' @return
#' @export
#'
#' @examples
print_ID <- function() {
  env.ID <- get0('env.ID', ifnotfound=list())
  #  text  <- unlist(eapply(env.ID, function(e) { e }))
  text  <- names(env.ID)
  input <- grepl('Input$', text)
  #
  #browser()
  out   <- text[!input]
  if (length(out)) {
    ord   <- order(names(out))
    cat('', paste0('output$', names(out)[ord], ' : ', out[ord], "\n"))
  }
  #
  out   <- text[input]
  if (length(out)) {
    ord   <- order(names(out))
    cat("\n", paste0('input$', names(out)[ord], ' : ', out[ord], "\n"))
  }
}
