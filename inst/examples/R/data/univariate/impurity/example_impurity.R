data(Boston, package="MASS")
ftab <- table(Boston$rad)
p    <- prop.table(ftab)      
sum(p*(1-p))              # gini impurity