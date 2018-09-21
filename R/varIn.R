#' varIn
#'
#' Constructs a selection to selecting one (or more) variables. The defaults are
#' \describe{
#' \item{\code{label}\item{\emph{'Select a variable'}}
#' } 
#' The \code{type} parameter may exclude certain variables, 
#' for more details see \code{\link{is.true}}.
#'
#' @inheritParams shiny::selectInput
#' @param type function: returns for each variable \code{TRUE} or \code{FALSE}
#'
#' @return an environment
#' @export
#'
#' @examples
#' varIn('var1')
varIn  <- function (inputId, label, selected = NULL, selectize = TRUE, width = NULL, size = NULL, type=is.true()) {
  if (missing(inputId)) stop('"inputId" missing')
  args  <- as.list(match.call())
  if (is.null(args$label)) args$label <- 'Select a variable'
  fargs <- as.list(formals(shiny::selectInput))
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  fargs$choices <- "huglawurza"
  # 
  ret <- do.call('selectIn', fargs)
  pattern    <- paste0('(choices', inputId, ')')
  ret$Server <- sub(pattern, '(names(data[[value(input$DATA)]]), inc)', ret$Server, fixed=TRUE)
  ret$Server <- sub('#RENDERUI', sprintf("#RENDERUI\ninc<-sapply(data[[value(input$DATA)]], varType%s)", inputId), ret$Server, fixed=TRUE)
  ret$Global  <- paste0(sprintf('varType%s <- ', inputId), paste0(deparse(type), collapse="\n"))
  ret
}