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
#' @export
#'
#' @examples
makeShinyApp <- function (output, input=NULL,
                          dashboardHeader=list(title='MM*Stat', titleWidth=NULL, disable=FALSE),
                          dashboardSidebar=list(disable=FALSE, width=NULL, collapsed=FALSE),
                          app='app.tmpl') {
  mergePrgLines <- function (code, collapse="\n", final='') {
    if (is.null(code) || (code=='')) return('')
    paste0(paste0(code, collapse=collapse), final)
  }
  #browser()
  if (!is.environment(output)) stop('Unexpected value for "output"')
  prg <- list(Sidebar=c(),
              Server=c(),
              Body=c(),
              Value=c(),
              Global=c()
  )
  if ('shiny' %in% class(output)) { # Just one output, no sidebar entries necessary
    prg <- appendToPrg(prg, output)
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
      add_ID('UImmstatTabs', 'sidebarMenuOutput')
      prg <- appendToPrg(prg,
                         list(Server  = paste0("output$UImmstatTabs <- renderMenu({\n", str_call('sidebarMenu', menuItemList), "\n})"),
                              Sidebar = str_call('sidebarMenuOutput', list(outputId='UImmstatTabs')),
                              Body    = str_call('tabItems', tabItemList)
                              )
                         )
    } else {
      prg <- appendToPrg(prg, output[[1]])
    }
  }
  #browser()
  if (!is.null(input)) { # any input
    if ('shiny' %in% class(input)) input <- list(input)
    for (inp in input) {
      prg <- appendToPrg(prg, inp)
    }
  }
  #browser()
  app <- template(file             = app,
                  dashboardHeader  = dashboardHeader,
                  dashboardSidebar = dashboardSidebar,
                  Sidebar          = mergePrgLines(prg$Sidebar, ",\n", ","),
                  Server           = mergePrgLines(prg$Server),
                  Body             = mergePrgLines(prg$Body),
                  Value            = mergePrgLines(prg$Value),
                  Global           = mergePrgLines(prg$Global)
                  )
  print_ID()
  writeLines(app, 'app.R')
  remove_ID()
  file.edit('app.R')
}
