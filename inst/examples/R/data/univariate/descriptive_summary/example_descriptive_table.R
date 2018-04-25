library("MASS")
# frequency table
summary(as.factor(Boston$rad))
tab <- table(Boston$rad)
tab
prop.table(tab)
# cumulative frequency table
cumsum(tab)
cumsum(prop.table(tab))