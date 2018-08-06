allbus = readdataSK("allbus2010.csv", format = "csv2", sep=";")
pdf(rpdf, width=13, height=5)
par(mfrow=c(1,2))
###### Klassenbreite 500 Euro ######
grouped_500_m = cut(allbus$Nettoeinkommen, seq(0, 7000, by=500), 
                    label = seq(250, 6750, by=500))
grouped_500_w = cut(allbus$Nettoeinkommen[allbus$Geschlecht == 2], seq(0, 7000, by=500), 
                    label = seq(250, 6750, by=500))
hist(allbus$Nettoeinkommen[allbus$Geschlecht == 1], breaks=seq(0, 10500, by=500),  main = c("M\u00E4nnlich (n = 986)"), col = "red", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2)
hist(allbus$Nettoeinkommen[allbus$Geschlecht == 2], breaks=seq(0, 10500, by=500),  main = c("Weiblich (n = 1014)"), col = "red", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2)