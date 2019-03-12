data(Boston, package="MASS")
library("car")         
par(mfrow=c(1,2))
# logit
indus <- Boston$indus/100 # percentages
hist(indus, main="indus")                             
lindus <- logit(indus)     
hist(lindus, main="logit(indus)")