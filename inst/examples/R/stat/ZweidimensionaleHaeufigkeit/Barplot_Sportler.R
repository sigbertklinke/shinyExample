y <- matrix(data=c(240, 160, 35, 40, 43,
                   120, 92, 36, 5, 38,
                   65, 85, 32, 3, 23), nrow = 5, ncol = 3 )
barplot(y, ylim=c(0,250), yaxp=c(0, 250, 5),beside = TRUE, col=c("cornflowerblue","deeppink4","cornsilk1","lightcyan2","purple4"), ylab="Absolute H\u00E4ufigkeit", xlab="Sportliche Bet\u00E4tigung", las=1)
axis(side=1, at=c(3.5,9.5,15.5), labels=c("kaum","manchmal","regelm\u00E4\u00DFig"))
legend("topright", inset=.05,
       c("Arbeiter","Angestellter","Beamter","Landwirt","sonstiger freier Beruf"), 
       fill=c("cornflowerblue","deeppink4","cornsilk1","lightcyan2","purple4"), horiz=FALSE)