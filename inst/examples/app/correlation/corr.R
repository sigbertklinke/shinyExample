library("mvtnorm")
n <- value(input$n)
r <- value(input$r)
repeat{
  out <- rmvnorm(n, mean = c(0,0), sigma = matrix(c(1,r,r,1), ncol=2))
  rr  <- cor(out)[1,2]
  if (abs(rr-r)<0.002) break
}
plot(out, pch=19, xlim=c(-3,3), ylim=c(-3,3), asp=TRUE, axes=FALSE, xlab="x", ylab="y",
     main=sprintf("Korrelation: %.2f", rr), cex=1/log10(n))
box()
