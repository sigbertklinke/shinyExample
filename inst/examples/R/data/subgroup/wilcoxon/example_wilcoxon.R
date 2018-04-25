# 100 m running times before new training
b <- c(12.98, 13.54, 12.85, 15.67, 17.24, 19.23, 12.63, 15.35, 14.48, 11.31)
# 100 m running times after new training
a <- c(12.72, 13.63, 12.05, 15.23, 16.88, 20.02, 12.07, 15.92, 16.09, 11.11)
#
wilcox.test(b, a, paired=TRUE)