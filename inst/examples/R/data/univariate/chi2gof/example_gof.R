library("MASS") # for Boston Housing data
# test on uniform distribution
chisq.test(table(Boston$rad)) 