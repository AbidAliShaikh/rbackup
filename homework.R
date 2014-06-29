

f <- cbind (   fac11[fac11$Name %in% fac13$Name & fac11$dept %in%fac13$dept, ])






samp50 <- rep(NA,5000)
for (i in 1:5000)
{
  samp <- sample(Gr.Liv.Area, 50)
  samp50 [i] <- mean(samp)
  
}
hist(samp50)



sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)
for (i in 1:5000) {
  samp <- sample(Gr.Liv.Area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(Gr.Liv.Area, 100)
  sample_means100[i] <- mean(samp)
}

samp60 <- rep(NA, 5000)
for (i in 1:5000)
{
  samp <- sample(SalePrice, 60)
  samp60[i] <- mean(samp)
}




smean <- rep(NA, 50)
ssd <- rep(NA, 50)
n <- 60

for (i in 1:50)
{
  samp <- sample(Gr.Liv.Area, n)
  smean[i] <- mean (samp)
  ssd[i] <- sd(samp)
}

lower <- smean - 1.96 * (ssd/sqrt(n))
upper <- smean + 1.96 * (ssd/sqrt(n))


c(lower, upper)
plot.ci(lower, upper, mean(Gr.Liv.Area))


//------home work week 5  BOOTSTRAPPING

bootmeans <- rep(NA, 100)
for (i in 1:100)
{
  s <- sample(gained_clean, length(gained_clean), replace=T)
  bootmeans[i] = mean(s)
}

// The bootstrap is calculated by resampling from the sample
// 90% CI using BOOTSTRAPPING (PERCENTILE METHOD)
sortedb <- sort(bootmeans)
b <- sortedb[6:length(sortedb)-5]
ci = c(min(b), max(b))

// 90% CI using BOOTSTRAPPING (STANDARD ERROR METHOD)
m = mean (bootmeans)
se = sd(bootmeans)       
// note: sample size in denominator is not used when using bootstrapping

// for 90% CI alpha = .05 
z = qnorm(.05)
ci = c(m+z*se, m-z*se)





