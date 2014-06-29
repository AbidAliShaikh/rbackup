corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
   
  ## Return a numeric vector of correlations
      
  corfinal <- vector ("numeric",0)
  corop <- corfinal
  ##matrix4cor <- matrix (ncol=2 , nrow=332)
  source("getmonitor.R")
  for (i in 1:332) { 
    filedf <- getmonitor(i, directory)
    cc <- sum(complete.cases(filedf))
    if (cc > threshold)
    {
      
     filedf <- na.omit(filedf)
      ## matrix4cor <- matrix (c(filedf$sulfate, filedf$nitrate), ncol=2)
      corop<- cor(x=filedf$sulfate,y=filedf$nitrate )
    
      corfinal <- c(corop, corfinal)
    }
     ## nono no calculate for each monitor iteratively
      ## compare threshold with each monitor cc number in each files
      
    
  }
  return(corfinal)  
  ##print(corfinal)
    
}          