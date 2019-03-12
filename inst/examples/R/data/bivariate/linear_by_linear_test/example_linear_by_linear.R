# create data
tab <- as.table(rbind(c(25,13,9,10,6), c(31,21,6,2,3)))
# Chi-square test
chisq.test(tab)
# Linear-by-linear association
lbl_test(tab)