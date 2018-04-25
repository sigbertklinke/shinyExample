set.seed(0)

n   <- 25
x   <- rnorm(n)
hx  <- hist(x, plot=F)
pdf("histogram.pdf")
hist (x, ylim=c(-1,max(hx$counts)))
points(x, jitter(rep(-0.5, n), amount=0.5), pch=19)
for (i in 1:length(hx$counts)) {
  for (j in 0:hx$counts[i]) {
    lines(hx$breaks[i:(i+1)], c(j,j))
  } 
}
dev.off()