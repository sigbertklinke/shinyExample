#env.ID <- new.env(parent=emptyenv())

.onLoad <- function(lib, pkg, ...) {
  env.ID <<- list()
}

print_ID <- function() {
#  text  <- unlist(eapply(env.ID, function(e) { e }))
  browser()
  text  <- unlist(sapply(env.ID, function(e) { e }))
  input <- grepl('Input$', text)
  #
  out   <- text[!input]
  ord   <- order(names(out))
  cat('', paste0('output$', names(out)[ord], ' : ', out[ord], "\n"))
  #
  out   <- text[input]
  ord   <- order(names(out))
  cat("\n", paste0('input$', names(out)[ord], ' : ', out[ord], "\n"))
}

add_ID <- function(id, txt='') {
  for (idi in id) {
#    if (exists(idi, envir=env.ID)) {
    if (idi %in% names(env.ID)) {
      print_ID()
      stop(sprintf('inputId/outputID/id "%s" exists', idi))
    }
    env.ID[[idi]] <<- txt
  }
}

remove_ID <- function() { env.ID <<- list() }
#  rm(ls(envir=env.ID), envir=env.ID) }
