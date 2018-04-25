library("MASS")           # to use Boston data
library("car")    
# scale
summary(Boston$crim)
sccrim <- scale(Boston$crim)
summary(sccrim)
# Power
hist(Boston$crim)
spcrim <- basicPower(testdata, -1)  
hist(spcrim)