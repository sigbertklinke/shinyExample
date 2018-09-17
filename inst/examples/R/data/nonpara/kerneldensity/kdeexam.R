dop <- T
set.seed(0)

x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]

library("np")
xe  <- sort(as.vector(x$exper))
n   <- length(xe)
jt  <- jitter(rep(-0.005, n), amount=0.005)

drot <- npudens(xe, bwmethod="normal-reference")
d1 <- npudens(xe, bws=drot$bw/0.7)
d2 <- npudens(xe, bws=0.7*drot$bw)
d3 <- npudens(xe, bws=0.49*drot$bw)

if (dop) { pdf("kdeexam.pdf") }
plot(xe, jt, ylim=c(-0.01, max(fitted(d3))), cex=0.3, xlab="Experience", ylab="Estimated density", main="Kernel density estimator", sub="black: Silverman rule-of-thumb")
lines(xe, fitted(d1), col="red", lwd=2)
lines(xe, fitted(drot), lwd=2)            
lines(xe, fitted(d2), col="blue", lwd=2)
lines(xe, fitted(d3), col="green", lwd=2)
legend("topright", legend=sprintf("h=%.3f", c(d1$bw, drot$bw, d2$bw, d3$bw)), col=c("red", "black", "blue", "green"), lwd=2)
if (dop) { dev.off() }