library("psych")
scree(bfi[,1:25])
# principal component extraction
principal(bfi[,1:25], nfactors=5, rotate="none")
# principal axis extraction
fa(bfi[,1:25], nfactors=5, rotate="none", fm="pa")
# maximum likelihood extraction
fa(bfi[,1:25], nfactors=5, rotate="none", fm="ml")
# unweighted least squares extraction
fa(bfi[,1:25], nfactors=5, rotate="none")