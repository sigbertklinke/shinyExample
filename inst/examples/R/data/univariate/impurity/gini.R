gini <- function(c) {
  f <- c/sum(c)
  return(1-sum(c^2))
}

set.seed(0)
x1 <- rbinom(100, 5, 0.5)
f1 <- table(x1)/100
x2 <- ordered(rbinom(100, 5, 0.01), levels=0:5)
f2 <- table(x2)/100
x3 <- ordered(rep(0:5, 20), levels=0:5)
f3 <- table(x3)/100
#f3 <- rep(20, 6)/100
#names(f3) <- 0:5
x4 <- ordered(rbinom(100, 5, 0.1), levels=0:5)
f4 <- table(x4)/100



pdf("gini.pdf")
par(mfrow=c(2,2))
ylim<-c(0, 1)
plot(f3, type="h", ylim=ylim, xlab="x", main=sprintf("G=%.3f", gini(f3)))
plot(f2, ylim=ylim, xlab="x", main=sprintf("G=%.3f", gini(f2)))
plot(f4, ylim=ylim, xlab="x", main=sprintf("G=%.3f", gini(f4)))
plot(f1, ylim=ylim, xlab="x", main=sprintf("G=%.3f", gini(f1)))
dev.off()