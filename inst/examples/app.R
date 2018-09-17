library("digest")
library("RCurl")
library("shiny")
library("shinydashboard")
library("shinyFiles")

VERSION <- 3 # increasing forces each program to rerun if touched
if (file.exists('rds/shinyExample.rds')) {
  sys <- readRDS('rds/shinyExample.rds')
} else {
  fail <- NULL
  sys  <- list()
  if (Sys.info()['sysname']=="Windows") {
    sys$runcmd  <- shell
    sys$cmdsep  <- '&'
    sys$convert <- 'magick.exe'
    if (sys$runcmd(sys$convert)==1) fail <- "Please install Ghostscript (www.ghostscript.com) and ImageMagick 7.x (www.imagemagick.org) and restart R and RStudio"
  } else {
    sys$runcmd <- system
    sys$cmdsep <- ';'
    sys$convert <- 'magick'
    if (sys$runcmd(sys$convert)==127) sys$convert <- 'convert'
    if (sys$runcmd(sys$convert)==127) fail <- "Please install ImageMagick from www.imagemagick.org and restart R and RStudio"
  }
  if(!is.null(fail)) stop(fail)
  saveRDS(sys, 'rds/shinyExample.rds')
}
###
program <- function(x, ...) UseMethod("program")

program.program <- function (x, ...) { # update x
  args <- list(...)
  if (!is.null(args$time)) {
    x$time  <- args$time
    wh      <- sprintf("%05i%05i", as.integer(x$width), as.integer(x$height))
    fn      <- gsub('.', '_', paste0(x$path[-(1:2)], collapse="_"), fixed=TRUE)
    x$digest.short <- paste0(fn, wh)
    x$digest.long  <- paste0(fn, wh, x$time)
    #
    x$png          <- paste0(x$digest.long, '.png')
    x$pdf          <- paste0(x$digest.long, '.pdf')
    x$plot         <- paste0(x$digest.long, '_plot.html')
    x$source       <- paste0(x$digest.long, '_source.html')
    x$console      <- paste0(x$digest.long, '_console.html')
    x$rds          <- paste0('./rds/', x$digest.long, '.rds')
  }
  x
}

program.default <- function (x, ...) {
  # set defaults
  args <- list(...)
  if(is.null(args$time))   args$time   <- '0000000000000'
  if(is.null(args$width))  args$width  <- '480'
  if(is.null(args$height)) args$height <- '480'
  #
  prg         <- list()
  prg$url     <- args$url
  prg$file    <- x
  prg$version <- VERSION
  prg$time    <- args$time
  prg$width   <- args$width
  prg$height  <- args$height
  if (!file.exists(prg$file)) {
    prg$file <- './R/error.R'
    writeLines(sprintf("stop(\"the file '%s' does not exist!\")", x), prg$file)
  }
  prg$path <- strsplit(prg$file, '/', fixed=TRUE)[[1]]
  extpos   <- regexpr("\\.[^\\.]*$", prg$path[length(prg$path)])
  prg$ext  <- substring(prg$path[length(prg$path)], extpos+1)

  wh <- sprintf("%05i%05i", as.integer(prg$width), as.integer(prg$height))
  fn <- gsub('.', '_', paste0(prg$path[-(1:2)], collapse="_"), fixed=TRUE)

  prg$digest.short <- paste0(fn, wh)
  prg$digest.long  <- paste0(fn, wh, prg$time)
  #
  prg$png          <- paste0(prg$digest.long, '.png')
  prg$pdf          <- paste0(prg$digest.long, '.pdf')
  prg$plot         <- paste0(prg$digest.long, '_plot.html')
  prg$source       <- paste0(prg$digest.long, '_source.html')
  prg$console      <- paste0(prg$digest.long, '_console.html')
  prg$rds          <- paste0('./rds/', prg$digest.long, '.rds')
  class(prg) <- "program"
  prg
}

pasteOff <- function (lines, pre, post, preinc=1, postinc=-1) {
  # Fuck Stata...
  pre     <- substr(pre, 1, 75)
  post    <- substr(post, 1, 75)
  #
	prepos  <- which(startsWith(lines, pre))[1]
	if (is.na(prepos)) prepos <- 0
	postpos <- rev(which(startsWith(lines, post)))[1]
	if (is.na(postpos)) postpos <- length(lines)+1
	paste0(lines[(prepos+preinc):(postpos+postinc)], collapse="\n")
}

getSize <- function (query) {
  # default width & height: 480px or 7in
	width <- height <- 480
	if (!is.null(query[['S']])) {
		sizes <- read.csv('sizes.csv')
		pos  <- match(toupper(query[['S']]), sizes[,1])
		if (!is.na(pos)) {
			width  <- sizes[pos,2]
			height <- sizes[pos,3]
		}
	}
	if (!is.null(query[['W']])) width  <- as.numeric(query[['W']])
	if (!is.null(query[['H']])) height <- as.numeric(query[['H']])
  if (width<16)  width  <- 480
  if (height<16) height <- 480
  list(width=width, height=height)
}

pp <- function(...) {
  args       <- list(...)
  na         <- length(args)
  args[na-1] <- paste0(args[[na-1]], args[[na]])
  paste0(args[-na], collapse='/')
}

# imageR
imageR <- function(prg) {
  #browser()
  # pre
  win <- round(7.0*as.numeric(prg$width)/480.0, 1)
  hin <- round(7.0*as.numeric(prg$height)/480.0, 1)
	fullsource <- paste('dev.off <- pdf <- postscript <- png <- bmp <- jpeg <- tiff <- function(...) {invisible(NULL)}',
	                    'source <- function(file, ...) { file <- list.files(path="..", pattern=file, recursive=TRUE, full.names=TRUE)[1]; cat(file, "\n"); base::source(file=file, ...)}', 
	                     sprintf('grDevices::pdf("%s", width=%.1f, height=%.1f)', prg$pdf, win, hin),
	                    "cat(\"<!--START-->\\n\")",
	                     prg$code,
	                    '#<!--END-->',
                      'grDevices::dev.off()',
	                    sep="\n")
	writeLines(fullsource, pp('run', prg$digest.long, '.R'))
	# run
	cmd <- sprintf('cd %s%s %s CMD BATCH -q --vanilla %s.R', 'run', sys$cmdsep, Sys.which('R'), prg$digest.long)
	sys$runcmd(cmd, wait=TRUE)
	# post
	res     <- readLines(pp('run', prg$digest.long, '.Rout'))
	prg$out <- pasteOff(res, '<!--START-->',  '> #<!--END-->')
	prg
}

# stata files
stata <- function(prg) {
  # pre
	fullsource <- paste(prg$code,
	                    graph  <- sprintf("graph export %s.pdf", prg$digest.long),
	                    sep="\n")
  writeLines(fullsource, pp('run', prg$digest.long, '.do'))
  # run
	cmd <- sprintf('cd %s%s /usr/local/Stata15/stata -q -b do %s', 'run', sys$cmdsep,  prg$digest.long)
	sys$runcmd(cmd, wait=TRUE)
	# post
	res   <- readLines(pp('run', prg$digest.long, '.log'))
	prg$out <- pasteOff(res, 'running /usr/local/bin/profile.do ...', paste0('. ', graph), preinc=3)
	prg
}

# octave/matlab files
octave <- function(prg, size, last=FALSE) {
  # browser()
  # pre
  win <- round(7.0*as.numeric(prg$width)/480.0, 1)
  hin <- round(7.0*as.numeric(prg$height)/480.0, 1)
  fullsource <- paste("echo",
                  prg$code,
                  "echo ('off')",
                  sprintf("set(gcf, 'PaperPosition', [0 0 %.1f %.1f])", win, hin),
                  sprintf("set(gcf, 'PaperSize', [%.1f %.1f])", win, hin),
                  sprintf("saveas(gcf, '%s', 'pdf')", prg$digest.long),
#                  sprintf("print(\"%s.pdf\")", prg$digest),
                  sep="\n")
  writeLines(fullsource, pp('run', prg$digest.long, '.m'))
  # run
  cmd <- sprintf('cd %s%s octave-cli -f -q %s.m > %s.mout', 'run', sys$cmdsep, prg$digest.long, prg$digest.long)
  sys$runcmd(cmd, wait=TRUE)
  # post
  res     <- readLines(pp('run', prg$digest.long, '.mout'))
  prg$out <- pasteOff(res, 'sigbertklinke', "+ echo ('off')")
  prg
}

simpleCap <- function(s) {
	paste0(toupper(substring(s, 1,1)), substring(s, 2))
}

header <- function() {
#  '<head>
#   <script type="text/javascript">
#    window.onload = function() {
#      if (parent) {
#        var oHead = document.getElementsByTagName("head")[0];
#        var arrStyleSheets = parent.document.getElementsByTagName("style");
#        for (var i = 0; i < arrStyleSheets.length; i++)
#          oHead.appendChild(arrStyleSheets[i].cloneNode(true));
#      }
#    }
#  </script>
#  </head>
#  '
  ''
}

footer <- function(prg, type='S') {
  #browser()
  fn     <- paste0(prg$path[-(1:2)], collapse="/")
  time   <- if (prg$runtime>10) sprintf("%.0f s", prg$runtime) else  sprintf("%.0f ms", 1000*prg$runtime)
  date   <- as.POSIXct(as.numeric(prg$time)/1000, origin="1970-01-01")
  static <- switch(type, 'S'=prg$source, 'C'=prg$console, 'P'=prg$plot)
  tags$div(
    tags$div(id=paste0("shinyExampleTable", type), style="display:none;",
      tags$table(width="100%",
        tags$tr(style="font-size:small;",
                tags$td(tags$b('File: '), fn, ' (', time, ')'),
                tags$td(tags$b('Created: '), date),
                tags$td(align="right",
                        tags$a(target="_blank", href=paste0(prg$url, static),
                               "STATIC"
                              ))
               ),
        tags$tr(style="font-size:small;",
                tags$td(colspan="3", align="center",
                       "(C) 2017- Sigbert Klinke, Humboldt-Universität zu Berlin, supported by ",
                        tags$a(target="_blank", href="https://www.wihoforschung.de/de/flipps-1327.php",
                           "BMBF")
                       )
               )
      )
    ),
    tags$div(id=paste0("shinyExampleInteractive", type), style="display:none;",
             tags$table(width="100%", style="font-size:x-small;text-align:center;",
                        tags$tr(tags$td(tags$a(target="_blank", href=paste0(prg$url, '?P=', fn, '&V=', type, '&W=', prg$width, '&H=', prg$height),
                                               "INTERACTIVE"))))),
    HTML(sprintf('<script>
                  if (typeof inShinyExample !== "undefined") {
                    document.getElementById("shinyExampleTable%s").style.display = "block";
                  } else {
                    document.getElementById("shinyExampleInteractive%s").style.display = "block";
                  }</script>', type, type))
  )
}

#URL: ?
# P=... program name incl. path
# V=... show only 'Console', 'Output' or 'Plot'
# W=... width of plot (in pixel)
# H=... height of plot (in pixel)
# S=... size of plot, for possible values see sizes.csv

query  <- list(V='Console', W='480', H='480', L='0000000000000')  # default query parameters

ui <- dashboardPage(
	dashboardHeader(title="MM*Stat", titleWidth = 165,
	                tags$li(class = "dropdown",
	                        tags$style(".main-header {min-height: 20px}"),
	                        tags$style(".main-header .logo {height: 20px; font-size: 16px; line-height: 20px;}"),
	                        tags$style(".sidebar-toggle {height: 20px; padding-top: 1px !important;}"),
	                        tags$style(".navbar {min-height:20px !important;}")
	                        )
	                ),
	dashboardSidebar(
		tags$head(tags$style('.marginLeft {margin-left:15px;}')),
#		tags$style(".content-wrapper {padding-top: 12px}"),
#		tags$style(".left-side, .main-sidebar {padding-top: 20px}"),
    tags$style(".left-side, .main-sidebar {top: auto; padding-top: 0px}"),
		tags$style(".skin-blue .sidebar a { color: #444; }"),
#    tags$script(src = "example.js"),
#		useShinyjs(),
#		extendShinyjs(script="example.js"),
#		HTML('<br>'),
		sidebarMenu(id="tabs",
   		menuItem("Source", tabName = "source", icon=icon("align-left", lib = "glyphicon")),
  		menuItem("Console", tabName = "console", icon=icon("indent-left", lib = "glyphicon")),
	  	menuItem("Plot", tabName = "plot",  icon = icon("picture", lib = "glyphicon"))
		),
		#HTML('<br>'),
    div(style="display:inline-block;width:60%;text-align: center;",
        actionButton("run", "Run again")),
    div(style="display:inline-block;width:30%;text-align: center;",	#
        actionButton("reset", '0')),

    downloadButton("download", "Download", class="marginLeft"),
		HTML('<hr>'),
		shinyFilesButton('files', 'File select', 'Please select a file', FALSE, class="marginLeft"),
		selectInput("history", "History", choices=NULL),
    #sliderInput('history', "History", min=1, max=1, value=1, step=1),
    actionButton(inputId='Overview', label="File overview",
                 onclick ="window.open('overview.html', '_blank')"),
		div(img(src='spinner.gif', style="margin-left:3px"),
		    div(h2('0', id="progress-text"), style="position:absolute;margin:auto;left:0;right:0;top:50%;transform:translateY(-50%);"),
		    id="progress-spinner", style="text-align:center;position:relative;visibility:hidden"),
    width="165px",
		collapsed=FALSE
	),
	dashboardBody(
	  tags$head(tags$script(src='example2.js')),
#	  uiOutput("tabbox"),
	  tabItems(
	    tabItem(tabName = "source",
	            htmlOutput("source")
	    ),
	    tabItem(tabName = "console",
	            htmlOutput("console")
	    ),
	    tabItem(tabName = "plot",
	            htmlOutput("plot")
	    )
	  )#,
#		htmlOutput("copyright")
	)
)

log <- function (x) {
  tmp <- capture.output(str(x))
  cat(file=stderr(), tmp, "\n")
}

server <- function(input, output, session) {
	rv <- reactiveValues(prg=NULL)

	shinyFileChoose(input, 'files', roots=c(wd='./R'), filetypes=c('R', 'do', 'm'))

	updateHistory <- function(prg) {
	  if(!is.null(prg)) {
	    #browser()
	    files  <- list.files(path="./rds", pattern=sprintf("^%s.*.rds$", prg$digest.short))
	    epoch  <- substr(files, nchar(prg$digest.short)+1, nchar(files)-4)
	    if (length(epoch)) {
	      nepoch  <- sort(as.numeric(epoch), decreasing=TRUE)
	      cepoch  <- sprintf("%013.0f", nepoch)
	      date    <- as.character(as.Date(as.POSIXct(nepoch/1000, origin="1970-01-01")))
	      udate   <- unique(date)
	      choices <- list()
        for (i in 1:length(udate)) {
          t        <- subset(cepoch, date==udate[i])
          names(t) <- strftime(as.POSIXct(as.numeric(t)/1000, origin="1970-01-01"), format="%H:%M:%S")
          choices[[udate[i]]] <- t
        }
	      updateSelectInput(session, 'history', choices = choices, selected=prg$time)
	    }
	  }
	}

	runProgram <- function(prg, run=FALSE) {
	  #browser()
	  if (!run) {
  	  run <- TRUE
	    if (file.exists(prg$rds)) {
	      # RDS file exists, check for old version
	      prgrds <- readRDS(prg$rds)
	      files  <- paste0('./www/', c(prgrds$png, prgrds$pdf,  prgrds$plot,  prgrds$source,  prgrds$console))
	      run    <- is.null(prgrds$version) || (prgrds$version<VERSION)	|| !all(file.exists(files))
	      if (!run) prg <- prgrds
	    } else {
	      # if program is not run at current time, but time given does not exist then
	      t <- as.numeric(prg$time)
	      if (t>0) {
	        files  <- list.files(path="./rds", pattern=sprintf("^%s.*.rds$", prg$digest.short))
	        epoch  <- substr(files, nchar(prg$digest.short)+1, nchar(files)-4)
  	      nepoch <- as.numeric(epoch)
	        time   <- nepoch[nepoch>t]
	        if (length(time)) { # update prg
	          prg <- program(prg, time=as.character(min(time)))
	          run <- FALSE
	        }
	      }
	    }
	  }
	  # run program
	  if (run) {
	    prg$code  <- paste0(readLines(prg$file), collapse="\n")
#	    js$spinner('visible')
	    session$sendCustomMessage('spinner', 'visible')
	    Sys.sleep(0.010)
	    start <- Sys.time()
      #
	    isolate({
	      #browser()
	      if (prg$ext=='R')  prg <- imageR(prg)
	      if (prg$ext=='do') prg <- stata(prg)
	      if (prg$ext=='m')  prg <- octave(prg)
        prg$runtime <- as.numeric(Sys.time()-start)
	    })
      ## create html files
      # source
      txt <- paste0(header(), "<pre>\n", prg$code, "\n</pre>", footer(prg, 'S'))
      writeLines(txt, pp('www', prg$source, ''))
      # console
      txt <- paste0(header(), "<pre>\n", prg$out, "\n</pre>", footer(prg, 'C'))
      writeLines(txt,  pp('www', prg$console, ''))
      # plot
      txt <- NULL
	    # pdf2png
      if (file.exists(paste0('run/', prg$pdf))) {
        cmd  <- sprintf('cd ./run%s %s -density 150 -antialias %s.pdf -append -resize %.0fx%.0f -quality 100 %s.png', sys$cmdsep, sys$convert,
                        prg$digest.long, as.numeric(prg$width), as.numeric(prg$height), prg$digest.long)
        sys$runcmd(cmd, wait=TRUE)
        pngfile <- pp('run', prg$png, '')
        if (file.exists(pngfile)) {
          txt <- base64Encode(readBin(pngfile, "raw", file.info(pngfile)[1, "size"]), "txt")
        }
#        prg$pnghash <- cprg['short']
#        if (file.exists(cprg['png'])) prg$pnghash <- digest(readBin(cprg['png'], 'raw', n=as.integer(file.info(cprg['png'])['size']), size=1), 'sha512')
      }
      #browser()
      if (is.null(txt)) {
        pngfile <- 'www/white.png'
        txt     <- base64Encode(readBin(pngfile, "raw", file.info(pngfile)[1, "size"]), "txt")
        prg$png <- 'white.png'
        prg$pdf <- 'white.pdf'
      }
      txt <- sprintf('<img src="data:image/png;base64,%s">', txt)
      txt <- paste0(header(), txt, footer(prg, 'P'))
      writeLines(txt, pp('www', prg$plot, ''))
	    # Garbage collection
      # browser()
#	    rdsfiles   <- list.files(path="./tmp", pattern=sprintf("^%s.*.rds$", cprg['short']), full.names=TRUE)
#	    rdslist    <- lapply(rdsfiles,
#	                         function(fname, time) {
#	                           if (as.numeric(start-file.info(fname)[1, 'mtime'])<86400) return(NULL)
#	                           readRDS(fname)
#	                         }, time=start)
#      deletefile <- sapply(rdslist,
#                           function(rds, prg) {
#                             if (is.null(rds) || (as.numeric(rds$time)==0)) return(FALSE)
#                             (rds$console==prg$console) && (rds$pnghash==prg$pnghash)
#                           }, prg=prg)
#	    rdsfiles   <- paste0(substr(rdsfiles, 1, nchar(rdsfiles)-3), '*')
#	    for (i in seq(deletefile)) {
#	      if (deletefile[i]) unlink(rdsfiles[i])
#	    }
#	    ###
	    saveRDS(prg, prg$rds)
#	    js$spinner('hidden')
	    session$sendCustomMessage('spinner', 'hidden')
	  }
	  prg
	}

	observeEvent(input$run, # run pressed
	{ #browser()
	  if (input$run) isolate({
	    rv$prg <- runProgram(program(rv$prg, time=as.character(trunc(1000*as.numeric(Sys.time())))))
	    updateHistory(rv$prg)
	    isolate(updateTabItems(session, 'tabs', input$tabs))
	  })
	})

	observeEvent(input$reset, # 0 pressed
	{ #browser()
	  if (input$reset) isolate({
	    rv$prg <- runProgram(program(rv$prg, time='0000000000000'), TRUE)
	    updateHistory(rv$prg)
	    isolate(updateTabItems(session, 'tabs', input$tabs))
	   })
	})

  observeEvent(input$history, # history choice
  { #browser()
   	if ((input$history!="")  && (input$history!=rv$prg$time)) isolate({
   	  rv$prg <- runProgram(program(rv$prg, time=input$history))
  	  updateHistory(rv$prg)
   	})
  })

  observe({ # file select
    #browser()
  	if (!is.null(input$files)) isolate({
  	  prgname    <- input$files[[1]][[1]]
  	  prgname[1] <- './R'
  	  prgname    <- paste(prgname, collapse="/")
  	  rv$prg     <- program(prgname, time=as.character(trunc(1000*as.numeric(Sys.time()))), url=rv$prg$url, width=rv$prg$width, height=rv$prg$height)
  	  rv$prg     <- runProgram(rv$prg)
   	  updateHistory(rv$prg)
  	})
  })

  observe({ # INIT: this observer is only called at app start
    isolate({
      #browser()
		  query <- parseQueryString(session$clientData$url_search)
		  log(query)
		  size  <- getSize(query)
		  args <- list()
		  args$width  <- size$width
		  args$height <- size$height
		  args$url    <- paste0(session$clientData$url_protocol, '//', session$clientData$url_hostname,
		                        ':', session$clientData$url_port, session$clientData$url_pathname)
		  if(!is.null(query[['L']])) args$time <- query[['L']]
		  args$x <- if (is.null(query[['P']])) './R/noprg.R' else paste0('./R/', query[['P']])
      rv$prg <- do.call('program', args)
      rv$prg <- runProgram(rv$prg)
      updateHistory(rv$prg)
      if(!is.null(query[['V']])) {
        pos  <- charmatch(simpleCap(query[['V']]), c("Source", "Console", "Plot", "History"))
        view <- c("source", "console", "plot")[pos]
        if (view == 'plot') updateTabItems(session, "tabs", "plot")
        if (view == 'console') updateTabItems(session, "tabs", "console")
        if (view == 'source') updateTabItems(session, "tabs", "source")
      } else {
        updateTabItems(session, "tabs", "source")
      }
    })
	})

	output$tabbox <- renderUI ({
	  # browser()
	  tabItems(
	    tabItem(tabName = "source",
	            verbatimTextOutput("source")
	    ),
	    tabItem(tabName = "console",
	            verbatimTextOutput("console")
	    ),
	    tabItem(tabName = "plot",
	            imageOutput("plot", width=query$size['wpx'], height=query$size['hpx'])
	    )
	  )
	})

	output$plot <- renderUI({
	  includeHTML(pp('www', rv$prg$plot, ''))
	})

	output$console <- renderUI({
	  includeHTML(pp('www', rv$prg$console, ''))
	})

	output$source <- renderUI({
	  includeHTML(pp('www', rv$prg$source, ''))
	})

	output$download <- downloadHandler(
	  filename = function() {
	    isolate({
        #browser()
	      if (!is.null(rv$prg)) {
	        base <- rv$prg$path[length(rv$prg$path)]
	        base <- substr(base, 1, nchar(base)-nchar(rv$prg$ext)-1)
	        if (input$tabs=='source') return(paste0(base, '.', rv$prg$ext))
	        if (input$tabs=='console') return(paste0(base, '.txt'))
	        if (input$tabs=='plot') return(paste0(base, '.pdf'))
	      }
	    })
	  },
	  content = function(file) {
	    isolate({
	      #browser()
   	    if (input$tabs=='source')  file.copy(rv$prg$file, file, overwrite=TRUE)
	      if (input$tabs=='console') write(rv$prg$out, file)
	      if (input$tabs=='plot')    file.copy(pp('run', rv$prg$pdf, ''), file, overwrite=TRUE)
	    })
	  }
	)

}

shinyApp(ui, server)
