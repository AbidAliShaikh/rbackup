d<- read.csv('app-pass.csv',header=T)
fac <- read.csv('depts.csv',header=T)

d[,33] <- rep('',1098)

for (i in 1:1098)
{
  d[i,33]<- as.vector (fac[fac$depts == d[i,27], 2])
}