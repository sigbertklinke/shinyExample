library("MASS") # for Boston Housing data
tab <- table(Boston$rad)
# bar chart as needles (should not be used!)
plot(tab)