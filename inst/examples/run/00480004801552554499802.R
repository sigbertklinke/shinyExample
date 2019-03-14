dev.off <- pdf <- postscript <- png <- bmp <- jpeg <- tiff <- function(...) {invisible(NULL)}
source <- function(file, ...) { file <- list.files(path="..", pattern=file, recursive=TRUE, full.names=TRUE)[1]; cat(file, "
"); base::source(file=file, ...)}
grDevices::pdf("00480004801552554499802.pdf", width=7.0, height=7.0)
cat("<!--START-->\n")

#<!--END-->
grDevices::dev.off()
