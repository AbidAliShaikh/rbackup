analyseall <- function()
{
  
  shaista <- read.csv('Shaista Khan.csv',header=T)
   library(likert)
  shL <- as.data.frame(lapply(shaista, factor))
  for (i in 1:44) levels(shL[,i]) <- c('sa','a','u','d','sd')
  likert.bar.plot((likert(shL)))
  likert.heat.plot((likert(shL)))
  
  
}