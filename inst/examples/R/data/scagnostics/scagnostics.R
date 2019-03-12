library("MASS") # for Boston Housing data
library("scagnostics")
library("plot.matrix")
data <- Boston[,c(-4,-9)]
scag <- unclass(scagnostics(data))
pdf("scagnostics_heatmap.pdf", width=10, height=6)
par(mar=c(6.1, 5.1, 4.1, 4.1)) # adapt margins
plot(scag, main="Scagnostic measures of Boston Housing data", breaks=c(0,1), col=topo.colors, fmt.key='%.1f',
     xlab="", ylab="", axis.col=list(las=2, cex.axis=0.8), axis.row=list(las=1))
dev.off()