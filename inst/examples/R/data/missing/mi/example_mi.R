# run example_mar.R/example_mice.R before
source('create_mar.R')
source('example_mice.R')
#
library("mitools")
# extract 
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))