library("scatterplot3d")

x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]

pdf("regrmodel.pdf", width=10, height=4)
par(mfrow=c(1,2))
sunflowerplot(x$educ, x$lwage, digits=2, xlab="Education (in years)", ylab="log(wage)", main="Sunflower plot of CPS 1985 data")
seqeduc <- seq(min(x$educ), max(x$educ), by=1)

# estimate quadratic model 
lr2  <- lm (lwage~educ+I(educ^2), data=x)
yhat <- lr2$coefficients[1]+lr2$coefficients[2]*seqeduc+lr2$coefficients[3]*seqeduc^2
lines(seqeduc, yhat, lwd=2, col="blue")
shat <- sqrt(mean(lr2$residuals^2))

r <- (-80:80)/20
rd <- dnorm(r, 0, shat)
s3d <- scatterplot3d(x$educ, x$lwage, rep(0, length(x$lwage)), pch=19, color="gray", zlim=c(0,1), ylim=c(0,4), xlab="Education (in years)", ylab="log(wage)", zlab="", main="Regression model")
s3d$points3d(seqeduc, yhat, rep(0, length(seqeduc)), lwd=2, type="l", col="blue")
s3d$points3d(seqeduc, yhat, rep(max(rd), length(seqeduc)),  type="l")
for (i in seq(1, length(seqeduc), by=5)) {
  x <- rep(seqeduc[i], length(r))
  y <- yhat[i]+r
  z <- rd
  tf <- (y>0) & (y<4)
  s3d$points3d(x[tf], y[tf], z[tf], lwd=1, type="l")
  x <- rep(seqeduc[i], length(r))
  y <- yhat[i]+r
  z <- rep(0, length(r))
  tf <- (y>0) & (y<4)
  s3d$points3d(x[tf], y[tf], z[tf], lwd=1, type="l")
  s3d$points3d(c(seqeduc[i],seqeduc[i]), c(yhat[i], yhat[i]), c(0, max(rd)), lwd=1, type="l")
}
dev.off()