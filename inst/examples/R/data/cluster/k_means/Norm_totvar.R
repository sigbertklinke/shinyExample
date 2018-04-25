diff <- 0:3
n    <- 100
col  <- c("blue", "red")
pdf("Norm_totvar.pdf", width=10, height=7)
par(mfrow=c(2,2)) #, mar=c(2,2,2,2))
for (i in seq(diff)) {
  x1     <- matrix(rnorm(2*n), nr=n)
  x1[,1] <- x1[,1] + diff[i]
  x2     <- matrix(rnorm(2*n), nr=n)
  x2[,1] <- x2[,1] - diff[i]
  x      <- rbind(x1, x2)
  cl     <- kmeans(x, 2)
  plot(x, col=col[cl$cluster], pch=19, axes=F, ylab="", main="Data", xlab=sprintf("Tot.Var. explained %.0f%%", 100*cl$betweenss/cl$totss))
  box()
}
dev.off()

ci <- cv <- 1:10
for (i in ci) {
  cl <- kmeans(x, i)
  cv[i] <- cl$betweenss/cl$totss
}
pdf("Norm_totvar2.pdf", width=10, height=7)
par(mfrow=c(1,1)) 
plot(ci, cv, type="b", xlab="Number of clusters", ylab="Total variance")
dev.off()