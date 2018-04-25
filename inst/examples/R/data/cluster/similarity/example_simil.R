# create binary data matrix
wtab  <- as.data.frame(Titanic)
bdat  <- cbind(wtab$Sex=="Male", 
							 wtab$Age=="Child", 
							 wtab$Survived=="Yes")
# compute similarities
library("proxy")
d <- as.matrix(simil(bdat, method='Jaccard'))
heatmap(d)