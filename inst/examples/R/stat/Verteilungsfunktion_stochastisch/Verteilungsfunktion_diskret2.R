Fx = c(0, 0.4549, 0.7679, 0.8915, 1)

plot(stepfun(c(1:4), Fx), verticals = FALSE, do.points = FALSE, lwd = 2, 
     main ="", axes = FALSE, xlab = "x", ylab = "F(x)")
axis(1, at =c(0:5), pos = 0)
axis(2, at  = c(0, seq(from=0.2, to=1, by=0.2)), las = 1,
     labels = c("",seq(from=0.2, to=1, by=0.2)), pos = 0, xpd = TRUE)