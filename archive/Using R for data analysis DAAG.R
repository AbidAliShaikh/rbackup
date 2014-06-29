//***********SOME SORT VS ORDER EXAMPLES ************
c <- c(1,20,2,NA,22)
sort(c)
order(c)
c[order(c)]

library(DAAG)
rainforest
sapply(rainforest,is.factor)
plot(rainforest$speciesk,rainforest$wood,na.rm=T)
sapply(rainforest[,-7], range,na.rm=T)
sum(!is.na(rainforest[,5]))
