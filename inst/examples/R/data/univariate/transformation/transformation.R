plottrf <- function(x) {
  plotdata <- function(xt, ...) {
    require("e1071")
    plot(density(xt), axes=F,  ...)
    rug(xt)
    ks <- ks.test(xt, "pnorm", m=mean(xt), sd=sd(xt))
    usr <- par("usr")
    xpos <- usr[2]-0.1*diff(usr[1:2])
    ypos <- usr[4]-(0:3)/10*diff(usr[3:4])
    labels=c(sprintf("m  = %+.2f", mean(xt)), sprintf("s  = %+.2f", sd(xt)), 
             sprintf("sk = %+.2f", skewness(xt)), labels=sprintf("D  = %+.2f", ks$statistic))
    par(family = "mono")
    if (skewness(xt)>0) pos<-"topright" else pos<-"topleft"
    legend(pos, legend=labels, cex=0.75)
    box()
  }
  par(mfrow=c(2,4), mar=c(0,0,3,0))
  plotdata(1/x, main=expression(paste("1/", x)))
  plotdata(1/sqrt(x), main=expression(paste("1/", sqrt(x))))
  plotdata(log(x), main=expression(log(x)))
  plotdata(sqrt(x), main=expression(sqrt(x)))
  plotdata(x, main=expression(x))
  plotdata((x-mean(x))/sd(x), main=expression((x-bar(x))/ s))
  plotdata(x^2, main=expression(x^2))
  plotdata(x^3, main=expression(x^3))

}

n <- 100
x <- 1+qbeta((0.5+(0:n))/(n+1), 2, 2)
pdf("trf_symmetric.pdf", width=10, height=7)
plottrf(x)
dev.off()
xt <- x^3
pdf("trf_right.pdf", width=10, height=7)
plottrf(xt)
dev.off()
xt <- log(x)-min(log(x))+1
pdf("trf_left.pdf", width=10, height=7)
plottrf(xt)
dev.off()
xt <- cbind(x, x+1)
pdf("trf_bimodal.pdf", width=10, height=7)
plottrf(xt)
dev.off()