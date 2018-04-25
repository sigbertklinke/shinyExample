tab <- matrix(c(8,16,5,11), nrow=2)
colnames(tab) <- c("after_yes", "after_no")
rownames(tab) <- c("before_yes", "before_no")
tab
# uses Edwards correction
mcnemar.test(tab)