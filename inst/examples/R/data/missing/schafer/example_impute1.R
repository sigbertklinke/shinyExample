library("haven")
x <- read_spss("ALLBUS2012.SAV")
body <- zap_labels(x[,c(220,593,595)])
names(body) <- c("age", "height", "weight")
body <- as.data.frame(body)
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