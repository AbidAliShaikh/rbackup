

pIII <- read.csv('Society Phase-III.csv', header=T, colClasses='character')
old <- read.csv('Phase-I-II.csv',header=T, colClasses='character')

#script begins here
nums <- rep(NA,1000)
indexIII <- rep(NA,1000)
for (i in 1:nrow(pIII))
{
  l<- length(grep(paste('.*',pIII$Name[i],'.*'),old$Name..of..Allotters,ignore.case=T))
  indexIII<- c(rep(i,l),indexIII)
nums <- c(grep(paste('.*',pIII$Name[i],'.*'),old$Name..of..Allotters,ignore.case=T),nums)

}
write.csv(cbind (pIII[indexIII,],old[nums,]),'dup2israr.csv')
#Run above script upto here or its  alternative below

#For functionality of agrep
nums_agrep <- rep(NA,10000)
indexIII_agrep <- rep(NA,10000)
for (i in 1:nrow(pIII))
{
  l2<- length(agrep(pIII$Name[i],old[agrep(pIII$Department,old$Inst....Dept.,ignore.case=T),4],ignore.case=T))
  indexIII_agrep<- c(rep(i,l2),indexIII_agrep)
  nums_agrep <- c(agrep(pIII$Name[i],old[agrep(pIII$Designation,old$Designation,ignore.case=T),4],ignore.case=T),nums_agrep)
  
}
# this script ends here

#NEW SCRIPT BEGINS
old <- read.csv('Phase-I-II.csv',header=T, colClasses='character')
sc <- read.csv('scrutiny results partial.csv',header=T, colClasses='character')
nums <- rep(NA,10000)
indexIII <- rep(NA,10000)
for (i in 1:nrow(sc))
{
  l<- length(grep(paste('.*',sc$Name[i],'.*'),old$Name..of..Allotters,ignore.case=T))
  indexIII<- c(rep(i,l),indexIII)
  nums <- c(grep(paste('.*',sc$Name[i],'.*'),old$Name..of..Allotters,ignore.case=T),nums)
  
}
write.csv(cbind (sc[indexIII,],old[nums,]),'dup4mscrutiny.csv')