Wages <- read.csv2("Wages.csv")
par(mfrow=c(2,1))
# 1.Dotplot - Wages=ALL
index <- 1:150
plot(y=index, x=Wages$wage, yaxt="n", ylab="", xlab="Stundenlohn (n=150)", main="Dotplot")
# 2.Dotplot - Wages=M/F
plot(index~Wages$wage, col=ifelse(Wages$female == 1, "red", "blue"), 
     yaxt="n", ylab="", xlab="Stundenlohn von Maennern (blau) und Frauen (rot)", 
     main="Dotplot")
