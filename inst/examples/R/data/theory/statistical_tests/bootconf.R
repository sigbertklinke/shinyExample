library("boot")
meanboot <- function (x, ind) { return(mean(x[ind])); }

set.seed(0)
x <- read.csv2("pechstein.csv")
b <- boot(x$Retikulozyten, meanboot, 999)
pdf("bootconf.pdf", width=6, height=6)
hist(b$t, breaks=30, main="Bootstrap sample means", xlab="mean of reticulocyte")
abline(v=b$t0, col="red")
abline(v=mean(b$t), col="black")
dev.off()

# asympotical
xb <- mean(x$Retikulozyten)
s  <- sd(x$Retikulozyten)
xb+qt(0.025, 28)*s/sqrt(length(x$Retikulozyten))
xb+qt(0.975, 28)*s/sqrt(length(x$Retikulozyten))

# Chebyshev
k <- sqrt(1/0.05)
xb-k*s/sqrt(length(x$Retikulozyten))
xb+k*s/sqrt(length(x$Retikulozyten))


# bootstrap
st <- sort(b$t)
st[floor(0.025*length(st))]
st[ceiling(0.975*length(st))] 