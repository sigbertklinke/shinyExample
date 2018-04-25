library("MASS")           # to use Boston data
library("car")
par(mfrow=c(1,2))
# Box-Cox
hist(Boston$crim)
bccrim <- bcPower(Boston$crim, 0)
hist(bccrim)