s <- surv[surv$FM == 'Arfana Mallah'& surv$Q. %in% 1:44,7:27]
str(s)
mean(s[,1:21], na.rm=T)
AM_design <- svydesign(id=~rownames(s), data=s)
svymean(~s[,1:21], AM_design)
s[,22] <- sum(s[1:44,])
s[,22]
ss <- sapply(s[1:44,],FUN=is.na)
ss <- !ss
ss
ss[,22] <-  (ss[,1:21] == T)
sum(na.omit(as.numeric(s[1,])))
sapply(ss[1,], sum)
str(s[1:44,])
sum(!is.na(s[1:44,1:21]))