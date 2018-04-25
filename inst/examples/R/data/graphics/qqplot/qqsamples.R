set.seed(0)
n <- 50  
  
x1 <- scale(rnorm(n))
x2 <- scale(rnorm(5*n))
x3 <- scale(rchisq(n, 3))
x4 <- scale(rt(n, 7))
x5 <- scale(c(rnorm(n/2, mean=-2, sd=1), rnorm(n/2, mean=4, sd=1)))

breaks <- seq(-3, 4.5, 0.5)


pdf("qqsamples.pdf", width=10, height=6)
par(mfrow=c(2,5), mar=c(0.5,0,2,0))
hist(x1, axes=F, main="", breaks=breaks, col="gray"); box()
hist(x2, axes=F, main="", breaks=breaks, col="gray"); box()
hist(x3, axes=F, main="", breaks=breaks, col="gray"); box()
hist(x4, axes=F, main="", breaks=breaks, col="gray"); box()
hist(x5, axes=F, main="", breaks=breaks, col="gray"); box()
qqnorm(x1, pch=19, main=sprintf("Normal (n=%.0f)", n), axes=F); qqline(x1); box()
qqnorm(x2, pch=19, main=sprintf("Normal (n=%.0f)", 5*n), axes=F); qqline(x2); box()
qqnorm(x3, pch=19, main="Right skewed", axes=F); qqline(x3); box()
qqnorm(x4, pch=19, main="Fat tails", axes=F); qqline(x4); box()
qqnorm(x5, pch=19, main="Bimodal", axes=F); qqline(x5); box()
dev.off()