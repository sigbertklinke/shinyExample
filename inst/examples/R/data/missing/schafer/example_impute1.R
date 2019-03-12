library("foreign", "Matrix")
x <- read.spss("../../Daten/ALLBUS2012.SAV", 
               to.data.frame=T)
body <- as.data.frame(x[,c(220,593,595)])
names(body) <- c("age", "height", "weight")
# number of NAs
nabody <- is.na(body)
apply(nabody, 2, sum)
# full data
mean(body$weight)
cor(body)
# case deletion
mean(body$weight, na.rm=T)
cor(body, use="complete.obs")
sum(complete.cases(body))
# available case analysis
cor(body, use="pairwise.complete.obs")
crossprod(!nabody)