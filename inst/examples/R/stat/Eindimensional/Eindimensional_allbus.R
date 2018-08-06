allbus <- readdataSK("allbus2010.csv", format = "csv2", sep=";")
pdf(rpdf,width=7, height=7)
hist(allbus$Nettoeinkommen, breaks=seq(0, 10400, by=800), main = "", ylab ="h(x)", xlab="X = {Monatl. Nettoeinkommen in Euro}", las=2, col = "red")