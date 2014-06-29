


course <- read.csv('Carbohydrates -taugh by Ms. Afsheen Shah.csv', header=T)
row.names(course) <- course[,1]
allMeans <- course[,46:57]
allMeans[,1] <- as.factor(allMeans[,1])
allMeans[,2] <- as.factor(allMeans[,2])
allMeans[,3] <- as.factor(allMeans[,3])
cor(allMeans[,4:12])