library("sampling")
data(swissmunicipalities)
table(swissmunicipalities$REG)
cl <- cluster(swissmunicipalities, clustername=c("REG"), 
              size=3)
table(cl$REG)
data<-swissmunicipalities[order(swissmunicipalities$REG),]
st <- strata(data, stratanames=c("REG"), 
             size=c(30, 20, 45, 15, 20, 11, 44))
table(st$REG)