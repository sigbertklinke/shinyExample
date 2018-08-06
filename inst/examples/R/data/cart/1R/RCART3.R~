titanic <- read.csv("titanic3.csv")
titanic$child <- (titanic$age<15)
titanic$child[is.na(titanic$child)] <- F

index<-order(titanic$age)

age <- titanic$age[index[1:22]]
surv <- titanic$survived[index[1:22]]

pred <- apply(table(age, surv), 1, which.max)

pdf("RCART3a.pdf", width=10, height=4)
plot(0,0, type="n", xlim=c(0,1), ylim=c(-0.7, 1.7), xlab="Age", axes=F, ylab="Survived")

axis(1)
axis(2, at=c(0,1), labels=c("No", "Yes"))
for (i in seq(age)) {
  if ((i==1) || (age[i-1]!=age[i])) {
    ppos<-1
    npos<-0
  }
  if (surv[i]) {
    points(age[i], ppos, pch=19)
    ppos <- ppos+0.1
  } else {
    points(age[i], npos, pch=19)
    npos <- npos-0.1
  }
}

predage <- as.numeric(names(pred))
yesno   <- c("N", "Y")
bluered <- c("blue", "red")
text(predage, 0.6,  yesno[pred])
left    <- 0
for (i in 1:(length(predage)-1)) {
  right <- (predage[i]+predage[i+1])/2
  lines(c(left,right), c(0.5,0.5), col=bluered[pred[i]], lwd=5)
  left <- right
}
right<-max(predage)
lines(c(left,right), c(0.5,0.5), col=bluered[pred[length(predage)]], lwd=5)

dev.off()

age <- titanic$age[index[1:1046]]
surv <- titanic$survived[index[1:1046]]

pred <- apply(table(age, surv), 1, which.max)

pdf("RCART3b.pdf", width=10, height=4)
plot(0,0, type="n", xlim=c(0,max(age)), ylim=c(-1, 2), xlab="Age", axes=F, ylab="Survived")

axis(1)
axis(2, at=c(0.2,0.8), labels=c("No", "Yes"))
for (i in seq(age)) {
  if ((i==1) || (age[i-1]!=age[i])) {
    ppos<-0.8
    npos<-0.2
  }
  if (surv[i]) {
    points(age[i], ppos, pch=19)
    ppos <- ppos+0.05
  } else {
    points(age[i], npos, pch=19)
    npos <- npos-0.05
  }
}

predage <- as.numeric(names(pred))
yesno   <- c("N", "Y")
bluered <- c("blue", "red")
#text(predage, 0.6,  yesno[pred])
left    <- 0
for (i in 1:(length(predage)-1)) {
  right <- (predage[i]+predage[i+1])/2
  lines(c(left,right), c(0.5,0.5), col=bluered[pred[i]], lwd=5)
  left <- right
}
right<-max(predage)
lines(c(left,right), c(0.5,0.5), col=bluered[pred[length(predage)]], lwd=5)

dev.off()
