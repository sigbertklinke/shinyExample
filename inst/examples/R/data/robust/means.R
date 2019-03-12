wmean <- function (x) {
  n      <- length(x)
  rep(1/n, n)
}

wmedian <- function (x) {
  n      <- length(x)
  weight <- rep(0, n)
  if (n%%2) {
    v <- 1+n%/%2
    weight[v] <- 1
  } else {
    v <- n%/%2
    print(v)
    weight[v] <- weight[v+1] <- 0.5
  }
  weight
}   

wtrim <- function (x, alpha) {
  if (missing(alpha)) alpha <- 0.25
  if ((alpha<0)||(alpha>0.5)) stop("0 <= alpha <= 0.5")
  n      <- length(x)
  v      <- floor(n*alpha)
  weight <- rep(1/(n-2*v), n)
  if (v>0) {
    weight[1:v] <- 0
    weight[(n-v+1):n] <- 0
  }
  weight
}

wwinsor <- function (x, alpha) {
  if (missing(alpha)) alpha <- 0.25
  if ((alpha<0)||(alpha>0.5)) stop("0 <= alpha <= 0.5")
  n      <- length(x)
  v      <- floor(n*alpha)
  weight <- rep(1/n, n)
  if (v>0) {
    weight[v+1] <- weight[n-v] <- (v+1)/n
    weight[1:v] <- 0
    weight[(n-v+1):n] <- 0
  }
  weight
}

wgastwirthcohen <- function (x, alpha, lambda) {
  if (missing(alpha)) alpha <- 0.25
  if ((alpha<0)||(alpha>0.5)) stop("0 <= alpha <= 0.5")
  if (missing(lambda)) lambda <- 0.25
  if ((lambda<0)||(lambda>0.5)) stop("0 <= lambda <= 0.5")
  n      <- length(x)
  weight <- rep(0, n)
  v      <- floor(n*alpha)
  weight[v+1] <- weight[n-v] <- lambda
  if (n%%2) {
    v <- 1+n%/%2
    weight[v] <- 1-2*lambda
  } else {
    v <- n%/%2
    weight[v] <- weight[v+1] <- 0.5-lambda
  }
  weight
}

whuber <- function (x, k) {
  if (missing(k)) k <- 1.339
  if (k<=0) stop("k<=0")
  weight <- rep(0, n)
  csn    <- 1.4826*median(abs(x-median(x)))
  tr0    <- median(x)
  repeat {
    z  <- abs((x-tr0)/csn)
    w  <- ifelse(z<k, 1, k/z)
    tr <- sum(w*x)/sum(w)  
    if (abs(tr-tr0)<1e-6) break
    tr0 <- tr
  }
  w/sum(w)
}

whampel <- function (x, a, b, c) {
  if (missing(a)) a <- 1.7
  if (a<=0) stop("a<=0")
  if (missing(b)) b <- 3.4
  if (b<=a) stop("b<=a")
  if (missing(c)) c <- 8.5
  if (c<=b) stop("c<=b")
  weight <- rep(0, n)
  csn    <- 1.4826*median(abs(x-median(x)))
  tr0    <- median(x)
  repeat {
    z  <- abs((x-tr0)/csn)
    w  <- ifelse(z<a, 1, ifelse(z<b, a/z, ifelse(z<c, a/z*(c-z)/(c-b), 0)))
    tr <- sum(w*x)/sum(w)  
    if (abs(tr-tr0)<1e-6) break
    tr0 <- tr
  }
  w/sum(w)
}

wandrews <- function (x, a) {
  if (missing(a)) a <- 1.34*pi
  if (a<=0) stop("a<=0")
  weight <- rep(0, n)
  csn    <- 1.4826*median(abs(x-median(x)))
  tr0    <- median(x)
  repeat {
    z  <- abs((x-tr0)/csn)
    w  <- ifelse(z<a, a^2*sin(pi*z/a)/z, 0)
    tr <- sum(w*x)/sum(w)  
    if (abs(tr-tr0)<1e-6) break
    tr0 <- tr
  }
  w/sum(w)
}

wtukey <- function (x, a) {
  if (missing(a)) a <- 4.685
  if (a<=0) stop("a<=0")
  weight <- rep(0, n)
  csn    <- 1.4826*median(abs(x-median(x)))
  tr0    <- median(x)
  repeat {
    z  <- abs((x-tr0)/csn)
    w  <- ifelse(z<a, (1-(z/a)^2)^2, 0)
    tr <- sum(w*x)/sum(w)  
    if (abs(tr-tr0)<1e-6) break
    tr0 <- tr
  }
  w/sum(w)
}

mid <- function (x, name="mean", na.rm=FALSE, ...) {
  args <- list(...)
  sx   <- sort(as.vector(x))
  n    <- length(sx)
  tab  <- list(mean           = "wmean",
               median         = "wmedian",
               trimmed        = "wtrim", 
               midmean        = "wtrim",
               winsor         = "wwinsor",
               gastwirthcohen = "wgastwirthcohen",
               trimean        = "wgastwirthcohen",
               huber          = "whuber",
               hampel         = "whampel",
               andrews        = "wandrews",
               tukey          = "wtukey"
               )
  tabs <- names(tab)
  pos  <- pmatch(name, tabs)
  if (is.na(pos)) stop(paste("Unknown mid name:", name))
  if (tab[[pos]]=="midmean") { args$alpha <- 0.25 }
  if (tab[[pos]]=="trimean") { args$alpha <- 0.25; args$lambda <- 0.25}  
  args$x <- sx
  weight <- do.call(tab[[pos]], args)
  if(sum(weight)!=1) stop("weights do not sum up to 1")
  list(weight=weight, mid=weighted.mean(sx, weight), name=tabs[pos], x=x)
}

ytransform <- function(y) {
  log10(1+6*log10(1+y))
}

plot.mid <- function(mid, ...) {
  par(mar=c(0,0.5,2,0.5))
  tick <- (0:5)/10
  plot (0,0, type="n", xlim=range(x), ylim=ytransform(range(tick)),  axes=F, ...)
  rug(x)
  for (i in seq(tick)) {
    abline(h=ytransform(tick[i]), col="gray")
  }
  points(mid$x, ytransform(mid$weight), pch=19)
  abline(v=mid$mid, lwd=2)

  box()
}

set.seed(0)
n <- 30
x <- sort(rchisq(n, 3))
pdf("means.pdf", width=10, height=6)
par(mfrow=c(2,3))
plot.mid(mid(x), main="Mean")
plot.mid(mid(x, "trimmed"), main="Trimmed Mean")
plot.mid(mid(x, "winsor"), main="Winsorized Mean")
plot.mid(mid(x, "med"), main="Median")
plot.mid(mid(x, "gast"), main="Trimean")
dev.off()

pdf("meansm.pdf", width=10, height=6)
par(mfrow=c(2,2))
plot.mid(mid(x, "huber", k=0.5), main="Huber (k=0.5)")
plot.mid(mid(x, "hampel", a=0.5, b=1, c=5), main="Hampel (a=0.5, b=1, c=5)")
plot.mid(mid(x, "andrews", a=1), main="Andrews Wave (a=1)")
plot.mid(mid(x, "tukey", a=1.5), main="Tukeys Biweight (a=1.5)")
dev.off()

pdf("meansmspss.pdf", width=10, height=6)
par(mfrow=c(2,2))
plot.mid(mid(x, "huber"), main="Huber k")
plot.mid(mid(x, "hampel"), main="Hampel")
plot.mid(mid(x, "andrews"), main="Andrews Wave")
plot.mid(mid(x, "tukey"), main="Tukeys Biweight")
dev.off()