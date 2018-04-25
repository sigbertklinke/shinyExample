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


library("entropy")

pdf("entropy.pdf")
par(mfrow=c(2,2))
ylim<-c(0, 1)
plot(f3, type="h", ylim=ylim, xlab="x", main=sprintf("H=%.3f, HN=%.3f", entropy(f3), entropy(f3)/log(6)))
plot(f2, ylim=ylim, xlab="x", main=sprintf("H=%.3f, HN=%.3f", entropy(f2), entropy(f2)/log(6)))
plot(f4, ylim=ylim, xlab="x", main=sprintf("H=%.3f, HN=%.3f", entropy(f4), entropy(f4)/log(6)))
plot(f1, ylim=ylim, xlab="x", main=sprintf("H=%.3f, HN=%.3f", entropy(f1), entropy(f1)/log(6)))
dev.off()