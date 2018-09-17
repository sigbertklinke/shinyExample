library("spdep")
data("boston")
pdf("boston_pts.pdf", width=5, height=6)
plot(boston.c$LON, boston.c$LAT, pch=19, asp=T, cex=0.4, col=boston.c$CHAS)
dev.off()
#
library("OpenStreetMap")
ul <- c(42.6,-71.5)
lr <- c( 42.1,-70.5)
url <- "https://a.tiles.mapbox.com/v4/mapquest.streets-mb/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwcXVlc3QiLCJhIjoiY2Q2N2RlMmNhY2NiZTRkMzlmZjJmZDk0NWU0ZGJlNTMifQ.mPRiEubbajc6a5y9ISgydg"
map <- openmap(ul,lr,minNumTiles=4, type=url)
plot(map)