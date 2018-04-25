pdf(file = "R-horsekick_totals-ecdf.pdf", width = 4, height = 4, pointsize = 8)
#Empirical cumulative distribution function (ecdf) example. Data = von Bortkiewicz's famous dataset of deaths by horse kick in Prussian cavalry corps
library("pscl")
par(mar=c(4,4,5,3)+0.1)
X <- tapply(prussian$y, prussian$year, sum)
plot(ecdf(X), xlim=c(0,20), main="", xlab="Deaths per year", ylab="Empirical distribution function")
title("Deaths by horsekick in\nPrussian cavalry corps, 1875-94", line=2)
dev.off()