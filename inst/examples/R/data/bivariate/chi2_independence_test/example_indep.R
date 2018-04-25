library("MASS") # for Boston Housing data
chisq.test(table(Boston$chas, Boston$rad)) 