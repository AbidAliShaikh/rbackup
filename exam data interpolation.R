## Exam data interpolation

a <- scan('2007-2012/BOTANY.csv', skip=6,what='character')
a <- grep('^,',a,value=T)
a <- strsplit(a,',')

a [10] <- NA
a[11] <- NA
a <- na.omit(a)
a <- unlist(a)
a[a == ''] <- NA
a <- na.omit(a)

a[a=='-'] <- -1
a <- as.numeric(a)
a <- matrix(a, nrow=18, byrow=T)

## we got here now is only numbers in 18 by 25 matrix of exam data