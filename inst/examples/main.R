library("stringr")
## delete all R results at time 0
devicecmd <- c('bmp', 'jpeg', 'png', 'tiff', 'pdf', 'postscript', 'xfig', 'bitmap', 'pictex', 'quartz', 'X11', 'svg', 'cairo_pdf', 'dev.off')
libs <- c("digest", "RCurl", "shiny", "shinyjs", "shinydashboard", "shinyFiles", "stringi", "stringr", "rmarkdown")
urls <- c()
unlk <- c()
err  <- c()
src  <- sort(list.files(path="R", pattern="*.R$", recursive=TRUE))
fun  <- list()
for (file in src) {
  tryCatch({
    fname  <- paste0('R/', file)
    rdsn   <- gsub('/', "_", file, fixed=TRUE)
    rdsn   <- gsub('.R', "_R", rdsn, fixed=TRUE)
    pat    <- paste0(rdsn, '.*', '0000000000000.rds$')
    rdsns  <- list.files('rds', pattern=pat, full.names=TRUE)
    if (length(rdsns)==0) {
      urls <- c(urls, paste0('https://shinyapps.wiwi.hu-berlin.de/examples/?P=', file))
    } else {
      for (rds in rdsns) {
        prg  <- readRDS(rds)
        unlk <- c(unlk, prg$source)
        urls <- c(urls, paste0('https://shinyapps.wiwi.hu-berlin.de/examples/?P=', file, '&W=', prg$width, '&H=', prg$height))
      }
    }
    txt    <- readChar(fname, file.info(fname)$size)
    match  <- str_match_all (txt, 'library ?\\("?(.*?)"?\\)')
    if (nrow(match[[1]])) libs   <- c(libs, match[[1]][,2])
    match  <- str_match_all (txt, 'require ?\\("?(.*?)"?\\)')
    if (nrow(match[[1]])) libs   <- c(libs, match[[1]][,2])
    expr   <- parse(fname)
    func   <- setdiff(all.names(expr, functions=TRUE, unique=TRUE), all.names(expr, functions=FALSE, unique=TRUE))
    if (any(devicecmd %in% func)) stop("device command found")
    for (f in func) {
      if (is.null(fun[[f]])) {
        fun[[f]] <- file
      } else {
        fun[[f]] <- c(fun[[f]], file)
      }
    }
  }, error=function(e) { err <<- c(err, paste(fname, ':', e$message)) })
}
# error
print(err)
# unlink
src <- paste0('unlink("www/', unlk, '")')
src <- c(src, rep('', 5-length(src)%%5))
src <- c(rbind(matrix(src, nrow=5), ''))
writeLines(src, 'main_unlink.R')
# run 0
src <- paste0('browseURL("', urls, '"); Sys.sleep(20)')
src <- c(src, rep('', 5-length(src)%%5))
src <- c(rbind(matrix(src, nrow=5), '')) 
writeLines(src, 'main_0.R')
# libs
libs <- sort(unique(libs))
src  <- c('libs <- c(', 
           paste0('  "', libs, '"', collapse=",\n"), 
          ')',
          'status <- rep(NA, length(libs)); names(status) <- libs',
          'pkgs   <- installed.packages()[,1]',
          'for (lib in libs) {',
          '  if (lib %in% pkgs) {',
          '    status[lib] <- TRUE',
          '  } else { ',
          '    try(install.packages(lib), silent=TRUE)',
          '    pkgs   <- installed.packages()[,1]',
          '    status[lib] <- (lib %in% pkgs)',
          '  }',
          '  print(status[lib])',
          '}',
          'status[!status]'
         )
writeLines(src, 'main_lib.R')
# overview
header <- c('<html><body><font style="font-family: sans-serif;"><h1 id="top">Overview of example files by functions used</h1><h3><i>Sigbert Klinke, ',
           as.character(Sys.time()), '</i></h3><table><tr><td colspan="2"><hr></td></tr><tr><td><b>Function</b></td><td><b>Example(s)</b></td></tr><tr><td colspan="2"><hr></td></tr>')
invalid <- c('c', 'for', 'function', 'if', 'length', 'library', 'return')
funb <- c()
abc  <- paste(sprintf('<a href="#%s">%s</a>', LETTERS, LETTERS), collapse=" ")
abc  <- paste('<a href="#top"><span style=\"font-size:x-large\">&uarr;</span></a>', abc,
              '<a href="#bottom"><span style=\"font-size:x-large\">&darr;</span></a>') 
ch   <- ''
for (f in sort(names(fun))) {
  valid <- grepl('^[a-zA-Z][a-zA-Z0-9_.]*', f)
  if (valid && !(f %in% invalid)) {
    if (ch != toupper(substr(f,1,1))) {
      ch   <- toupper(substr(f,1,1))
      funb <- c(funb, sprintf('<tr><td><b id="%s">%s</b></td><td>%s</td></tr><tr><td colspan="2"><hr></td></tr>', ch, ch, abc))
    }
    funs       <- strsplit(fun[[f]], '/', fixed=TRUE)
    last_elems <- unlist(lapply(funs, tail, n = 1L))
    o          <- order(last_elems)
    funl       <- paste(sprintf('<a href="https://shinyapps.wiwi.hu-berlin.de/examples/?P=%s">%s</a>', fun[[f]][o], last_elems[o]), collapse=" &bull; ")
    funb       <- c(funb, sprintf('<tr valign="top"><td><a href="https://www.rdocumentation.org/q=%s"><b>%s</b></a></td><td>%s<td></tr><tr><td colspan="2"><hr></td></tr>', f, f, funl))
  }
}
footer <- c('</table><p id="bottom"></font></body></html>')
writeLines(c(header, funb, footer), 'overview.html')