library("haven")
allbus <- read_spss("ALLBUS2010.SAV")
netto  <- as.numeric(as.character(allbus$V612))
sex    <- as.numeric(as.character(allbus$V298))
par(mfrow=c(1,2))
###### Klassenbreite 500 Euro ######
grouped_500_m = cut(netto[sex == 1], seq(0, 7000, by=500), 
                    label = seq(250, 6750, by=500))
grouped_500_w = cut(netto[sex == 2], seq(0, 7000, by=500), 
                    label = seq(250, 6750, by=500))
hist(netto[sex == 1], breaks=seq(0, 10500, by=500),  main = c("M\u00E4nnlich (n = 986)"), col = "red", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2)
hist(netto[sex == 2], breaks=seq(0, 10500, by=500),  main = c("Weiblich (n = 1014)"), col = "red", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}",las=2)