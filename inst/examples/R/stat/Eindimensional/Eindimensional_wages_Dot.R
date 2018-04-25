par(mfrow=c(2,1))

Wages = readdataSK("Wages.csv", format="csv2")

# 1.Dottplot - Wages=ALL
par(mfg=c(1,1))
plot(y=1:150, x=Wages$wage, yaxt="n", ylab="", xlab="Stundenlohn (n=150)", main="Dotplot")

# 2.Dottplot - Wages=M/F
par(mfg=c(2,1))
Wages$colour <- ifelse(Wages$female == 1, "red", "blue")
Wages$y<- 1:150
par(mfg=c(2,1))
plot(Wages$y~Wages$wage, col=Wages$colour, yaxt="n", ylab="", xlab="Stundenlohn von M\u00E4nnern (blau) und Frauen (rot)", 
     main="Dotplot")
