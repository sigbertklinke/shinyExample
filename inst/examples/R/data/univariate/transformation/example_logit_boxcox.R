data(Boston, package="MASS")
library("car")      
par(mfrow=c(1,2))
# logit
indus <- Boston$indus/100 # percentages
hist(indus, main="indus")                             
lindus <- logit(indus)     
hist(lindus, main="logit(indus)")
# Box-Cox
hist(Boston$crim, main="crim")
bccrim <- bcPower(Boston$crim, 0)  
hist(bccrim, main="bcPower(crim, 0)")