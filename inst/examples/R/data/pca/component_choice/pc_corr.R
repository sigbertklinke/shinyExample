plot.matrix <- function(x, y, digits=NA, col=heat.colors(12), breaks=NULL, key=TRUE, ...) {
  rowindex <- 1:nrow(x)
  colindex <- 1:ncol(x)
  cn <- colnames(x)
  if (is.null(cn)) cn <- as.character(colindex)
  rn <- rownames(x)
  if (is.null(rn)) rn <- as.character(rowindex)
  if (is.null(breaks)) {
    breaks <- seq(from=min(x), to=max(x), length.out=length(col)+1)
  } else {
    if ((length(breaks)+1)!=length(col)) 
      breaks <-seq(from=min(breaks), to=max(breaks), length.out=length(col)+1)
  }
  #
  args <- list(...)
  args$x    <- c(0.5, ncol(x)+0.5)
  args$y    <- c(0.5, nrow(x)+0.5)
  args$type <- 'n'
  if (is.null(args$axes)) args$axes <- FALSE
  if (is.null(args$xlab)) args$xlab <- ''
  if (is.null(args$ylab)) args$ylab <- ''  
  if (is.null(args$xlim)) args$xlim <- c(0.5, nrow(x)+0.5+key)
  if (is.null(args$ylim)) args$ylim <- c(0.5, ncol(x)+0.5)
  if (is.null(args$xaxs)) args$xaxs <- 'i'
  if (is.null(args$yaxs)) args$yaxs <- 'i'
  do.call('plot', args)
  for (i in rowindex) {
    for (j in colindex) {
      xij <- x[ncol(x)-j+1,i]
      k <- findInterval(xij, breaks)
      polygon(c(i-0.5, i-0.5, i+0.5, i+0.5), c(j-0.5, j+0.5, j+0.5, j-0.5), col=col[k])
      if (!is.na(digits)) {
        text(i,j, sprintf('%+.*f', digits, xij))
      }
    }
  }
  #box()
  axis(1, at=colindex, labels = cn, las=1)
  axis(2, at=rowindex, labels = rev(rn), las=1)
  if (key) {
    at <- 1+(nrow(x)-1)*(0:(length(breaks)-1))/(length(breaks)-1)
    axis(4, at=at, las=1,
         labels=sprintf('%+.*f', digits, breaks))
    for (i in 1:(length(breaks)-1)) {
      polygon(c(ncol(x)+1, ncol(x)+1, ncol(x)+1.5, ncol(x)+1.5),
              c(at[i], at[i+1], at[i+1], at[i]),
              col=col[findInterval(mean(breaks[i:(i+1)]), breaks)])
    } 
  }
}

library("rio")
x  <- import('BANK2.sav')
pc <- prcomp(x, retx=TRUE)
c  <- cor(cbind(x, pc$x))[1:6, 7:12]
library("gplots")

png("pcvarcorr.png", width=640, bg="transparent")
par(mar=c(5.1, 6.1, 4.1, 4.1))
plot(c, digits=2, col=colorRampPalette(c("blue", "white", "red"))(20), breaks=c(-1,1),
     main="Correlation")
dev.off()