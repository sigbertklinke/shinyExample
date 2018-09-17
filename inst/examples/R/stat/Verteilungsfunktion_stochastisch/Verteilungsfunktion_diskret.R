Fx = c(0.125, 0.5, 0.875, 1)

plot(stepfun(c(1:3), Fx), verticals = FALSE, do.points = FALSE, lwd = 3, 
     main ="", axes = FALSE, xlab = "x", ylab = "F(x)", col="darkblue")
axis(1, at =c(0:4))
axis(2, at =c(0, seq(from=0.2, to=1, by=0.2)), las = 1,
     labels = c("",seq(from=0.2, to=1, by=0.2)))