#' textOutput
#'
#' Render a reactive output variable as text within an application page. For the not documented parameters see \code{\link[shiny]{textOutput}}
#'
#' @param outputId
#' @param container
#' @param inline
#' @param file character: name of file with R code to execute
#' @param text character: text with R code to execute
#'
#' @return
#' @export
#'
#' @examples
#' textOutput('mytext', text='1:10')
#' \dontrun{
#' # create a static app
#' makeShinyApp(output=textOutput('mytext', text='1:10'))
#' }
textOutput <- function(outputId, container = if (inline) span else div, inline = FALSE, file=NULL, text=NULL) {
  div <- function(...) { shiny::div(...) }
  span <- function(...) { shiny::span(...) }
  #browser()
  # error handling
  if (missing(outputId)) stop('"outputId" missing')
  if (is.null(text)) {
    if (is.null(file)) stop('Either "text" or "file" must be set')
    pfile <- normalizePath(file, mustWork = TRUE)
    text  <-readLines(pfile)
  } else {
    pfile <- ''
  }
  #
  add_ID(outputId, 'textOutput')
  args  <- as.list(match.call())
  fargs <- formals(shiny::textOutput)
  eargs <- list()
  for (arg in names(fargs)) {
    if (arg!='...') {
      eargs[[arg]] <- if(is.null(args[[arg]])) fargs[[arg]] else args[[arg]]
      if (class(eargs[[arg]])=='if') eargs[[arg]] = eval(eargs[[arg]])
    }
  }
  if ('...' %in%  names(fargs)) {
    ellipsis <- list(...)
    for (arg in names(ellipsis)) eargs[[arg]] <- ellipsis[[arg]]
  }
  #browser()
  ret <- list(Id=outputId,
              Body=str_call(args[[1]], eargs, lib='shiny'),
              Server=c(paste0('output$', outputId, " <- shiny::renderText({\n#", pfile, "\n", text, "\n})", '')))
  class(ret) <- c(args[[1]], 'shiny')
  ret
}
