mmstat <- new.env(parent=emptyenv())

.onLoad <- function(libname, pkgname) {
  # colors
  options(mmstat.col.population = "green",
          mmstat.col.sample     = "orange")
  mmstat <- list(data=list(), lang=list(), version='0.3')
}