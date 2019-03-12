data(Boston, package="MASS")
# test on uniform distribution
chisq.test(table(Boston$rad)) 