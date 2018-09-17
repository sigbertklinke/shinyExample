library("MASS")           # to use Boston data
library("car")    
# scale
summary(Boston$crim)
sccrim <- scale(Boston$crim)
summary(sccrim)
# Power
par(mfrow=c(1,2))
hist(Boston$crim)
spcrim <- basicPower(Boston$crim, 0)  
hist(spcrim)