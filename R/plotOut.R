#' plotOut
#'
#' Render a plot within an application page. 
#' Either \code{file} or \code{text} must be set.
#' 
#' @inheritParams shiny::plotOutput
#' @param file character: name of file with R code to execute
#' @param text character: text with R code to execute
#'
#' @return a environment
#' @export
#'
#' @examples
#' plotOut('myplot', text='plot(1:10)')
#' \dontrun{
#' # create a static app
#' makeShinyApp(output=plotOut('myplot', text='plot(1:10)'))
#' }
plotOut <- function(outputId, width = "100%", height = "400px", click = NULL,
                       dblclick = NULL, hover = NULL, hoverDelay = NULL,
                       hoverDelayType = NULL, brush = NULL, clickId = NULL, hoverId = NULL,
                       inline = FALSE,
                       file=NULL, text=NULL) {
  # error handling
  if (missing(outputId)) stop('"outputId" missing')
  if (is.null(text)) {
    if (is.null(file)) stop('Either "text" or "file" must be set')
    pfile <- normalizePath(file, mustWork = TRUE)
    text  <- paste0(readLines(pfile), collapse="\n")
  } else {
    pfile <- ''
  }
  #
  args  <- as.list(match.call())
  add_ID(outputId, 'plotOutput')
  fargs <- formals(shiny::plotOutput)
  eargs <- list()
  #browser()
  for (arg in names(fargs)) eargs[[arg]] <- if(is.null(args[[arg]])) eval(fargs[[arg]]) else eval(args[[arg]])
  newShiny('plotOutput', 
            Id     = outputId,
            Body   = str_call('plotOutput', eargs, lib='shiny'),
            Server = c(paste0('output$', outputId, " <- shiny::renderPlot({\n#", pfile, "\n", text, "\n})", ''))
  )
}
