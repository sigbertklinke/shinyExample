dev.off <- pdf <- postscript <- png <- bmp <- jpeg <- tiff <- function(...) {invisible(NULL)}
source <- function(file, ...) { file <- list.files(path="..", pattern=file, recursive=TRUE, full.names=TRUE)[1]; cat(file, "
"); base::source(file=file, ...)}
grDevices::pdf("noprg_R00480004800000000000000.pdf", width=7.0, height=7.0)
cat("<!--START-->\n")
"Please select a file"
#<!--END-->
grDevices::dev.off()
