nx <- seq(0,1,length.out=25)
ny <- seq(0,1,length.out=25)
z <- matrix(NA, ncol=length(nx), nrow=length(ny))
for (i in seq(nx)) {
  for (j in seq(ny)) {
    if (nx[i]+ny[j]<=1) {
      z[i,j] <- 1-nx[i]^2-ny[j]^2-(1-nx[i]-ny[j])^2
    }
  }
}
pdf("gini3.pdf", width=10, height=5)
par(mfrow=c(1,2))
persp(nx, ny, z, xlab="p1", ylab="p2", zlab="G", phi=45, theta=55)
contour(nx, ny, z, xlab="p1", ylab="p2")
dev.off()