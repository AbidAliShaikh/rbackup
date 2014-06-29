completev2 <- function(directory, id=1:332)
{
  if (!is.integer(id)) stop()
  nobs <- c()
  
  
  
  finames <- sprintf("%s/%03.0f.csv",directory, id)
  
  for (finame in finames)
  {
  f <- read.csv (finame, head=T, colClasses=c(Date="Date", Sulphate="numeric",
                                            Nitrate="numeric", id="integer") )
  f <- na.omit(f)
  
  nobs <- c(nobs, nrow(f))
  }
  data.frame(id,nobs)
}