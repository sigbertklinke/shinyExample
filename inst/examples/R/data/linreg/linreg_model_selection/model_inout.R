library("MASS")
bhd  <- Boston[,-9]
B    <- 1000
msr.model <- msr.test <- rep(NA, B)
for (i in 1:B) {
  test <- runif(nrow(bhd))<0.5
  bhd.model <- subset(bhd, !test)
  bhd.test  <- subset(bhd, test)
  lmfull    <- lm(medv~., data=bhd.model)
  lmaic     <- stepAIC(lmfull, trace=F)
  msr.model[i] <- mean(lmaic$residuals^2)
  medvtest    <- predict(lmaic, newdata = bhd.test)
  msr.test[i]  <- mean((bhd.test$medv-medvtest)^2)
}
pdf("model_inout.pdf")
plot(msr.model, msr.test, main="Mean squared residuals", pch=19, cex=0.5, 
		 col = 1+(msr.model<msr.test), sub="Model: 50% sample, Test: 50% sample",
		 xlab="in-sample error",
		 ylab="out-of-sample error")
dev.off()
