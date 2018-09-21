#' textOut
#'
#' Render a reactive output variable as text within an application page. 
#' Either \code{file} or \code{text} must be set.
#'
#' @inheritParams shiny::textOutput
#' @param file character: name of file with R code to execute
#' @param text character: text with R code to execute
#'
#' @return an environment
#' @export
#'
#' @examples
#' textOut('mytext', text='1:10')
#' \dontrun{
#' # creates a static app
#' makeShinyApp(output=textOut('mytext', text='1:10'))
#' }
textOut <- function(outputId, container = if (inline) span else div, inline = FALSE, file=NULL, text=NULL) {
  div <- function(...) { shiny::div(...) }
  span <- function(...) { shiny::span(...) }
  # browser()
  # error handling
  if (missing(outputId)) stop('"outputId" missing')
  if (is.null(text)) {
    if (is.null(file)) stop('Either "text" or "file" must be set')
    pfile <- normalizePath(file, mustWork = TRUE)
    text  <- readLines(pfile)
  } else {
    pfile <- ''
  }
  #
  add_ID(outputId, 'textOutput')
  args  <- as.list(match.call())
  fargs <- formals(shiny::textOutput)
  #
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  # handling container
  fargs$container <- eval(fargs$container)
  newShiny('textOutput', 
           Id     = outputId,
           Body   = str_call('textOutput', fargs, lib='shiny'),
           Server = paste0('output$', outputId, " <- shiny::renderText({\n#", pfile, "\n", 
                           paste0(text, collapse="\n"), "\n})", '')
  )
}
