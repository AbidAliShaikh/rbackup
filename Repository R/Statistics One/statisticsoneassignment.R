
#Quiz 2
d <- read.table('Stats1.13.HW.02.txt',header=T)

#Question 8
tapply(  subset(d[,4],d$time=='post'),subset(d[,2],d$time=='post'),mean)
#Question 9
tapply(  subset(d[,4],d$time=='post'),subset(d[,2],d$time=='post'),sd)
tapply(  subset(d[,4],d$time=='pre'),subset(d[,2],d$time=='pre'),sd)

tapply(  subset(d[,4],d$time=='post'),subset(d[,2],d$time=='post'),mean)
tapply(  subset(d[,4],d$time=='pre'),subset(d[,2],d$time=='pre'),mean)