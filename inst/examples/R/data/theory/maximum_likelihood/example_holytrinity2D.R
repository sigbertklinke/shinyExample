x <- (-15:15)/5
dx <- dnorm(x)
z <- outer(dx,dx)
# draw unrestricte likeihood
res <- persp(x,x,z, axes=F, box=F, theta=135, phi=30, border="lightblue")
# draw floor
for (i in seq(x)) {
  lines (trans3d(x, x[i], rep(0, length(x)), pmat = res), col = "lightgrey", lwd=1)
  lines (trans3d(x[i], x, rep(0, length(x)), pmat = res), col = "lightgrey", lwd=1)
}
# draw restricted likelihood
pos <- trunc(length(x)*0.7)
y1  <- x[pos]
d1  <- z[,pos]
lines (trans3d(x, y1, d1, pmat = res), col = "green", lwd=2)
# vertical lines
lines (trans3d(c(0,0), c(0,0), c(0, max(dx)^2), pmat = res), col = "blue", lwd=1)
lines (trans3d(c(0,0), c(y1,y1), c(0, max(d1)), pmat = res), col = "green", lwd=1)

# Wald test
lines (trans3d(c(0,0), c(0,y1), c(0,0), pmat = res), lwd=2)
points(trans3d(0, 0, 0, pmat=res), col="blue", pch=19)
points(trans3d(0, y1, 0, pmat=res), col="green", pch=19)
text(trans3d(0, 0, 0, pmat=res), "Wald test (distance)", pos=4)

# LR test
lines (trans3d(c(0,0), c(0,y1), c(max(d1),max(d1)), pmat = res), lwd=2, col="grey")
lines (trans3d(c(0,0), c(0,0), c(max(d1),max(dx)^2), pmat = res), lwd=2, col="black")
text(trans3d(0, 0, mean(c(max(d1),max(dx)^2)), pmat=res), "Likelihoodratio test\n(height)", pos=2)
points(trans3d(0, 0, max(dx)^2, pmat=res), col="blue", pch=19)
points(trans3d(0, y1, max(d1), pmat=res), col="green", pch=19)
points(trans3d(0, 0, max(d1), pmat=res), col="grey", pch=19)

# Score test
dfy1 <- x[pos-1]
dfy2 <- x[pos+1]
dfz1 <- max(z[,pos-1])
dfz2 <- max(z[,pos+1])
lines (trans3d(c(0,0), c(dfy1,dfy2), c(dfz1,dfz2), pmat = res), col = "black", lwd=2)
text(trans3d(0, dfy1, dfz1, pmat=res), "Score test (derivatives)", pos=4)

# parameters
points(trans3d(y1/2, y1/3, 0, pmat=res), col="black", pch=19)
text(trans3d(y1/2, y1/3, 0, pmat=res), labels=expression(theta), col="black", pos=1)
text(trans3d(0, y1, 0, pmat=res), labels=expression(hat(theta)[0]), col="black", adj=c(-0.5,1))
text(trans3d(0, 0, 0, pmat=res), labels=expression(hat(theta)[1]), col="black", adj=c(1.5,0))
text(trans3d(max(x), y1, 0, pmat=res), labels=expression(theta[0]), col="green", pos=1)


# legends
legend("bottomright", c("unrestricted (L1)", "restricted (L0)"), title="Likelihood", col=c("lightblue", "green"), lwd=1, cex=0.9)
true <- expression(paste("true (", theta, ")"))
est1 <- expression(paste("estimated with L1 (", hat(theta)[1], ")"))
est0 <- expression(paste("estimated with L0 (", hat(theta)[0], ")"))
legend("bottomleft", c(true, est1, est0), title="Parameter", col=c("black", "blue", "green"), pch=19, cex=0.9)