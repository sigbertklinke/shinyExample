library("MASS") # for Boston Housing data
library("scagnostics")
library("gplots")
data <- Boston[,c(-4,-9)]
scag <- scagnostics(data)
pdf("scagnostics.pdf", width=10, height=6)
heatmap.2(scag, main="Scagnostic measures of Boston Housing data", scale="row", col="topo.colors")
dev.off()