library("MASS")           # to use Boston data
library("car")         
par(mfrow=c(1,2))
# logit
indus <- Boston$indus/100 # percentages
hist(indus)                             
lindus <- logit(indus)     
hist(lindus)