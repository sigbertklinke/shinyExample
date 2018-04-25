bracket <- function (y1, y2, x=1.25, xh=0.025, yh=0.025) {
  ym <- (y1+y2)/2
  lines(c(x,  x+xh/2,  x+xh/2,  x+xh, x+xh/2,  x+xh/2,  x),
        c(y1, y1+yh/2, ym-yh/2, ym,   ym+yh/2, y2-yh/2, y2))
}

set.seed(60214)
n <- 100
x <- rt(n,5)

pdf("boxplot.pdf")
bw <- boxplot(x)
text(0.5, bw$stats[1], "lower fence", pos=4)
text(0.75, (bw$stats[1]+bw$stats[2])/2, "lower whisker", pos=4)
text(0.5, bw$stats[2], "1. quartile", pos=4)
text(0.5, bw$stats[3], "median", pos=4)
text(0.5, bw$stats[4], "3. quartile", pos=4)
text(0.75, (bw$stats[4]+bw$stats[5])/2, "upper whisker", pos=4)
text(0.5, bw$stats[5], "upper fence", pos=4)


text(1.5, (bw$stats[5]+max(x))/2, "Extremes", pos=2)
text(1.5, (bw$stats[1]+min(x))/2, "Extremes", pos=2)
text(1.5, (bw$stats[1]+bw$stats[2])/2, "max. 1.5 IQR", pos=2)

bracket(bw$stats[1], bw$stats[2], yh=0.25)
text(1.5, (bw$stats[2]+bw$stats[4])/2, "IQR", pos=2)
bracket(bw$stats[2], bw$stats[4], yh=0.25)
text(1.5, (bw$stats[4]+bw$stats[5])/2, "max. 1.5 IQR", pos=2)
bracket(bw$stats[4], bw$stats[5], yh=0.25)
dev.off()


pdf("boxplot_norm.pdf", width=10, height=6)
x <- seq(-4,+4,0.001)
y <- dnorm(x)

par(mar=c(0,0,3,0))
plot(x,y, type="l", main=expression(paste("N(",mu,";",sigma^2,")",seq="")), ylim=c(-0.35,0.4), axes=F)
lines(range(x), c(0,0))

x25 <- qnorm(0.25)
x75 <- qnorm(0.75)
xi <- x25-1.5*(x75-x25)
xa <- x75+1.5*(x75-x25)
xp <- x[(x>xi)&(x<xa)]
yp <- y[(x>xi)&(x<xa)]
polygon(c(min(xp), xp, max(xp)), c(0,yp,0))

xp <- x[(x>x25)&(x<x75)]
yp <- y[(x>x25)&(x<x75)]
polygon(c(min(xp), xp, max(xp)), c(0,yp,0))

text(-3.5, 0.05, "0.35%", pos=4)
text(-1.5, 0.05, "24.65%")
text(0, 0.05, "50.00%")
text(1.5, 0.05, "24.65%")
text(+3.5, 0.05, "0.35%", pos=2)

lines(c(x25,x75,x75,x25,x25), c(-0.01, -0.01, -0.05, -0.05, -0.01))
lines(c(0,0), -c(0.01, 0.05))
lines(c(xi,x25), -c(0.03, 0.03))
lines(c(xi,xi), -c(0.02, 0.04))
lines(c(x75,xa), -c(0.03, 0.03))
lines(c(xa,xa), -c(0.02, 0.04))

n <- c(100, 200, 500)
for (i in seq(n)) {
  x <- rnorm(n[i])
  text(-4,-0.1*i-0.025, sprintf("n=%.0f", n[i]), pos=4)
  col <- ifelse(abs(x)>xa, "red", "black")
  points(x, -0.1*i-0.05*runif(n[i]), pch=19, cex=0.5, col=col)
}

dev.off()
