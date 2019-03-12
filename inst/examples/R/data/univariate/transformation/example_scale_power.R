data(Boston, package="MASS")
library("car")    
# scale
summary(Boston$crim)
sccrim <- scale(Boston$crim)
summary(sccrim)
# Power
par(mfrow=c(1,2))
hist(Boston$crim, main="crim")
spcrim <- basicPower(Boston$crim, -1)  
hist(spcrim, main="basicPower(crim, -1)")