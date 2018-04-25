n <- c(5,10,15)

pdf("mannwhitneyu_r1.pdf", width=10, height=6)
par(mfrow=c(3, 5), mar=c(0,0,2,0))
for (i in seq(n)) {
  g  <- expand.grid(rep(list(0:1), n[i]))
  nm <- n[i]%/%2
  for (j in 1:nm) {
    n1 <- j
    n2 <- n[i]-j
    gj <- g[apply(g, 1, sum)==j,]
    rj <- t(gj)*seq(n[i])
    rs <- table(apply(rj, 2, sum))
    r1 <- rs/sum(rs)
    print(r1)
    col <- rep('black', length(r1))
    lvl <- (cumsum(r1)<0.10000001)
    col[lvl|rev(lvl)] <- 'green'
    lvl <- (cumsum(r1)<0.05000001)
    col[lvl|rev(lvl)] <- 'blue'    
    lvl <- (cumsum(r1)<0.02500001)
    col[lvl|rev(lvl)] <- 'red'
        plot(r1, axes=F, main=sprintf("n1=%.0f, n2=%.0f", n1, n2), ylim=c(0, 0.2), col=col)
  }
}
plot(0,0, type="n", axes=F, main="Distribution of R1")
legend("top", legend=sprintf("alpha=%.0f%%", c(5, 10, 20)), title="reject H0 of Mann-Whitney U", col=c('red', 'blue', 'green'), lwd=2)
dev.off()