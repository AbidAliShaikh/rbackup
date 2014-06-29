N <- 1000
s <- NULL
files <- data.frame(levelofEdu=rep("",N), stringsAsFactors=FALSE)
f2 <- c("")
directory<-c("2007-2012")
j=1
filenames <-  list.files(as.vector(directory), full.names = TRUE, pattern= "*.csv")
for (i in 1:length(filenames)){

  f <- read.csv(filenames[i],fill=T,as.is=T,skip=6,header=F)
  f <- cbind(f, filenames[i])
  f[1:9,27]<- 'annual'
  f[14:22, 27] <- 'supply'
  f2 <- rbind(f2,f)

}
  f3 <- na.omit(f2)
  f2007 <- cbind(f3[,c(1,2:5, 26:27)],'2007',deparse.level=0)
  f2008 <- cbind(f3[,c(1,6:9, 26:27)],'2008',deparse.level=0)
  f2009 <- cbind(f3[,c(1,10:13, 26:27)],'2009',deparse.level=0)
  f2010 <- cbind(f3[,c(1,14:17, 26:27)],'2010',deparse.level=0)
  f2011 <- cbind(f3[,c(1,18:21, 26:27)],'2011',deparse.level=0)
  f2012 <- cbind(f3[,c(1,22:25,26:27)], '2012',deparse.level=0)
names(f2007) <- 1:8
names(f2008) <- 1:8
names(f2009) <- 1:8
names(f2010) <- 1:8
names(f2011) <- 1:8
names(f2012) <- 1:8

fYear <- rbind(f2007,f2008,f2009,f2010,f2011,f2012,deparse.level=0)


write.csv(fYear, 'Yearly.csv')
fAppeared <- cbind(fYear[,c(1,2:3,6:8)],'appeared')
fPassed <- cbind(fYear[,c(1,4:5,6:8)],'passed')
names(fAppeared) <-1:7
names(fPassed) <- 1:7
fSemFinal <- rbind(fAppeared,fPassed)
write.csv(fSemFinal, 'semFinal.csv')
fM <- cbind(fSemFinal[,c(1:2,4:7)],'M')
fF <- cbind(fSemFinal[,c(1,3:7)],'F')
names(fM) <- 1:7
names(fF) <- 1:7
final <- rbind(fM,fF)
write.csv(final, 'final.csv')