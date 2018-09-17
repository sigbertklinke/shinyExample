library("actuar", warn.conflicts=FALSE) 
data <- read.csv2("Benzinverbrauch.csv")
x    <- grouped.data(Group = c(12,15,18,21,24,27,30,33,36,39,42), Frequency = data[,2])
hist(x, col="gray")
