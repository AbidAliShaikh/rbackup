fac <- read.csv('faculties.csv',header=T)
f <- fac[,c(1,2,4,5,6,8,12,14,18)]
write.csv(f[!complete.cases(f),],'faculties4.csv')
