ag <- (1:1000)/10000
g  <- 2:6
pdf("bonferroni.pdf", width=6, height=6)
plot(c(0,0.1), c(0, 0.06), type="n", xlab="Global alpha (ANOVA)", ylab="Local alpha (pairwise t-test)",
		 main=expression(1-sqrt(1-alpha[G],g) %~~% alpha[G]/g))
for (i in seq(g)) {
  al1 <- 1-(1-ag)^(1/g[i])
  lines(ag, al1, col=i)
}
legend("topleft", legend=sprintf("%i comparisons", g), lwd=2, col=seq(g))
g  <- 4
ag <- 0.05
al <- 1-(1-ag)^(1/g)
lines(c(ag, ag, 0), c(0, al, al), lty="dashed")
dev.off()