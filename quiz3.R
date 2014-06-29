data <- read.table('Stats1.13.HW.03.txt',header=T)

attach(data)
#1
cor(S1.pre,S2.pre)   #.49
#2
cor(V1.pre,V2.pre)   #.90
#3
cor (V1.pre+V2.pre, S1.pre+S2.pre) # .19 i.e. convergent
#-------
S.pre <- (S1.pre+S2.pre)/2
V.pre <- (V1.pre+V2.pre)/2
cor(S.pre,V.pre)                  #.19 i.e. neither
plot(S.pre, V.pre)
lines(lowess(S.pre,V.pre))        #both
#4
V1
-----
  aer <- subset(data,data$cond =='aer')
  cor (aer$V1.pre, aer$V1.post)
  cor (aer$V2.pre, aer$V2.post)
  cor (aer$S1.pre, aer$S1.post)
  cor (aer$S2.pre, aer$S2.post)    # V2 with cor == .9
#5
verbalimprovement=V1.post-V1.pre
cor(V1.pre, verbalimprovement)
-----
  S.pre.avg <- (S1.pre+S2.pre)/2
  S.post.avg <- (S1.post + S2.post)/2
  S.gain <- S.pre.avg- S.post.avg
  cor (S.pre.avg, S.gain)
  plot(S.pre.avg, S.gain)          #the correct will be NO
#6
cor (data[cond=='aer',c(3,4,5,6)])
cor (data[cond=='des',c(3,4,5,6)])
#7
cor (data[cond=='aer',c(3,4,5,6)])
cor (data[cond=='aer',c(3,4,5,6)])
#8
pairs (data[,c(3,4,7,8)])
#9
pairs (data[,c(5,6,9,10)])


