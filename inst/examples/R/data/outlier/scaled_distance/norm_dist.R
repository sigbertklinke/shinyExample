x <- (-300:300)/100
pdf("norm_dist.pdf", width=10, height=7)
plot(x, dnorm(x), type="l", ylab=expression(phi1(x)), axes=F)
qa <- qnorm(0.75)-qnorm(0.25)
abline(v=c(-2, -1, 0, 1, 2))
abline(v=c(-2*qa, -qa, qnorm(0.25), qnorm(0.75), qa, 2*qa), col="red")
axis(1, at=c(-2, -1, 0, 1, 2),
		 labels=c(expression(mu-2*sigma), 
		 				  expression(mu-sigma), 
		 				  expression(mu), 
		 				  expression(mu+sigma), 
		 				  expression(mu+2*sigma)))
axis(3, at=c(-2*qa, -qa, qnorm(0.25), 0, qnorm(0.75), qa, 2*qa),
		 labels=c(
		 	expression(mu-2*IQR), 
		 	expression(mu-IQR), 
		 				 expression(q[25]),
		 				 expression(tilde(mu)), 
		 				 expression(q[75]),
		 				 expression(mu+IQR),
		 	expression(mu+2*IQR)), col.ticks="red")
box()
dev.off()