pdf("quantile.pdf", width=10, height=6)
ng <- c(5,10)
par(mfrow=c(length(ng),1), mar=c(2.5,0,2,0))
for (i in 1:length(ng)) {
  n <- ng[i] 
  plot(0,0, type="n", xlim=c(0,1), ylim=c(1,7), axes=F, xlab="Quantil", main=sprintf("n=%i", n))
  axis(1)
  rang <- 1:n
  ecdf    <- rang/n
  r       <- (rang-1)/(n-1)
  blom    <- (rang-3/8)/(n+1/4)
  rankit  <- (rang-1/2)/n
  tukey   <- (rang-1/3)/(n+1/3)
  waerden <- rang/(n+1)
  points(ecdf, rep(1, n), pch=19)
  text(0.5,1.5, "ECDF")
  points(r, rep(2, n), pch=19)
  text(0.5,2.5, "R (type=7)")
  points(rankit, rep(3, n), pch=19)
  text(0.5,3.5, "Rankit")
  points(blom, rep(4, n), pch=19)
  text(0.5,4.5, "Blom")
  points(tukey, rep(5, n), pch=19)
  text(0.5,5.5, "Tukey")
  points(waerden, rep(6, n), pch=19)
  text(0.5,6.5, "Van der Waerden")
  for (j in 0:10) { abline(v=j/10, col="grey", lty=2)}
  box()
}
dev.off()