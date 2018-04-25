library("MASS") # for Boston Housing data
library("scagnostics")
data <- Boston[,c(-4, -9)]
s    <- scagnostics(data)
s
g    <- scagnosticsGrid(s)
# extract max. scagnostics value and plot
plots <- apply(s==max(s), 2, any)
gps   <- g[plots,]
for (i in 1:nrow(gps)) {
  xi <- gps$x[i]
  yi <- gps$y[i]
  plot(data[,xi], data[,yi],
       xlab=names(data)[xi], ylab=names(data)[yi])
}