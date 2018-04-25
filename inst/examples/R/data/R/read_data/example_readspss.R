library("foreign")
x <- read.spss ("BOSTONH.SAV", to.data.frame=T)
dim(x)