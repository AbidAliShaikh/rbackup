#Quiz 2
setInternet2(use=T)
con <- url('http://simplystatistics.tumblr.com/')
s <- readLines(con, 150)
nchar (s[c(2,45,122)])


#Assignment One
load('../Data Analysis/Assignment One//loansData.rda')
attach(loansData)
loansData[,3] <- as.numeric(sub('%','',loansData[,3]))/100
loansData[,6] <- as.numeric(sub('%','',loansData[,6]))/100
attach(loansData)
model1 <- lm(Interest.Rate ~ Debt.To.Income.Ratio)
summary(model1) # Only 3% variance is explained by this model
summary(Employment.Length)
tapply(Interest.Rate, Employment.Length, sum) # No relationship
model2 <- lm(Interest.Rate ~ Inquiries.in.the.Last.6.Months)
summary(model2) # Only 2.7 variance explained
model3 <- lm(Interest.Rate ~ Revolving.CREDIT.Balance)
summary(model3) # no luck
model4 <- lm(Interest.Rate ~ Open.CREDIT.Lines)
summary(model4) # no luck
## LETS PLAY WITH FICO RANGE
library(reshape)
loansData <- transform(loansData, FICO.Range = colsplit(FICO.Range, split='-', names=c('low','high')))
attach(loansData)
loansData$meanFICO <- rowMeans(FICO.Range)
attach(loansData)
head(loansData)
model5<- lm (Interest.Rate ~ meanFICO)
summary(model5)    # WOW! 50% variance is defined by the model and it is significant 
## LETS DO THE MEDIATION ANALYSIS BY SOBEL FUNCTION
library(multilevel)
model.sobel <- sobel(meanFICO, Inquiries.in.the.Last.6.Months , Interest.Rate)
model.sobel # z value is -3.88 which is high enough, so inquiries mediates the effect statistically negatively
model.sobel2 <- sobel( Inquiries.in.the.Last.6.Months ,meanFICO, Interest.Rate)
model.sobel2 # z value is 4.6 which is higher enough, so meanFICO mediates the effect