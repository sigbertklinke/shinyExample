library("car")
x <- (-400:400)/200
xp <- x[x>0]
mp <- 5

pdf("boxcox_yeo.pdf", width=10, height=7)
par(mfrow=c(1,2))
plot(xp, bcPower(xp, 0), type="l", xlim=range(x), main="Box-Cox", ylim=range(x),
     xlab="Original value", ylab="Transformed value")
val <- 0
col <- 1
for (i in 1:mp) {
  val <- c(-i, val)
  col <- c(i+1, col)
  lines(xp, bcPower(xp, i), col=i+1)
  val <- c(val, i)
  col <- c(col, i+1)
  lines(xp, bcPower(xp, -i), col=i+1)
}
legend("topleft", legend=val, col=col, lwd=2)
plot(x, yjPower(x, 0), type="l", xlim=range(x), main=" Yeo-Johnson", ylim=range(x),
     xlab="Original value", ylab="Transformed value")
for (i in 1:mp) {
  lines(x, yjPower(x, i), col=i+1)
  lines(x, yjPower(x, -i), col=i+1)
}
legend("topleft", legend=val, col=col, lwd=2)
dev.off()