# Boston Housing data
library("MASS")

# breaks at deciles and add observattions
breaks <- quantile(Boston$medv, probs=(0:10)/10)
hist(Boston$medv, breaks=breaks)
rug(Boston$medv)

# add a normal curve
hist(Boston$medv, freq=FALSE)
x <- seq(min(Boston$medv),max(Boston$medv),length=100)
y <- dnorm(x, mean=mean(Boston$medv), sd=sd(Boston$medv))
lines(x, y)

# add a kernel density estimate
hist(Boston$medv, freq=FALSE)
dens <- density(Boston$medv)
lines(dens$x, dens$y)