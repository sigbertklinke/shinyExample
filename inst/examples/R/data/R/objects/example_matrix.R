mn <- matrix(1:15, ncol=3)
mn
length(mn)
dim(mn)
matrix(1:15, ncol=3, byrow=TRUE)
#
an <- array(1:60, dim=c(5,4,3))
an
length(an)
dim(an)
#
mn[3,2] <- 0
mn
mn[,3]
mn[3,]
mn[1:2,c(2,3)]
t(mn)