t <- (-350:350)/100

kernel <- list(list(k=35/32*(1-t^2)^3*(abs(t)<1), name="Triweight", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(32),scriptstyle(35))~~(1-w^2)^3~~I(abs(w)<1)))),
               list(k=15/16*(1-t^2)^2*(abs(t)<1), name="Biweight/Quartic", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(15),scriptstyle(16))~~(1-w^2)^2~~I(abs(w)<1)))),
               list(k=70/81*(1-abs(t)^3)^3*(abs(t)<1), name="Tricube", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(70),scriptstyle(81))~~(1-abs(w)^3)^3~~I(abs(w)<1)))),
               list(k=3/4*(1-t^2)*(abs(t)<1), name="Epanechnikov", 
                    text=list(pos=4,  labels=expression(frac(scriptstyle(3),scriptstyle(4))~~(1-w^2)~~I(abs(w)<1)))),
               list(k=1/2*(abs(t)<1), name="Uniform", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(1),scriptstyle(2))~~I(abs(w)<1)))),
               list(k=dnorm(t), name="Gaussian", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(1),scriptstyle(sqrt(2*pi)))~~e^{-0.5~~w^2}))),
               list(k=1/(pi*(1+t^2)), name="Cauchy", 
                    text=list(pos=4, labels=expression(frac(scriptstyle(1),scriptstyle(pi*(1+w^2)))) )))
col <- rainbow(length(kernel))
max <- 1.05*max(sapply(kernel, FUN=function(elem) {max(elem$k)}))
pdf("kernel_function.pdf", width=10, height=7)
plot(range(t),c(0,0), type="n", main="Kernels", ylim=c(0, max), xlab="w", ylab="density")
legendl <- legendr <- c()
for (i in seq(kernel)) {
  lines(t, kernel[[i]]$k, col=col[i])
  kernel[[i]]$text$y <- 0.95*max(kernel[[i]]$k)
  kernel[[i]]$text$x <- 0.8+2*i/length(kernel)
  kernel[[i]]$text$col <- col[i] 
  do.call("text", kernel[[i]]$text)
  legendl <- c(legendl, kernel[[i]]$name)
}
legend("topleft", legendl, lwd=1, col=col)
dev.off()
