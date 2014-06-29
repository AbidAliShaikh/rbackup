getmonitor <- function (id, directory, summarize= FALSE )
{
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here 
  
  id = as.numeric(id)
  ##directory = as.character(directory)
  
  
  
  if (id <= 9) id=paste("00",id,sep="")
  
  else { if (id<=99) id=paste("0",id,sep="")
  }
  
  f = paste(directory,"/",id,".csv",sep="")
          
  
   data <- read.csv(f, header=T, colClasses= c(Date = "Date",sulphate="numeric",nitrate="numeric",ID="integer"))
  
  
  if (summarize ) print(summary(data))
  else data
  
}
 