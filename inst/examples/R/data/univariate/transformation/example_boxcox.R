data(Boston, package="MASS")
library("car")
par(mfrow=c(1,2))
# Box-Cox
hist(Boston$crim, main="crim")
bccrim <- bcPower(Boston$crim, 0)
hist(bccrim, main="bcPower(crim,0)")