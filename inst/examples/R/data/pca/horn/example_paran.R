library("rio")
x <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
par(mfrow=c(1,2))
# do parallel analysis
library("paran")
paran(x, centile=95, all=T, graph=T)
# adjusted ev = unadjusted - bias (random ev-1)
library("psych")
fa.parallel(x, fa="pc")