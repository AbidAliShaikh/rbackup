require(lattice)
outcome <- read.csv ("outcome-of-care-measures.csv",colClasses="character")
ncol(outcome)
nrow(outcome)
outcome [,11] <- as.numeric(outcome[,11])
library(lattice)
hist(outcome[,11], main="Heart Attack 30-day Death Rate",xlab="30-day Death Rate")
outcome [,17] <- as.numeric(outcome[,17])
hist(outcome[,17],main="Heart Failure 30-day Death Rate",xlab="30-day Death Rate") 
outcome [,23] <- as.numeric(outcome[,23])
hist(outcome[,23],main="Pneumunia 30-day Death Rate",xlab="30-day Death Rate") 
par (mfrow = c(3,1))
ra <- range (outcome[,11], na.rm=T)
ra <- c(ra, range (outcome[,17], na.rm=T))
ra <- c(ra, range (outcome[,23], na.rm=T))

mean11 <- mean(outcome[,11], na.rm=T)
mean17 <- mean(outcome[,17], na.rm=T)
mean23 <-mean(outcome[,23], na.rm=T)

windows()
par (mfrow = c(3,1))
hist(outcome[,11], main="",xlab="30-day Death Rate", xlim= c(min(ra), max(ra)), prob=T)
title(substitute("Heart Attack " * bar(X) == mean , list(mean = mean11)))
lines (density(outcome[,11],na.rm=T, bw="sj"))
hist(outcome[,17],main="",xlab="30-day Death Rate",xlim= c(min(ra), max(ra)) ,prob=T) 
title(substitute("Heart Failure " * bar(X) == mean , list(mean = mean17)))
lines (density(outcome[,17],na.rm=T, bw="sj"))
hist(outcome[,23],main="",xlab="30-day Death Rate",xlim= c(min(ra), max(ra)) ,prob=T) 
title(substitute("Pnuemonia " * bar(X) == mean , list(mean = mean23)))
lines (density(outcome[,23],na.rm=T, bw="sj"))
tab.state <- table(outcome$State)
tab.state <- subset(tab.state, tab.state >= 20)
outcome2 <- subset (outcome,  outcome$State %in% names(tab.state))
death <- outcome2 [,11]
state <- outcome2$State
windows()
par(las=2)
boxplot (death ~ state, 
         main ="Heart Attack 30 Day Death Rate by State",
         ylab="30 Day Death Rate")

bymedian <- reorder(outcome2[,7], outcome2[,11], median, na.rm=T)
boxplot (death ~ bymedian, 
         main ="Heart Attack 30 Day Death Rate by State",
         ylab="30 Day Death Rate")

##########PART IV################
outcome <- read.csv("outcome-of-care-measures.csv",colClasses="character")
hospital <- read.csv("hospital-data.csv",colClasses="character")
outcome.hospital <- merge(outcome,hospital, by="Provider.Number")
death <- as.numeric (outcome[,11])
npatient <- as.numeric (outcome[,15])
xyplot(death ~ npatient | outcome.hospital$Hospital.Ownership,
       main="Heart Attack 30-day Death Rate by Ownership",
       xlab="Number of Patients seen",
       ylab="30-day Death Rate",
       panel = function (x,y,...) {
         panel.xyplot(x,y,...)
        panel.lmline(x,y,...)
         
         })






