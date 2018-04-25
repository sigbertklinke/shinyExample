pdf("HolyTrinity2.pdf", width=12, height=6)
par(mfcol=c(1,2),mar=c(0,0,0,0))
fun  <- function(x, y) { return ( 1-x^2-y^2); }
dfun <- function(x, y) { return ( c(-2*x, -2*y)); }

ln <- 10
x  <- (-ln:ln)/ln
y  <- (-ln:ln)/ln
xr <- 0.6
z <- outer(x, y, fun)

tm <- persp(x, y, z, border=NA, col=NA, axes=F, phi=45, theta=40, r=2)
for (xi in x) {
	yk <- (-50:50)/50
	xk <- rep(xi, length(yk))
	zk <- fun(xk, yk)
	z0 <- rep(min(z), length(yk))
	lines(trans3d(xk, yk, zk, tm), col=ifelse(xi==xr, "blue", "gray"))
}
for (yi in y) {
	xk <- (-50:50)/50
	yk <- rep(yi, length(yk))
	zk <- fun(xk, yk)
	z0 <- rep(min(z), length(yk))
	lines(trans3d(xk, yk, zk, tm), col="gray")
}
t1 <- trans3d(0,0,fun(0,0), tm)
t0 <- trans3d(xr,0, fun(xr,0), tm)	
ti <- trans3d(xr,0, fun(0,0), tm)
tj <- trans3d(xr,0, mean(c(fun(0,0),fun(xr,0))), tm)

points(t1, col="black", pch=19, cex=0.75)
points(t0, col="blue", pch=19, cex=0.75)
lines(mapply(c,t1,ti), col="black")
arrows(t0$x, t0$y, ti$x, ti$y, code=3, col="#FF6666", length=0.1)
text(tj, "Likelihoodratio test", col="#FF6666", pos=4)
#
grad <- dfun(xr,0)
dt   <- 0.25
dg   <- trans3d(xr+dt*grad[1], dt*grad[2], fun(xr, 0), tm)
arrows(t0$x, t0$y, dg$x, dg$y, col="#FF6666", length=0.1)
text(mean(c(t0$x, dg$x)), t0$y, "Score test", col="#FF6666", pos=2)
box()

# contour plot
contour(x, y, z, axes=F, asp=T, col="gray")
lines(c(xr, xr), c(-1,1), col="blue")
points(0,0, pch=19, col="black", cex=0.75)
points(xr,0, pch=19, col="blue", cex=0.75)
text(0,0, expression(hat(theta)[1]), pos=3)
text(xr,0, expression(hat(theta)[0]), pos=4, col="blue")
points(-0.05,-0.2, pch=19, col="red", cex=0.75)
text(-0.05,-0.2, expression(theta), pos=1, col="red")
arrows(-0.05,-0.2, xr, 0, code=3, col="#FF6666", length=0.1)
text(mean(c(-0.05, xr)), mean(c(-0.25, 0)), "Wald test", col="#FF6666", pos=1)
#
grad <- dfun(xr,0)
arrows(xr, 0, xr+0.25*grad[1], grad[2], col="#FF6666", length=0.1)
text(mean(c(xr, xr+0.25*grad[1])), 0, " Score test", col="#FF6666", srt=90, pos=4)
box()
dev.off()
