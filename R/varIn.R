varIn  <- function (inputId, label, selected = NULL, selectize = TRUE, width = NULL, size = NULL, type=is.true()) {
  args  <- as.list(match.call())
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