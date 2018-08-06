library("boot")
meanboot <- function (x, ind) { return(mean(x[ind])); }

set.seed(24961970)
x <- read.csv2("pechstein.csv")
head(x)
boot(x$Retikulozyten, meanboot, 999)
