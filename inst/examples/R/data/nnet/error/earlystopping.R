library("foreign")
library("nnet")

x     <- read.spss("BOSTONH.SAV", to.data.frame=T)
set.seed(0)
train  <- runif(nrow(x))<2/3
xtrain <- x[train, c('MEDV', 'LSTAT')]
xvalid <- x[!train, c('MEDV', 'LSTAT')]
B <- 30
err.train <- err.valid <- rep(NA, B)
for (i in 1:B) {
  set.seed(0)
  nn <- nnet(x=xtrain$MEDV, y=xtrain$LSTAT, maxit=i, size=1, linout=T)
  err.train[i] <- mean(nn$residuals^2)
  pmedv <- predict(nn, newdata=xvalid)
  err.valid[i] <- mean((pmedv-xvalid$MEDV)^2)
}

pdf("earlystopping.pdf", width=10, height=5)
ylim <- range(c(err.train, err.valid))
plot(err.train, type="l", xlab="Iteration", ylab="Error", ylim=ylim, lwd=2, col="blue")
lines(err.valid, col="red", lwd=2)
legend("topright", lwd=2, col=c("blue", "red"), legend=c("training error", "validation error"))
pos <- which.min(err.valid)
abline(v=pos, lwd=2, lty="dashed")
text(pos, max(ylim), "early stopping", pos=2)
dev.off()