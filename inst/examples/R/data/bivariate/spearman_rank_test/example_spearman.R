library("MASS")   # for Boston Housing data
cor.test(Boston$chas, Boston$rad, method="spearman")