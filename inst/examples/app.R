library("digest")
library("shiny")
library("shinyjs")
library("shinydashboard")
library("shinyFiles")

VERSION <- 1
fail    <- NULL
if (Sys.info()['sysname']=="Windows") {
  runcmd  <- shell
  convert <- 'magick'
  if (runcmd(convert)==127) fail <- "Please install ImageMagick 7.x from www.imagemagick.org"
} else {
  runcmd <- system
  convert <- 'magick'
  if (runcmd(convert)==127) convert <- 'convert'
  if (runcmd(convert)==127) fail <- "Please install ImageMagick from www.imagemagick.org"
}
if(!is.null(fail)) stop(fail)

program <- function(x, ...) UseMethod("program")

program.program <- function (x, ...) { # update x
  args <- list(...)
  if (!is.null(args$time)) {
    x$digest$time  <- args$time
    x$digest$long  <- paste0(x$digest$source, x$digest$size,  x$digest$time)
    x$file$rds     <- paste0(x$dir$tmp, '/',  x$digest$long, '.rds')
    x$file$png     <- paste0(x$dir$tmp, '/',  x$digest$long, '.png')
    x$file$pdf     <- paste0(x$dir$tmp, '/',  x$digest$long, '.pdf')
  }
  x
}

program.default <- function (x, ...) {
#  browser()
  # set defaults
  args <- list(...)
  if(is.null(args$path)) args$path <- './R'
  if(is.null(args$time)) args$time <- as.character(trunc(1000*as.numeric(Sys.time())))
  if(is.null(args$size)) args$size <- c(wpx=480, hpx=480, win=7, hin=7)
  #
  prg <- list(file=NULL, console='', plot=NULL, x=x, time=args$time, size=args$size, version=VERSION)
  if (is.null(prg$x)) { # filename from URL (requires args$path)
    if (!is.null(args$url)) {
      prg$file$user <- paste(args$url, sep="/")
    }
  } else { # filename from input$files
    prg$file$user <- paste(x$files[[1]][-1], collapse="/")
  }
  #
  prg$file$source  <- paste(args$path, prg$file$user, sep="/")
  if (!file.exists(prg$file$source)) {
    prg$file$source <- './R/error.R'
    writeLines(sprintf("stop(\"the file '%s' does not exist!\")", x), prg$file$source)
  }
  #
  prg$base <- basename(prg$file$source)
  g        <- regexpr("\\.[^\\.]*$", prg$base)
  prg$ext  <- substring(prg$base, g+1)
  prg$base <- substring(prg$base, 1, g-1)
  prg$dir$source <- normalizePath(dirname(prg$file$source))
  prg$dir$tmp    <- './tmp'
  #
  prg$source  <- paste0(readLines(prg$file$source), collapse="\n")
  prg$digest  <- list(source = digest(prg$source, "sha1"),
                      size   = digest(prg$size, "sha1"),
                      time   = args$time
                      )
  prg$digest$short <- paste0(prg$digest$source, prg$digest$size)
  prg$digest$long  <- paste0(prg$digest$source, prg$digest$size,  prg$digest$time)
  prg$file$rds     <- paste0(prg$dir$tmp, '/',  prg$digest$long, '.rds')
  prg$file$png     <- paste0(prg$dir$tmp, '/',  prg$digest$long, '.png')
  prg$file$pdf     <- paste0(prg$dir$tmp, '/',  prg$digest$long, '.pdf')

  #
  class(prg) <- "program"
  prg
}

as.character.program <- function (x, ...) {
  c(ext    = x$ext,
    source = x$source,
    wpx    = as.numeric(x$size['wpx']),
    hpx    = as.numeric(x$size['hpx']),
    win    = as.numeric(x$size['win']),
    hin    = as.numeric(x$size['hin']),
    #
    user   = x$file$user,
    rds    = x$file$rd,
    pdf    = x$file$pdf,
    png    = x$file$png,
    short  = x$digest$short,
    long   = x$digest$long,
    time   = x$digest$time,
    tmp    = x$dir$tmp
  )
}

#program <- function (x, permalink, size) {
#  filename  <- paste0('./R/', fileName(x))
#  if (!file.exists(filename)) {
#    filename <- './R/error.R'
#    writeLines(sprintf("stop(\"the file '%s' does not exist!\")", fileName(x)), filename)
#  }
#  source  <- if(is.null(x)) '' else paste0(readLines(filename), collapse="\n")
#  dsource <- digest(source, "sha1")
#  dsize   <- digest(size, "sha1")
#	list(version   = 1,
#			 filename  = x,
#			 permalink = permalink,
#	     source    = source,
#			 size      = size,
#			 dsource   = dsource,
#			 dsize     = dsize,
#			 digest    = paste0(dsource, dsize, permalink),
#			 console   = '',
#			 plot      = NULL)
#}

getFilename     <- function(files, urlfile) {
	filename <- NULL
	if (is.null(files)) {
		if (!is.null(urlfile)) filename <- urlfile
	}	else {
		filename <- paste(files$files[[1]][-1], collapse="/")
	}
	fname <- NULL
	if (!is.null(filename)) {
		bname <- basename(filename)
		pos   <- regexpr('\\.([^/\\\\]?)', bname)
		fname <- list(dirnorm   = normalizePath(paste0('./R/', dirname(filename))),
									dirname   = dirname(filename),
									extension = ifelse(pos > -1L, substring(bname, pos + 1L), ""),
                  basename  =  ifelse(pos > -1L, substring(bname, 1, pos - 1L), bname)
									)
	}
	return(fname)
}

fileName <- function(fname, dirname=NULL, basename=NULL, extension=NULL) {
  dir  <- fname$dirname
  if (is.character(dirname)) dir <- dirname
  if (is.logical(dirname))   dir <- fname$dirnorm
  base <- fname$basename
  if (is.character(basename)) base <- basename
  ext  <- fname$extension
  if (is.character(extension)) ext <- extension
  if (is.null(dir)) dir <- ''
  if (is.null(base)) base <- ''
  if (is.null(ext)) ext <- ''
  if (nchar(dir)) dir <- paste0(dir, '/')
  if (nchar(ext)) ext <- paste0('.', ext)
	return (paste0(dir, base, ext))
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
  c(wpx=width, hpx=height, win=7*width/480, hin=7*height/480)
}

# imageR
imageR <- function(prg) {
  cprg   <- as.character(prg)
  # browser()
  # pre
	fullsource <- paste(sprintf('pdf("%s.pdf", width=%.1f, height=%.1f)', cprg['long'], as.numeric(cprg['win']), as.numeric(cprg['hin'])),
	                    "cat(\"<!--START-->\\n\")",
	                    cprg['source'],
	                    '#<!--END-->',
                      'dev.off()',
	                    sep="\n")
	writeLines(fullsource, paste0(cprg['tmp'], '/', cprg['long'], '.R'))
	# run
	cmd <- sprintf('cd %s; R CMD BATCH -q --vanilla %s.R', cprg['tmp'], cprg['long'])
	runcmd(cmd, wait=TRUE)
	# post
	res   <- readLines(paste0(cprg['tmp'], '/', cprg['long'], '.Rout'))
	pasteOff(res, '<!--START-->',  '> #<!--END-->')
}

# stata files
stata <- function(prg) {
  cprg   <- as.character(prg)
  # pre
	fullsource <- paste(cprg['source'],
	                    graph  <- sprintf("graph export %s.pdf", 	cprg['long']),
	                    sep="\n")
  writeLines(fullsource, paste0(cprg['tmp'], '/', cprg['long'], '.do'))
  # run
	cmd <- sprintf('cd %s; /usr/local/Stata15/stata -q -b do %s', cprg['tmp'], cprg['long'])
	runcmd(cmd, wait=TRUE)
	# post
	res   <- readLines(paste0(cprg['tmp'], '/',cprg['long'], '.log'))
	pasteOff(res, 'running /usr/local/bin/profile.do ...', paste0('. ', graph), preinc=3)
}

# octave/matlab files
octave <- function(prg, size, last=FALSE) {
  cprg   <- as.character(prg)
  # pre
  fullsource <- paste("echo",
                  cprg['source'],
                  "echo ('off')",
                  sprintf("set(gcf, 'PaperPosition', [0 0 %.1f %.1f])", as.numeric(cprg['win']), as.numeric(cprg['hin'])),
                  sprintf("set(gcf, 'PaperSize', [%.1f %.1f])", as.numeric(cprg['win']), as.numeric(cprg['hin'])),
                  sprintf("saveas(gcf, '%s', 'pdf')", cprg['long']),
#                  sprintf("print(\"%s.pdf\")", prg$digest),
                  sep="\n")
  writeLines(fullsource, paste0(cprg['tmp'], '/', cprg['long'], '.m'))
  # run
  cmd <- sprintf('cd %s; octave-cli -f -q %s.m > %s.mout', cprg['tmp'], cprg['long'],  cprg['long'])
  runcmd(cmd, wait=TRUE)
  # post
  # post
  res   <- readLines(paste0(cprg['tmp'], '/', cprg['long'], '.mout'))
  pasteOff(res, 'sigbertklinke', "+ echo ('off')")
}

simpleCap <- function(s) {
	paste0(toupper(substring(s, 1,1)), substring(s, 2))
}

ui <- dashboardPage(
	dashboardHeader(title="MM*Stat"),
	dashboardSidebar(
		tags$head(tags$style('.marginLeft{margin-left:15px;}')),
		useShinyjs(),
		extendShinyjs(script="example.js"),
		HTML('<br>'),
		actionButton("run", "Run again"),
		tags$style(".skin-blue .sidebar a { color: #444; }"),
		downloadButton("download", "Download", class="marginLeft"),
		HTML('<hr>'),
		shinyFilesButton('files', 'File select', 'Please select a file', FALSE, class="marginLeft"),
		selectInput("history", "History", choices=NULL),
		HTML('<br><br>'),
		div(img(src='spinner.gif', style="margin-left:3px"),
		    div(h2('0', id="progress-text"), style="position:absolute;margin:auto;left:0;right:0;top:50%;transform:translateY(-50%);"),
		    id="progress-spinner", style="text-align:center;position:relative;visibility:hidden"),
    width="165px",
		collapsed=TRUE
	),
	dashboardBody(
		uiOutput("tabbox"),
		htmlOutput("copyright")
	)
)

#URL: ?
# P=... program name incl. path
# V=... show only 'Console', 'Output' or 'Plot'
# W=... width of plot (in pixel)
# H=... height of plot (in pixel)
# S=... size of plot, for possible values see sizes.csv
# L=... permalink

server <- function(input, output, session) {
	rv <- reactiveValues(prg=NULL)

	shinyFileChoose(input, 'files', roots=c(wd='./R'), filetypes=c('R', 'do', 'm'))

	updateHistory <- function() {
#	  browser()
	  isolate(prg <- rv$prg)
	  if(!is.null(prg)) {
	    cprg   <- as.character(prg)
	    files  <- list.files(path="./tmp", pattern=sprintf("^%s.*.rds$", cprg['short']))
	    epoch  <- substr(files, nchar(cprg['short'])+1, nchar(files)-4)
	    if (length(epoch)) {
	      nepoch  <- sort(as.numeric(epoch), decreasing=TRUE)
	      cepoch  <- sprintf("%13.0f", nepoch)
	      date    <- as.character(as.Date(as.POSIXct(nepoch/1000, origin="1970-01-01")))
	      udate   <- unique(date)
	      choices <- list()
        for (i in 1:length(udate)) choices[[udate[i]]] <- subset(cepoch, date==udate[i])
	      updateSelectInput(session, 'history', choices = choices, selected=cprg['time'])
	    }
	  }
	}

	runProgram <- function(prg) {
#	  browser()
	  run <- FALSE
	  cprg <- as.character(prg)
	  if (!file.exists(cprg['rds'])) {
	    # if program is not run at current time, but time given does not exist then
	    files  <- list.files(path="./tmp", pattern=sprintf("^%s.*.rds$", cprg['short']))
	    epoch  <- substr(files, nchar(cprg['short'])+1, nchar(files)-4)
  	  nepoch <- as.numeric(epoch)
  	  t      <- as.numeric(cprg['time'])
	    time   <- nepoch[nepoch>t]
	    if (length(time)) { # update prg
	      prg  <- program(prg, time=as.character(min(time)))
	      cprg <- as.character(prg)
	    } else
	      run <- TRUE
	  }
	  # run program
	  if (!run) {
	    prg <- readRDS(cprg['rds'])
	    run <- is.null(prg$version) || (prg$version<VERSION)
	  }
	  if (run) {
	    js$spinner('visible')
	    start <- Sys.time()
      #
	    if (cprg['ext']=='R')  prg$console <- imageR(prg)
	    if (cprg['ext']=='do') prg$console <- stata(prg)
	    if (cprg['ext']=='m')  prg$console <- octave(prg)
      prg$runtime <- as.numeric(Sys.time()-start)
	    # pdf2png
      if (file.exists(cprg['pdf'])) {
        cmd  <- sprintf('cd ./tmp; %s -density 150 -antialias %s.pdf -append -resize %.0fx%.0f -quality 100 %s.png', convert,
                        cprg['long'], as.numeric(cprg['wpx']), as.numeric(cprg['hpx']), cprg['long'])
        runcmd(cmd, wait=TRUE)
        prg$pnghash <- cprg['short']
        if (file.exists(cprg['png'])) prg$pnghash <- digest(readBin(cprg['png'], 'raw', n=as.integer(file.info(cprg['png'])['size']), size=1), 'sha512')
      }
	    # Garbage collection
      # browser()
	    rdsfiles   <- list.files(path="./tmp", pattern=sprintf("^%s.*.rds$", cprg['short']), full.names=TRUE)
	    rdslist    <- lapply(rdsfiles,
	                         function(fname, time) {
	                           if (as.numeric(start-file.info(fname)[1, 'mtime'])<86400) return(NULL)
	                           readRDS(fname)
	                         }, time=start)
      deletefile <- sapply(rdslist,
                           function(rds, prg) {
                             if (is.null(rds) || (as.numeric(rds$time)==0)) return(FALSE)
                             (rds$console==prg$console) && (rds$pnghash==prg$pnghash)
                           }, prg=prg)
	    rdsfiles   <- paste0(substr(rdsfiles, 1, nchar(rdsfiles)-3), '*')
	    for (i in seq(deletefile)) {
	      if (deletefile[i]) unlink(rdsfiles[i])
	    }
	    ###
	    saveRDS(prg, cprg['rds'])
	    js$spinner('hidden')
	  }
	  prg
	}

	observeEvent(input$run, # run pressed
	{ if (input$run) {
	    rv$prg <- runProgram(program(rv$prg, time=as.character(trunc(1000*as.numeric(Sys.time())))))
	    updateHistory()
	  }
	})

  observeEvent(input$history, # history choice
  { # browser()
    cprg <- as.character(rv$prg)
   	if ((input$history!="")  && (input$history!=cprg['time'])) {
   	  rv$prg <- runProgram(program(rv$prg, time=input$history))
   	  updateHistory()
   	}
  })

  observe({ # file select
  	if (!is.null(input$files)) {
  	  rv$prg <- runProgram(program(input$files))
  	  updateHistory()
  	}
  })

  observe({ # this observer is only called at app start
    #browser()
		query <- parseQueryString(session$clientData$url_search)
		time  <- if (is.null(query[['L']])) '0000000000000' else query[['L']]
		if (!is.null(query[['P']])) {
		  rv$prg <- runProgram(program(NULL, url=query[['P']], size=getSize(query),
		                               time=if (is.null(query[['L']])) '0000000000000' else query[['L']]))
		  updateHistory()
		}
	})

	output$copyright <- renderUI({
	#  browser()
		cprg      <- as.character(rv$prg)
		copyright <- "<div style=\"float:left;font-size:small;\">(C) 2017- Sigbert Klinke, Humboldt-Universit&auml;t zu Berlin, supported by <a target=\"_blank\" href=\"https://www.wihoforschung.de/de/flipps-1327.php\">BMBF</a></div>"
		permalink <- ''
		if (!is.null(rv$prg)) permalink <- sprintf("<div style=\"float:right;font-size:small;\">L=%s</div>", cprg['time'])
		HTML(copyright, permalink)
	})

	output$download <- downloadHandler(
		filename = function() {
			isolate(view <- input$tabset)
			isolate(prg  <- rv$prg)
			if (!is.null(prg)) {
  			if (view=='Source') return(paste(prg$base, prg$ext, sep='.'))
			  if (view=='Console') return(paste0(prg$base, '.txt'))
			  if (view=='Plot') return(paste0(prg$base, '.pdf'))
				#if (view=='History') return(fileName(fnp, dirname='', extension="dat"))
			}
		},
		content = function(file) {
			isolate(view <- input$tabset)
			isolate(prg  <- rv$prg)
			if (view=='Source') write(prg$source, file)
      if (view=='Console') write(prg$console, file)
			if (view=='Plot') { file.copy(prg$file$pdf, file, overwrite=TRUE) }
			#if (view=='History') {
			#  cprg     <- as.character(prg)
		#		files    <- list.files(path="./tmp", pattern=sprintf("^%s.*.rds$", cprg['short']))
	#			epoch    <- substr(files, nchar(cprg['short'])+1, nchar(files)-4)
	#			write(paste0('P=', cprg['user'], '&L=', epoch), file)
#			}
		}
	)

	output$tabbox <- renderUI ({
		# default view
		query     <- parseQueryString(session$clientData$url_search)
		width     <- as.numeric(query[['W']]); if ((length(width)==0) || (width<16)) width <- 480
		height    <- as.numeric(query[['H']]); if ((length(height)==0) || (height<16)) height <- 480
		collapsed <- is.null(input$sidebarCollapsed) || input$sidebarCollapsed
		single    <- !is.null(query[['V']])
		view      <- input$tabset
		#
		if (collapsed && single) {
			pos   <- charmatch(simpleCap(query[['V']]), c("Source", "Console", "Plot", "History"))
			if (length(pos) && !is.na(pos)) view <- c("Source", "Console", "Plot", "History")[pos]
			#
			if (view=='Plot')    out <- box(imageOutput("plot"), width=width, height=height)
		  if (view=='Console') out <- box(verbatimTextOutput("console"), width="100%")
			if (view=='Source')  out <- box(verbatimTextOutput("source"), width="100%")
#			if (view=='History') out <- box(uiOutput("history"), width="100%")
		} else {
		  cprg <- as.character(rv$prg)
		  #browser()
			out <- tabBox(
	  			title = if(is.na(cprg['user'])) '' else cprg['user'],
		  		# The id lets us use input$tabset1 on the server to find the current tab
			  	id = "tabset", width="100%",
				  tabPanel(verbatimTextOutput("source"), title="Source"),
				  tabPanel(verbatimTextOutput("console"), title="Console"),
				  tabPanel(imageOutput("plot", width=width, height=height), title="Plot"),
#	  			tabPanel(uiOutput("history"), title="History"),
				  selected=view
			)
		}
		out
  })

	output$history <- renderUI({
	})

	output$plot <- renderImage({
#	  browser()
    prg  <- rv$prg
    cprg <- as.character(prg)
		src <- 'white.png'
		if (!is.null(prg) && file.exists(cprg['png'])) src <- cprg['png']
		list(src=src)
	}, deleteFile = FALSE)

	output$console <- renderText({
		prg <- rv$prg
		prg$console
	})

	output$source <- renderText({
		prg <- rv$prg
		prg$source
	})
}

shinyApp(ui, server)
