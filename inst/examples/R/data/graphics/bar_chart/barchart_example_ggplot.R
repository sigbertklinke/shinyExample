library("MASS") # for Boston Housing da
tab2 <- table(Boston$rad, Boston$chas)
library("ggplot2")
ggplot(Boston, aes(x=factor(rad))) + geom_bar()