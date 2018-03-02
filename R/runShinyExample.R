#' runShinyExample
#'
#' starts a Shiny app that allows to run an R-, Octave- or Stata example programs
#'
#' @param launch.browser logical (FALSE): If \code{TRUE} the app is launched in the system's default web browser.
#'
#' @return runs the shiny example app
#' @export
#'
#' @examples
#' \dontrun{
#' runShinyExample()
#' }
runShinyExample <- function(launch.browser = getOption("shiny.launch.browser", interactive())) {
  appDir <- system.file("examples", package = "shinyExample")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinyExample`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal", launch.browser=launch.browser)
}
