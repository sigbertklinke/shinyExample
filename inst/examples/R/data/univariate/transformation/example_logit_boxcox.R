library("MASS")           # to use Boston data
library("car")      
# logit
indus <- Boston$indus/100 # precentages
hist(indus)                             
lindus <- logit(indus)     
hist(lindus)
# Box-Cox
hist(Boston$crim)
bccrim <- bcPower(Boston$crim, 0)  
hist(bccrim)