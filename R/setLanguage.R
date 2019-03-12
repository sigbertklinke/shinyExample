#' isLocal
#'
#' Checks if a Shiny app runs locally or on a server
#'
#' @return logical
#' @export
#'
#' @examples
#' isLocal()
isLocal <- function() { Sys.getenv('SHINY_PORT') == "" }

#' setLanguage
#'
#' Loads \code{PO} files with translations into the library internal object \code{mmstat}.
#'  
#' @param ... named list of \code{PO} files
#'
#' @return returns the names of the translations
#' @export
#'
#' @examples
#' \dontrun{
#'   setLanguage(GERMAN='https://shinyapps.wiwi.hu-berlin.de/app/histogramlang/GERMAN.po')
#' }
setLanguage <- function(...) {
  files <- list(...)
  pon   <- names(files)
  sel   <- 0
  msgs  <- list()  
  stats <- list(count=numeric())
  if (length(files)) {
    for (i in seq(files)) {
      msg            <- paste0(readLines(files[[i]]), collapse="\n")
      msgid          <- regmatches(msg, gregexpr('msgid\\s*".*?"', msg))
      tmp            <- strsplit(msgid[[1]], '"')
      msgid          <- sapply(tmp, function (vec) { paste0(vec[2:length(vec)]) } )
      msgstr         <- regmatches(msg, gregexpr('msgstr\\s*".*?"', msg))
      tmp            <- strsplit(msgstr[[1]], '"')
      msgstr         <- sapply(tmp, function (vec) { paste0(vec[2:length(vec)]) } )
      msgs[[pon[i]]]    <- list(id=msgid, str=msgstr)
      #
      stats$count[msgid] <- 0
      #stats[[pon[i]]]       <- msgid
    }
    sel <- 1
  } 
  mmstat$lang <- list(files=unlist(files), sel=sel, msgs=msgs, stats=stats, pon=pon)
  invisible(names(mmstat$lang))
}
