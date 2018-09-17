library("MASS")           # to use Boston data
ftab <- table(Boston[,9])
p    <- prop.table(ftab)      
sum(p*(1-p))              # gini impurity