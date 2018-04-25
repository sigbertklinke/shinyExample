set.seed(1964)
x <- c(rnorm(100), 3+rnorm(100))

# histogram.pdf
pdf("histogram.pdf", bg="transparent")
par(mfrow=c(2,2))
diff=2
breaks=seq(-6, 6, diff)
hist(x, breaks, xlab=sprintf("origin=%.1f, width=%.1f", breaks[1], diff))
breaks=breaks+diff/4
hist(x, breaks, xlab=sprintf("origin=%.1f, width=%.1f", breaks[1], diff))
breaks=breaks+diff/4
hist(x, breaks, xlab=sprintf("origin=%.1f, width=%.1f", breaks[1], diff))
breaks=breaks+diff/4
hist(x, breaks, xlab=sprintf("origin=%.1f, width=%.1f", breaks[1], diff))
dev.off()
