library("MASS")
bhd <- Boston[,-9]
# find lambda
lmridge <- lm.ridge(medv~., data=bhd, lambda=seq(0, 10, 0.01))
select(lmridge)
# ridge traces
plot(lmridge)
# compare coefficients
lm(medv~., data=bhd)
lm.ridge(medv~., data=bhd, lambda=8.98)