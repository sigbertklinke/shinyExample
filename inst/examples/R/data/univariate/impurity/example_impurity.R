library("MASS")           # to use Boston data
ftab <- table(Boston[,9])
p    <- prop.table(f)      
sum(p*(1-p))              # gini impurity