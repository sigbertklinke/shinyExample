newShiny <- function(cls) {
  ret <- new.env()
  class(ret) <- c(cls, 'shiny', class(ret))
  ret
}