# acacia ants (Hand (1994), Handbook of small datasets)
aa <- data.frame(acacia=c("A", "B", "A", "B"),
                 invaded=c("No", "No", "Yes", "Yes"),
                 Freq=c(2,10,13,3))
tab <- xtabs(Freq~acacia+invaded, data=aa)
tab
fisher.test(tab)