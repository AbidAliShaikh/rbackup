corr <- function(directory, threshold = 0) {
  correlation <- vector("numeric", 0)
  cc <- vector("numeric", 0)
  filenames <-  list.files(as.vector(directory), full.names = TRUE, pattern= "*.csv")
  for (i in 1:length(filenames)){
    file <-  read.csv (filenames[i], header= TRUE)
    nobs <-  sum(complete.cases(file))
    if (nobs > threshold){
      cc = cor(file$sulfate, file$nitrate, use = "complete.obs")
    correlation <- c(correlation, cc)
}
  }
  return(correlation)
}