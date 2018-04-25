set.seed(1964)
n <- 100
x <- c(rnorm(n), 3+rnorm(n))

# ash.pdf
nbin <- 20
library("ash")
pdf("ash.pdf", bg="transparent", width=10, height=6)
par(mfrow=c(1,2))
b <- bin1(x, nbin=nbin)
b0 <- b
b0$nc <- rep(0, nbin)
b0$nc[nbin/2] <-1
f0 <- ash1(b0)
plot(f0, type="s", main="Binned kernel (m=5)", xlab="", ylab="")
f<-ash1(b)
plot(f, type="s", main="Average shifted histogram", xlab="", ylab="")
dev.off()