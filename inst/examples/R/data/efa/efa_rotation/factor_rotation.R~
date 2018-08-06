library("MASS")
set.seed(150742)
n   <- 20
mu  <- c(0,0,0)
Sig <- matrix(c(1,0.7,0,0.7,1,0,0,0,1), ncol=3)
x   <- mvrnorm(n, mu, Sig)
#r  <- runif(n)
#t  <- 2*pi*runif(n)
#x  <- cbind(r*cos(t), r*sin(t))
#x  <- cbind(x, x[,1]^2+x[,2]^2+0.1*rnorm(n))
z  <- scale(x)

ev <- eigen(cov(z), symmetric=T)
#ev$vectors[,1]<- -ev$vectors[,1]
#ev$vectors[,2]<- -ev$vectors[,2]

# projected data points
pt2 <- z%*%ev$vectors

pdf("factor_rotation.pdf", width=10, height=6)
par(mfrow=c(1,2))
s3d <- scatterplot3d(z, pch=19, color=ifelse(pt2[,3]<0,"grey", "black"), xlab="", ylab="", zlab="",
										 main="Principal component plane (q=2)", asp=T,
										 sub="black: before plane, grey: behind plane, blue: projected on plane")
pt3 <- outer(pt2[,1], ev$vectors[,1])+outer(pt2[,2], ev$vectors[,2])
s3d$points3d(pt3, col="blue", pch=19)
for (i in 1:nrow(z)) {
	p2 <- s3d$xyz.convert(pt3[i,1],pt3[i,2],pt3[i,3])
	p3 <- s3d$xyz.convert(z[i,1],z[i,2],z[i,3])
	segments(p2$x,p2$y,p3$x,p3$y,lwd=1,col="lightblue")
}

# plane
ptr2 <- 1.1*cbind(c(min(pt2[,1]), max(pt2[,1]), max(pt2[,1]), min(pt2[,1])),
									c(min(pt2[,2]), min(pt2[,2]), max(pt2[,2]), max(pt2[,2])))
ptr3 <- outer(ptr2[,1], ev$vectors[,1])+outer(ptr2[,2], ev$vectors[,2])
pr   <- s3d$xyz.convert(ptr3[,1], ptr3[,2], ptr3[,3])
polygon(pr, border="blue")
# axes
ptr2 <- 1.1*cbind(c(0, 0, max(pt2[,1]), min(pt2[,1])),
									c(min(pt2[,2]), max(pt2[,2]), 0, 0))
ptr3 <- outer(ptr2[,1], ev$vectors[,1])+outer(ptr2[,2], ev$vectors[,2])
pr   <- s3d$xyz.convert(ptr3[,1], ptr3[,2], ptr3[,3])
lines(pr$x[1:2], pr$y[1:2], col="blue")
lines(pr$x[3:4], pr$y[3:4], col="blue")

## rotate axes in the plane
phi <- pi/10
ptr3 <- 2*rbind(c(0,0,0),
						  	ev$vectors[,1]*cos(phi)+ev$vectors[,2]*sin(phi),
							  -ev$vectors[,1]*sin(phi)+ev$vectors[,2]*cos(phi))
pr   <- s3d$xyz.convert(ptr3[,1], ptr3[,2], ptr3[,3])
lines(pr$x[1:2], pr$y[1:2], col="red")
lines(pr$x[-2], pr$y[-2], col="red")

## show projected data points
plot(pt2, xlab="", ylab="", pch=19, col="blue", main="Projected data points", ylim=c(-2.5, 2))
abline(h=0, col="blue")
abline(v=0, col="blue")

pt2r <- cbind(pt2[,1]*cos(phi)+pt2[,2]*sin(phi), -pt2[,1]*sin(phi)+pt2[,2]*cos(phi))
points(pt2r, xlab="", ylab="", pch=19, col="coral")
abline(h=0.01, col="red")
abline(v=0.01, col="red")
dev.off()
