library("haven")
allbus <- read_spss("ALLBUS2010.SAV")
netto  <- as.numeric(as.character(allbus$V612))
hist(netto, breaks=seq(0, 10400, by=800), main = "", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}", las=2, col = "red")