set.seed(1964)
x <- c(rnorm(100), 3+rnorm(100))
col <- c(rainbow(4), "black")

pdf("KernelDensity.pdf", width=10, height="6")
d0 <- density(x)
d <- density(x, bw=0.3*d0$bw)
h <- d$bw
plot(d, col=col[1], lwd=2, main="Kernel density estimates", xlab="x", sub="thin lines: gaussian kernel for xi=1")
d <- density(x, bw=0.6*d0$bw)
h <-c(h, d$bw)
lines(d, col=col[2], lwd=2)
d <- density(x, bw=1.5*d0$bw)
h <-c(h, d$bw)
lines(d, col=col[3], lwd=2)
d <- density(x, bw=2.5*d0$bw)
h <-c(h, d$bw)
lines(d, col=col[4], lwd=2)

d <- density(x)
h <-c(h, d$bw)
lines(d, col=col[5], lwd=2)
legend("topleft", legend=sprintf("%.2f", h), col=col, lwd=2, title="Bandwidths")

x <- (-500:500)/100
for (i in seq(h)) {
  y <- 0.03*dnorm(x, mean=1, sd=h[i])
  lines(x,y, col=col[i])
}
dev.off()
