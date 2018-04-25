library("mclust")
# since multivariate normal densities are assumed
# likelihood theory can be applied, e.g. BIC for 
# optimal cluster choice
cl <- Mclust(faithful)
print(cl)
summary(cl)
par(mfrow=c(2,2))
plot(cl, "BIC")
plot(cl, "classification")
plot(cl, "uncertainty")
plot(cl, "density")
# model names
?mclustModelNames