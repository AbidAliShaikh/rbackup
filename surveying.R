# if the data is already downloaded in your machine and located in the working directory
load("example_data.Rdata")

# Otherwise load it like this

download.file("https://dl.dropbox.com/s/wuyq69lejt2frts/example_data.Rdata?token_hash=AAHX8928iEMa5oksamHJOJlTjM9hVVYYZGTS1x57jCJe_w&dl=1
", method="curl")
names(dat.example) <- c("cases", "stratum", "cluster", "econ.rating", "income", "weight")

install.packages("survey")
library(survey)

plot(dat.example$income, dat.example$econ.rating, pch=dat.example$cluster,
col=dat.example$stratum, ylab="Economy rating", xlab="Fortnight income" ,lwd=2)

# Distributions of the variables
par(mfrow=c(1,2))
hist(dat.example$income, col=rgb(0.8, 0, 0, 0.5), prob=T, main="", xlab="Fortnight income")
lines(density(dat.example$income), lwd=2)
hist(dat.example$econ.rating, col=rgb(0, 0, 0.8, 0.5), prob=T, main="", xlab="Economy rating")
lines(density(dat.example$econ.rating), lwd=2)

# Defining objects to Survey

# An SRS design
example.srs <- svydesign(id = ~1, data = dat.example)
class(example.srs)
str(example.srs)

#Cluster design 

example.clust <- svydesign(id = ~cluster, data = dat.example)

#Stratified design

example.strat <- svydesign(id = ~1, data=dat.example, strata = ~stratum)

# Weighted design

example.weights <- svydesign(id = ~1, data=dat.example, weights = ~weight)

# Complete designs for nested and non nested levels

example.non.nested <- svydesign(id = ~cluster, data = dat.example,
strata = ~stratum, weights = ~weight)

example.nested <- svydesign(id = ~cluster, data = dat.example,
strata = ~stratum, weights = ~weight, nest=T)

svymean( ~econ.rating, example.srs)
svymean( ~econ.rating, example.clust)
svymean( ~econ.rating, example.strat)
svymean( ~econ.rating, example.weights)
svymean( ~econ.rating, example.non.nested)
svymean( ~econ.rating, example.nested)

svyquantile( ~econ.rating, example.srs, quantiles = c(0.025, 0.975))
svyquantile( ~econ.rating, example.clust, quantiles = c(0.025, 0.975))
svyquantile( ~econ.rating, example.strat, quantiles = c(0.025, 0.975))
svyquantile( ~econ.rating, example.weights, quantiles = c(0.025, 0.975))
svyquantile( ~econ.rating, example.non.nested, quantiles = c(0.025, 0.975))
svyquantile( ~econ.rating, example.nested, quantiles = c(0.025, 0.975))

par(mfrow=c(1,1))

smoothScatter(dat.example$income ~ dat.example$econ.rating)

plot(dat.example$income, dat.example$econ.rating, pch=19, ylab="Economy rating", xlab="Fortnight income" ,lwd=2)

lm.srs <- svyglm(econ.rating ~ income, example.srs)
summary(lm.srs)
abline(lm.srs, col=1)
pred.srs <- predict(lm.srs,newdata=data.frame(income=700:1200) , se=T, lwd=2)
lines(700:1200, pred.srs+1.96*sqrt(attr(pred.srs, "var")), lty=2, lwd=2)
lines(700:1200, pred.srs-1.96*sqrt(attr(pred.srs, "var")), lty=2, lwd=2)

lm.clust <- svyglm(econ.rating ~ income, example.cludst)
summary(lm.clust)
abline(lm.clust, col=2, lwd=2)
pred.clust <- predict(lm.clust,newdata=data.frame(income=700:1200) , se=T, lwd=2)
lines(700:1200, pred.clust+1.96*sqrt(attr(pred.clust, "var")), lty=2, col=2, lwd=2)
lines(700:1200, pred.clust-1.96*sqrt(attr(pred.clust, "var")), lty=2, col=2, lwd=2)

lm.strat <- svyglm(econ.rating ~ income, example.strat)
summary(lm.strat)
abline(lm.strat, col=4)
pred.strat <- predict(lm.strat, newdata=data.frame(income=700:1200) , se=T, lwd=3)
lines(700:1200, pred.strat + 1.96*sqrt(attr(pred.strat, "var")), lty=2, col=4, lwd=3)
lines(700:1200, pred.strat - 1.96*sqrt(attr(pred.strat, "var")), lty=2, col=4, lwd=3)

legend(x=800, y=70, legend=c("SRS","Clustering", "Stratification"), fill=c(1,2,4))

smoothScatter(dat.example$income, dat.example$econ)

lm.weights <- svyglm(econ.rating ~ income, example.weights)
summary(lm.weights)
abline(lm.weigths, col=4)
lm.non.nested <- svyglm(econ.rating ~ income, example.non.nested)
summary(lm.non.nested)
abline(lm.non.nested, col=5)
lm.nested <- svyglm(econ.rating ~ income, example.nested)
summary(lm.nested)
abline(lm.nested, col=6)