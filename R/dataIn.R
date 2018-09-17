is.true <- function(x) { return(TRUE) }

#' dataIn
#'
#' Constructs a selection to select a data sets. For the undocumented parameters see \code{\link[shiny]{selectInput}}
#'
#'
#' @param inputId character: name of data element
#' @param label character: if \code{percent==TRUE}  \emph{Confidence level (%)} else \emph{Confidence level}
#' @param ... further parameters to select one or more variables, for details see \code{\link{varIn}}
#' @param selected 
#' @param selectize 
#' @param width 
#' @param size 
#' @param file character: name of the RDS file with a list of data sets
#'
#' @return
#' @export
#'
#' @examples
dataIn <- function (inputId, label, ..., selected = NULL, selectize = TRUE, width = NULL, size = NULL, file=NULL) {
  # error handling
  if (missing(inputId)) stop('"inputId" missing')
  if (missing(label)) stop('"label" missing')
  if (!file.exists(file)) stop(sprintf ('file "%s" missing', file))
  if (!is.null(selected) && !is.numeric(selected)) stop('"selected" must be numeric')
  #
  args  <- as.list(match.call())
  fargs <- as.list(formals(shiny::selectInput))
  for (arg in names(fargs)) if(!is.null(args[[arg]])) fargs[[arg]] <- args[[arg]]
  fargs$choices <- expression(as.choices(names(data)))  
  ret <- do.call('selectIn', fargs)
  ret$Global <- sprintf('data <- readRDS("%s")\nchoices%s <- names(data)', file, inputId)
  vars <- list(...)
  for (i in 1:length(vars)) { # replace DATA by inputID
    var <- vars[[i]]
    var$Server <- gsub('DATA', inputId, var$Server, fixed=TRUE)
    ret <- appendToPrg(ret, var)
  }
  #browser()
  class(ret) <- c('selectInput', 'shiny')
  ret
}