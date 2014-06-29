sh <- read.csv('Shaista Khan.csv', header=T)

sd <- rowSums(sh[,7:106]==1,na.rm=T)
d <- rowSums(sh[,7:106]==2,na.rm=T)
u <- rowSums(sh[,7:106]==3,na.rm=T)
a <- rowSums(sh[,7:106]==4,na.rm=T)
sa <- rowSums(sh[,7:106]==5,na.rm=T)
resp <- cbind ('Strongly.Agree'=sa, 'Agree'=a,'Uncertain'=u,'Disagree'=d,'Strongly.Disagree'=sd)

#likert(resp)
indicators <- c('Course-Content&Organization'=3,'Stud.Contribution'=3,'Environment'=4,'Resources'=4,'Quality.of.Delivery'=3,'Assessment'=3,'Faculty.Eval'=19,'Tutorial'=3,'Practical'=2)
ind <- c(NULL)
for (i in 1:9) ind <- c(ind, (rep(names(indicators[i]), indicators[i])))

ind[45]='Full.Time'
ind[46]='Gender'
ind[47]='Age'
row.names(resp) <- ind
library(HH)
likert(resp[c(1:24,40:44),],col=c('Darkblue','blue','Yellow','Orange','Red'),ylab='Indicators', xlab='Number of Responses',main='Name of Faculty')
