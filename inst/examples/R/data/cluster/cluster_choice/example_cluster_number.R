library("NbClust")
zfaithful <- scale(faithful)
# Total variance explained
tve <- rep(NA, 15)
for (k in 2:15) {
	clk <- kmeans(zfaithful, k)
	tve[k] <- 1-clk$tot.withinss/clk$totss
}
plot(tve, type="b")
# Calinski and Harabasz
NbClust(zfaithful, method="ward.D2", index="ch")
# All indices
NbClust(zfaithful, method="ward.D2")
# All indices (takes a long time)
#NbClust(zfaithful, method="ward.D2", index="alllong")