#' add_ID 
#'
#' Adds the ID (name of an input or output element of the app) to the set of IDs. If the ID already exists then an error will be thrown. 
#'
#' @param id character: name of ID
#' @param txt character: additional text informations to the ID (default: '')
#'
#' @return
#' @export
#'
#' @examples
#' add_ID('test')
add_ID <- function(id, txt='') {
  env.ID <- get0('env.ID', ifnotfound=list())
  for (idi in id) {
    #    if (exists(idi, envir=env.ID)) {
    nei <- names(env.ID)
    if (length(nei) && (idi %in% names(env.ID))) {
      assign('env.ID', env.ID)
      print_ID()
      stop(sprintf('inputId/outputID/id "%s" exists', idi))
    }
    env.ID[[idi]] <- txt
  }
  assign('env.ID', env.ID)
}