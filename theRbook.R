library(ggplot2)
library(reshape)
s <- read.table('crawley/sales.txt',header=T)
s <- melt(s)
names(s)[2:3] <-c('season','sales') 

qplot( name, sales, data=s,stat='identity')+geom_bar(stat='bin')
+geom_point(aes(color=season)
              
s <- read.table('crawley/scatter1.txt',header=T)
smoothScatter(s,bandwidth=seq(1,100,.01),colramp=colorRampPalette(c('white',blues9)))
smoothScatter(s,colramp=colorRampPalette(c('orange',blues9)))
smoothScatter(s,bandwidth=seq(1,100,.01),colramp=colorRampPalette(c('white','skyblue','blue','darkblue'),space='Lab'))

###fun with colorRampPallete
d <- colorRampPalette(c('purple','yellow','blue'))
barplot(rep(3,30),col=d(30))
d <- colorRamp(c('purple','yellow','blue'))
barplot(rep(3,50), col=d(seq(.01,.5,.01))) #not much here
  
#################
windows()
g <- ggplot(s, aes(x=s$xv,y=s$ys))+geom_smooth(method='lm',size=3,colour='blue')
g <- g+geom_point(colour='skyblue',alpha=1/2)

s2 <- read.table('crawley/scatter2.txt',header=T)
  
g+geom_point(aes(s2$xv2,s2$ys2))  
### or else using smoothScatter
smoothScatter(s,bandwidth=seq(1,100,.01),colramp=colorRampPalette(c('white','skyblue','blue','darkblue'),space='Lab'))
abline(lm(s$ys~s$xv))
points(s2$xv2, s2$ys2,col='green')
abline(lm(s2$ys~s2$xv))
##############
  
sl <- read.table('crawley/sleep.txt',header=T)
attach(sl)
  
qplot(factor(Days), Reaction )  +geom_boxplot(fill=d(length(unique(Days))))  +geom_smooth(method='lm',aes(group=1))#+geom_point(aes(x=factor(Days),y=mean),colour='red',size=3)  

  plot(factor(Days), Reaction,col=rainbow(10))
  abline(lm(Reaction ~ (Days)))
    
#########################################333
pgr <- read.table('crawley/pgr.txt',header=T)
attach(pgr)
qplot(hay,pH,size=as.integer(FR))+geom_point( color='steelblue',aes(text(hay,pH,labels=FR)))+geom_smooth()
#######################################

w <- read.table('crawley/SilwoodWeather.txt',header=T)
 qplot( factor(month),lower)+geom_boxplot()  +geom_boxplot(aes(factor(month),upper))
  
  g <- ggplot(w,aes(factor(month),lower))+geom_boxplot()
  g+geom_boxplot(aes(factor(month),lower))+geom_boxplot(aes(factor(month),upper))+geom_abline()
  windows()
  g+geom_bin2d(aes(factor(month),lower))
    g+geom_jitter(aes(factor(month),lower))
  g+geom_raster(aes(factor(month),lower))
  
  model <- aov(lower ~ factor(month))
  pdf(file='tukey.pdf',height=50)
  plot(TukeyHSD(model))
  dev.off()
  
  