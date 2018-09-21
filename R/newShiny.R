newShiny <- function(cls, ...) {
  ret  <- new.env()
  # browser()
  args <- list(...)
  for (arg in names(args)) ret[[arg]] <- args[[arg]]
  class(ret) <- c(cls, 'shiny', class(ret))
  ret
}