#' translations
#'
#'  Loads \code{po} files with translations into a object
#'  
#' @param path character: path to the directory with po files
#'
#' @return returns an object with translations
#' @export
#'
#' @examples
#' pomessages <- translations()
translations <- function(path='.') {
  po       <- new.env()
  po$local <- (Sys.getenv('SHINY_PORT') == "")
  po$files <- list.files(path=path, pattern="*.po$", full.names=TRUE)
  po$msgs  <- list()
  po$stats <- list(count=numeric())
  po$sel   <- 0
  if (length(po$files)) {
    for (i in seq(po$files)) {
      pon            <- sapply(strsplit(po$files[i], '.', fixed=T), function(elem) { elem[1] })
      msg            <- paste(readLines(paste(path, po$files[i], sep="/")), collapse=" ")
      msgid          <- regmatches(msg, gregexpr('msgid\\s*".*?"', msg))
      tmp            <- strsplit(msgid[[1]], '"')
      msgid          <- sapply(tmp, function (vec) { paste0(vec[2:length(vec)]) } )
      msgstr         <- regmatches(msg, gregexpr('msgstr\\s*".*?"', msg))
      tmp            <- strsplit(msgstr[[1]], '"')
      msgstr         <- sapply(tmp, function (vec) { paste0(vec[2:length(vec)]) } )
      po$msgs[[pon]] <- list(id=msgid, str=msgstr)
      #
      po$stats$count[msgid] <- 0
      po$stats[[pon]]       <- msgid
    }
    po$sel <- 1
  } 
  return(po)
}
