tab  <- matrix(c(12, 6, 6, 22), ncol=2)
tab
# crosstable
ctab <- as.table(tab)
ctab
# crosstable -> weighted data frame
wtab <- as.data.frame(ctab)
wtab
# weighted data frame -> crosstable
xtab <- xtabs(Freq~Var1+Var2, data=wtab)
xtab
# weighted data frame -> unweighted data matrix 
index <- rep(1:nrow(wtab), wtab$Freq)
utab  <- wtab[index,] 
utab
# unweighted data frame -> crosstable
ctab <- table(utab$Var1, utab$Var2)
ctab