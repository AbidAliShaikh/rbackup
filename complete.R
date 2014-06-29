complete <- function(directory, id=1:332)
{
  range=id
  cases <- c()
  for (id in range){
    file <- getmonitor(id, directory)
    cc <- sum(complete.cases(file))
  
    cases <- c(cases,cc)
    
  }
  id=range 
  print(data.frame(id, nobs=cases))
}