addSurface <- function (plotobj, regobj, educ, exper) {
  for (i in 1:length(educ)) {
    newdata <- data.frame(educ=rep(educ[i], length(exper)), exper=exper)
    pred    <- predict(regobj, newdata=newdata)
    plotobj$points3d (newdata$educ, newdata$exper, pred, type="l", col="black")
  }
  for (i in 1:length(exper)) {
    newdata <- data.frame(educ=educ, exper=rep(exper[i], length(educ)))
    pred    <- predict(regobj, newdata=newdata)
    plotobj$points3d (newdata$educ, newdata$exper, pred, type="l", col="black")
  }
}

addContour <- function (regobj, educ, exper, ...) {
  nx <- length (educ)
  ny <- length (exper)
  z <- matrix(NA, ncol=nx, nrow=ny)
  for (i in 1:nx) {
    newdata <- data.frame(educ=rep(educ[i], length(exper)), exper=exper)
    z[i,]   <- predict(regobj, newdata=newdata)
  }
  contour(educ, exper, z, add=T, ...)
}

computeColors <- function (value, maxval, ncolor=50) {
  colpal <- colorRampPalette(c("blue", "white", "red"), space = "rgb")
  colors <- colpal(ncolor)
  colno  <- ceiling(ncolor*(maxval+value)/(2*maxval))
  colno[colno<1]      <- 1
  colno[colno>ncolor] <- ncolor
  return(colors[colno])
}

plotModel <- function (regobj, x, educ, exper, maxres, pp=list(cex=0.75), header=NULL, ...) {
# two-dimensional grid 20x20
  educ  <- seq(min(x$educ), max(x$educ), length.out=20) 
  exper <- seq(min(x$exper), max(x$exper), length.out=20) 
# plotting
  par(mfrow=c(1,2), oma=c(1,0,2,0))
  color <- computeColors(resid(regobj), maxres)
  n  <- length(x$educ)
  xr <- range(x$educ)
  yr <- range(x$exper)
  zr <- range(x$lwage)
  front <- c(T,F,T)
  resid <- resid(regobj)
  col   <- computeColors(resid, maxres)

  s3d<-scatterplot3d(xr, yr, zr, type="n", ...)
  s3d$points3d(x$educ, x$exper, rep(ifelse(front[3], zr[1], zr[2]), n), col="gray", cex=0.25)
  s3d$points3d(x$educ, rep(ifelse(front[2], yr[1], yr[2]), n), x$lwage, col="gray", cex=0.25)
  s3d$points3d(rep(ifelse(front[1], xr[1], xr[2]), n), x$exper, x$lwage,, col="gray", cex=0.25)
  s3d$points3d(x$educ[resid<0], x$exper[resid<0], x$lwage[resid<0], col=color[resid<0], pch=19, cex=0.75)
  addSurface(s3d, regobj, educ, exper)
  s3d$points3d(x$educ[resid>=0], x$exper[resid>=0], x$lwage[resid>=0], col=color[resid>=0], pch=19, cex=0.75)

  plot(x$educ, x$exper, col=color, pch=19, xlab="educ", ylab="exper",)
  addContour(regobj, educ, exper)
  if (!is.null(header)) {
    r2 <- 1-sum(resid(regobj)^2)/sum((x$lwage-mean(x$lwage))^2)
    mtext(sprintf("%s (R^2=%.3f)", header, r2), side=3, outer=T, cex=1.5)
  }
  if (!is.null(regobj$call)) { mtext(deparse(regobj$call), side=1, outer=T) }
}

library("scatterplot3d")
library("locfit")
library("np")
library("gam")

x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]

x2 <- read.table("cps85.csv", header=T)

# estimate linear model 1 (exper only linear !)
lr1 <- lm (lwage~educ+exper, data=x)
summary(lr1)
maxres <- max(abs(resid(lr1)))
#png("mincer_linreg.png", width=1280, height=800)
plotModel (lr1, x, educ, exper, maxres, header="Linear Regression Model")
#dev.off()

# estimate linear model 2
lr2 <- lm (lwage~educ+exper+I(exper^2), data=x)
summary(lr2)
#png("mincer_quadreg.png", width=1280, height=800)
plotModel (lr2, x, educ, exper, maxres, header="Quadratic Regression Model")
#dev.off()

# estimate bivariate Nadaraya Watson 1
#nw1 <- locfit(lwage~lp(educ+exper), data=x)
#summary(nw1)
#plotModel (nw1, x, educ, exper, maxres)

# estimate bivariate Nadaraya Watson 2
nw2 <- npreg(lwage~educ+exper, data=x)
summary(nw2)
#png("mincer_nadarayawatson.png", width=1280, height=800)
plotModel (nw2, x, educ, exper, maxres, header="Nadaraya Watson Model")
#dev.off()

# estimate Single Index Model
#simbw <- npindexbw(lwage~educ+exper, data=x, bws=c(0,1,1))
#sim <- npindex(simbw)
sim <- npindex(lwage~educ+exper, data=x)
summary(sim)
#png("mincer_sim.png", width=1280, height=800)
plotModel (sim, x, educ, exper, maxres, header="Single Index Model")
#dev.off()

# estimate Additive Model
am <- gam(lwage~s(educ)+s(exper), data=x)
summary(am)
#png("mincer_additive.png", width=1280, height=800)
plotModel (am, x, educ, exper, maxres, header="Additive Model")
#dev.off()

# estimate Partial Linear Model 
plm <- gam(lwage~educ+s(exper), data=x)
summary(plm)
#png("mincer_partiallinear.png", width=1280, height=800)
plotModel (plm, x, educ, exper, maxres, header="Partial Linear Model")
#dev.off()

# estimate Projection Pursuit Regression
ppr2 <- ppr(lwage~educ+exper, data=x, nterm=2)
summary(ppr2)
#png("mincer_ppr2.png", width=1280, height=800)
plotModel (ppr2, x, educ, exper, maxres, header="Projection Pursuit Model")
#dev.off()

# estimate Projection Pursuit Regression
ppr5 <- ppr(lwage~educ+exper, data=x, nterm=5)
summary(ppr5)
#png("mincer_ppr5.png", width=1280, height=800)
plotModel (ppr5, x, educ, exper, maxres, header="Projection Pursuit Model")
#dev.off()
