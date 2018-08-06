#' makeShinyApp
#'
#' Creates a shiny app from one (or more) R example files using shinydashboard.
#'
#' @param output list:
#' @param input list:
#' @param dashboardHeader list: parameters for \code{\link[shinydashboard]{dashboardHeader}} (default: \code{list(title=NULL, titleWidth=NULL, disable=FALSE)})
#' @param dashboardSidebar list: parameters for \code{\link[shinydashboard]{Sidebar}} (default: \code{list(disable=FALSE, width=NULL, collapsed=FALSE)})
#' @param app character: name of app template file (default: \code{app.tmpl})
#'
#' @return
#' @importFrom("utils", "file.edit")
#' @export
#'
#' @examples
makeShinyApp <- function (output, input=NULL,
                             dashboardHeader=list(title='MM*Stat', titleWidth=NULL, disable=FALSE),
                             dashboardSidebar=list(disable=FALSE, width=NULL, collapsed=FALSE),
                             app='app.tmpl') {
  #browser()
  if (!is.list(output)) stop('Unexpected value for "output"')
  Sidebar <- Server <- Body <- c()
  if ('shiny' %in% class(output)) { # Just one output, no sidebar entries necessary
    if (!is.null(output$Body))   Body   <- c(Body, output$Body)
    if (!is.null(output$Server)) Server <- c(Server, output$Server, '')
  } else {
    if (length(output)>1) { # Several outputs, create entries on sidebar
      onames <- names(output)
      add_ID('mmstatTabs', 'sidebarMenu')
      add_ID(paste0('mmstatItem', seq(onames)), 'menuItem')
      menuItemList <- list(id="mmstatTabs")
      tabItemList  <- list()
      for (i in seq(output)) {
         menuItemList <- c(menuItemList, list(str_call('menuItem', list(text=onames[i], tabName=paste0("mmstatItem", i)))))
         tabItemList  <- c(tabItemList, list(str_call('tabItem',  list(tabName=paste0("mmstatItem", i), output[[i]]$Body))))
         if (!is.null(output[[i]]$Server)) Server <- c(Server, output[[i]]$Server, '')
      }
      #browser()
      Server  <- c(Server,  paste0("output$UImmstatTabs <- renderMenu({\n", str_call('sidebarMenu', menuItemList), "\n})"))
      add_ID('UImmstatTabs', 'sidebarMenuOutput')
      Sidebar <- c(Sidebar, str_call('sidebarMenuOutput', list(outputId='UImmstatTabs')))
      Body    <- c(Body,    str_call('tabItems', tabItemList))
    }
  }
  if (!is.null(input)) { # any input
    if ('shiny' %in% class(input)) input <- list(input)
    #browser()
    for (inp in input) {
      Sidebar <- c(Sidebar, inp$Sidebar)
      Server  <- c(Server, inp$Server)
    }
  }
  if (!is.null(Server))  Server  <- paste(Server, collapse="\n")
  if (!is.null(Body))    Body    <- paste(Body, collapse="\n")
  if (!is.null(Sidebar)) Sidebar <- paste0(paste(Sidebar, collapse=",\n"), ',\n')
  app <- template(file=app,
                  dashboardHeader=dashboardHeader,
                  dashboardSidebar=dashboardSidebar,
                  Sidebar=Sidebar,
                  Server=Server,
                  Body=Body
                  )
  print_ID()
  writeLines(app, 'app.R')
  remove_ID()
  file.edit('app.R')
}
