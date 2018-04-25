library("cluster")
diff <- 0:3
n    <- 100
col  <- c("blue", "red")
png("norm_silhouette.png", width=1600, height=1024)
par(mfcol=c(3, length(diff))) #, mar=c(2,2,2,2))
for (i in seq(diff)) {
  x1     <- matrix(rnorm(2*n), nr=n)
  x1[,1] <- x1[,1] + diff[i]
  x2     <- matrix(rnorm(2*n), nr=n)
  x2[,1] <- x2[,1] - diff[i]
  x      <- rbind(x1, x2)
  d      <- dist(x)
  hc     <- hclust(d)
  c2     <- cutree(hc, k=2)
  si2    <- silhouette(c2, d)
  plot(x, col=col[c2], pch=19, axes=F, xlab="", ylab="", main="Data")
  box()
  plot(hc, hang = -1)
  plot(si2)
}
dev.off()
