dev.off <- pdf <- postscript <- png <- bmp <- jpeg <- tiff <- function(...) {invisible(NULL)}
source <- function(file, ...) { file <- list.files(path="..", pattern=file, recursive=TRUE, full.names=TRUE)[1]; cat(file, "
"); base::source(file=file, ...)}
grDevices::pdf("examples_test_graphics_R00480004801533894841307.pdf", width=7.0, height=7.0)
cat("<!--START-->\n")
x <- runif(20)
y <- runif(20)
cbind(x,y)
plot (x, y)

#<!--END-->
grDevices::dev.off()
