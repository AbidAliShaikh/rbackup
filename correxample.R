library(ellipse)
ctab=cor(trees)
colorfun <- colorRamp(c("#CC0000","white","#3366CC"), space="Lab")
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255))


ctab=cor(pe[pe$dept =='S',1:4])
colorfun <- colorRamp(c("#000000","white","#3366CC"), space="Lab")
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255))


library(ellipse)
ctab=cor(l[,-10])
windows()
colorfun <- colorRamp(c("red","yellow","blue"), space="Lab")
plotcorr(ctab, col=rgb(colorfun((ctab+1)/2), maxColorValue=255))
