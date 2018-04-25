library("MASS")   # for Boston Housing data
library("robustbase")
x   <- Boston[,-c(1,4,9)]
set.seed(0)
out <- adjOutlyingness(x, ndir=2500)
hist(out$adjout)