# run example_mar.R/example_mice.R before
source(list.files(pattern='example_mar.R', recursive=TRUE)[1])
source(list.files(pattern='example_mice.R', recursive=TRUE)[1])
#
library("mitools")
# extract 
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))