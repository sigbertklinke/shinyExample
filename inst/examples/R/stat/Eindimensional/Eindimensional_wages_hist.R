allbus <- read.csv2("allbus2010.csv")

par(mfrow=c(2,2))
###### Klassenbreite 800 Euro ######
hist(allbus$Nettoeinkommen, breaks=seq(0, 10500, by=800), main = "Klassenbreite: 800 Euro", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2, col = "red")
###### Klassenbreite 500 Euro ######
hist(allbus$Nettoeinkommen, breaks=seq(0, 10500, by=500), main = "Klassenbreite: 500 Euro", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2, col = "red")
###### Klassenbreite 250 Euro ######
hist(allbus$Nettoeinkommen, breaks=seq(0, 10500, by=250), main = "Klassenbreite: 250 Euro", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2, col = "red")
###### Klassenbreite 100 Euro ######
hist(allbus$Nettoeinkommen, breaks=seq(0, 10500, by=100), main = "Klassenbreite: 100 Euro", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2, col = "red")
