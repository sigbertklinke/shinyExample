library("robustbase")
x <- read.csv("credit.csv")

z <- as.data.frame(list(zIncome=scale(x$Income), zCreditSum=scale(x$CreditSum)))

pdf("outlyingness.pdf", width=9, height=6)
par (mfcol=c(1,2))

alpha <- c(1,1)
alpha <- as.vector(alpha/sqrt(sum(alpha^2)))
t <- (as.matrix(z)%*%alpha)
ii <- which.min(t)
ia <- which.max(t)
out <- abs(t-median(t))/mean(abs(t-median(t)))
p <- t(colMeans(x[,1:2])+sapply(x[,1:2], sd)*t(t%*%alpha))

plot(x$Income, x$CreditSum, pch=19, cex=0.75)
points(p, col="grey", pch=19)
lines(p[c(ii,ia),],col="grey", lty="solid", lwd=2)

for (i in 1:nrow(p)) {
  lines(c(x[i,1],p[i,1]), c(x[i,2], p[i,2]), col="grey", lty="solid", lwd=1)
}
text(p, labels=sprintf("%.2f", out), cex=0.75, pos=4)

alpha <- c(1,-1)
alpha <- as.vector(alpha/sqrt(sum(alpha^2)))
t <- (as.matrix(z)%*%alpha)
ii <- which.min(t)
ia <- which.max(t)
out <- abs(t-median(t))/mean(abs(t-median(t)))

p <- t(colMeans(x[,1:2])+sapply(x[,1:2], sd)*t(t%*%alpha))

plot(x$Income, x$CreditSum, pch=19, cex=0.75)
points(p, col="grey", pch=19)
lines(p[c(ii,ia),],col="grey", lty="solid", lwd=2)
for (i in 1:nrow(p)) {
  lines(c(x[i,1],p[i,1]), c(x[i,2], p[i,2]), col="grey", lty="solid", lwd=1)
}
text(p, labels=sprintf("%.2f", out), cex=0.75, pos=4)

dev.off()

pdf("outlyingnessR.pdf", width=6, height=9)
layout(matrix(c(1,1,2), ncol=1))
out <- adjOutlyingness(x[,1:2])
plot(x[,1:2], pch=19, cex=0.75)
text(x[,1:2], sprintf("%.2f", out$adjout), pos=3)
plot(out$adjout, rep(0, length(out$adjout)), pch=19, cex=0.75, main="Adjusted Outlyingness", ylab="")
dev.off()