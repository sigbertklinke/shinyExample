hh_groesse = c(1:5)
#f = c(0.35, 0.302, 0.167, 0.128, 0.053)
F = c(0.35, 0.652, 0.819, 0.947, 1)
plot(stepfun(hh_groesse, c(0, F)), verticals = FALSE, do.points = FALSE, lwd = 2, axes=FALSE,
     main ="", ylab="F(x)", xlab="Haushaltsgr\u00F6\u00DFe")
axis(1, at =c(0:5), labels=c("",1:4, ">5"), pos = 0)
axis(2, at  = c(0,seq(from=0.2, to=1, by=0.2)), labels = c("",seq(from=0.2, to=1, by=0.2)), pos = 0)
arrows(x0 = 5, y0 = 0, x1 = 6.5, y1 = 0, xpd=TRUE)
arrows(x0 = 0, y0 = 0.5, x1 = 0, y1 = 1.1, xpd=TRUE)