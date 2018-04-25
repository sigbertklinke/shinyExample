set.seed(0)
library("foreign")
x <- read.spss("BANK2.sav", to.data.frame=T)

pdf("pca_proj.pdf", width=10, height=6)
np  <- 3
col <- rainbow(3)
layout(matrix(c(1,1,1,2,2,1,1,1,3,3,1,1,1,4,4), 3, 5, byrow=T))
tv <- var(x$UPPER)+var(x$DIAGONAL)
rg <- range(x$UPPER)
xb <- colMeans(cbind(x$UPPER, x$DIAGONAL))
plot(x$UPPER, x$DIAGONAL, pch=19, main=sprintf("Total variance: %.2f", tv))
alpha <- vector("list", np)
for (i in 1:np) {
  alphai <- rnorm(2)
  alpha[[i]] <- alphai/sqrt(sum(alphai^2))
  t     <- (rg-xb[1])/alphai[1]
  lines(rg, xb[2]+alphai[2]*t, lwd=2, col=col[i])
}
for (i in 1:np) {
  xta   <- cbind(x$UPPER, x$DIAGONAL)%*%alpha[[i]]
  dns   <- density(xta)
  plot(dns, main=sprintf("Variance: %.2f", var(xta)), sub=sprintf("Explained variance: %.0f%%", var(xta)/tv*100))
  polygon(dns, col=col[i], border="black")
  rug(xta)
}
dev.off()