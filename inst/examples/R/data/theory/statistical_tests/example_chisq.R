library("MASS")
ctab <- table (Boston$chas, Boston$rad)
ctab
chisq.test(ctab)
chisq.test(ctab, simulate.p.value=T)