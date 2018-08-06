library("rmarkdown")
library("stringi")
funs  <- matrix('', nrow=0, ncol=2)
lof   <- list.files(path='R', pattern='*.R$', full.names=TRUE, recursive=TRUE)
valid <- (stri_enc_mark(lof)=="ASCII")
nvf   <- sum(!valid)
lof   <- lof[valid]
for (i in 1:length(lof)) {
  if (valid[i]) {
    cat(sprintf("%.0f/%.0f\n", i, length(lof)))
    source <- try(parse(lof[i]), silent=TRUE)
    funi   <-  setdiff(all.names(source, unique=TRUE), all.vars(source))
    funs   <- rbind(funs, cbind(rep(lof[i], length(funi)), funi))
  }
}
funi <- tapply(funs[,1], funs[,2], function(v) {v})
funn    <- names(funi)
valid   <- grepl('^[a-zA-Z][a-zA-Z0-9_.]*', funn)
invalid <- c('c', 'for', 'function', 'if', 'length', 'library', 'return')
for (iv in invalid) {
  pos <- which(funn==iv)
  if (length(pos)) valid[pos] <- FALSE
}
text  <- c("#' ---", "#' title: Overview of example files by functions used", "#' author: Sigbert Klinke",  "#' date: \"`r format(Sys.time(), '%d %B %Y')`\"",
          "#' output:", "#'    html_document:", "#'      toc: true", "#'      highlight: zenburn", "#' ---",
          sprintf("#' Example files with non-ASCII filenames: %0.f, Ignored R functions: %0.f", nvf, length(invalid)), "#' ",
          "#' Function | Examples",
          "#' ---------|---------------------------------------------------------------------------------------------------")
ch <- ''
for (i in 1:length(funi)) {
  if (valid[i]) {
    funs <- strsplit(funi[[funn[i]]], '/', fixed=TRUE)
    last_elems <- unlist(lapply(funs, tail, n = 1L))
    o    <- order(last_elems)
    second_elems <- sapply(funs, function(v) { paste0(v[-1], collapse="/") })
    if (ch != toupper(substr(funn[i],1,1))) {
      ch     <- toupper(substr(funn[i],1,1))
      text   <- c(text, paste0(c(sprintf("#' <span id='%s'>__%s__</span> | [<span style=\"font-size:x-large\">&uarr;</span>](#top)", ch, ch),
                                 sprintf("[%s](#%s)", LETTERS, LETTERS),
                                 "[<span style=\"font-size:x-large\">&darr;</span>](#bottom)"),
                               collapse=" "))
    }
    text <- c(text,
              paste(sprintf("#' __[%s](https://www.rdocumentation.org/search?q=%s)__ |", funn[i], funn[i]),
              paste(sprintf("[%s](.?P=%s)", last_elems[o], second_elems[o]), collapse=" ")
                                ))
  }
}
text <- c(text, "#' <a id=\"bottom\"></a>")
writeLines(text, 'overview.R')
render('overview.R', output_dir="www")

