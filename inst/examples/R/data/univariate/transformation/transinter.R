library("MASS")
library("TeachingDemos")
bk <- (0:100)/100
b  <- 1000*(bk-0.63)^2
pdf("transinter.pdf", width=10, height=7)
plot(bk, b, type="l", 
     xlab="Proportion of black population per district (Bk)",
     ylab="B=1000*(Bk-0.63)^2", main="Interpretation of B")
abline(h=b[101], col="grey")
text(1, b[101], pos=3, round(b[101], 2))
v <- 0.63-sqrt(b[101]/1000)
abline(v=v, col="grey")
text(v, 0, pos=2, round(v, 2))
rug(Boston$black, side=2)
b1 <- 0.63+sqrt(Boston$black/1000)
b1[b1>1] <- NA
b2 <- 0.63-sqrt(Boston$black/1000)
b2[b2<0] <- NA
col <- ifelse(!is.na(b1) & !is.na(b2), "red", "black")
points(b1, Boston$black, pch=19, cex=0.75, col=col)
points(b2, Boston$black, pch=19, cex=0.75, col=col)
subplot(hist(Boston$black, main="", xlab="B", col="grey"), "topright", inset=c(0.05, 0.05))
dev.off()