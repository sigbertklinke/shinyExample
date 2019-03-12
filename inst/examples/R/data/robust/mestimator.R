z <- (-1000:1000)/100
# Hubert k
k  <- 1.339
wh <- 1*(abs(z)<=k)+
      k*sign(z)/z*(abs(z)>k)

# Hampel
a   <- 1.7
b   <- 3.4
c   <- 8.5
wha <- 1*(abs(z)<=a)+
       a*sign(z)/z*((abs(z)>a) & (abs(z)<=b))+

       a*(c-abs(z))/(c-b)*sign(z)/z*((abs(z)>b) & (abs(z)<=c))
# Andrews wave
a   <- 1.34*pi
wav <- a/(pi*z)*sin(pi*z/a)*(abs(z)<=a)

# Tukey's biweight
a   <- 4.685
wtb <- (1-z^2/a^2)*(1-z^2/a^2)*(abs(z)<=a)

png("huber.png", bg="transparent")
plot(z, wh, type="l", main="Hubert (k=1.339)")
dev.off()

png("hampel.png", bg="transparent")
plot(z, wha, type="l", main="Hampel (a=1.7, b=3.4, c=8.5)")
dev.off()

png("andrewswave.png", bg="transparent")
plot(z, wav, type="l", main="Andrews wave (a=1.34*pi)")
dev.off()

png("tukeybiweight.png", bg="transparent")
plot(z, wtb, type="l", main="Tukey's biweight (a=4.685)")
dev.off()
