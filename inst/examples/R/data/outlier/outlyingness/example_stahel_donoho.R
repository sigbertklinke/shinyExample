library("MASS")   # for Boston Housing data
library("robustbase")
x   <- Boston[,-c(1,4,9)]
set.seed(0)
out <- adjOutlyingness(x, ndir=2500)
sort(out$adjout)
hist(out$adjout)
rug(out$adjout)