library("effsize")
library("MASS")
# Cohens d
cohen.d(survey$Height, survey$Sex, na.rm=TRUE)
cohen.d(survey$Wr.Hnd, survey$W.Hnd, na.rm=TRUE)
# Hedges g
cohen.d(survey$Height, survey$Sex, na.rm=TRUE, hedges.correction=TRUE)
cohen.d(survey$Wr.Hnd, survey$W.Hnd, na.rm=TRUE, hedges.correction=TRUE)