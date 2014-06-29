complete <- function(directory, id = 1:332) {
  
  for(i in id) {
    
    if(i<10) {x=paste("00",i,sep="")}
    
    if(i>9 && i<100) {x=paste("0",i,sep="")}
    
    if(i>=100) {x=i}
    
    y=paste(x,".csv",sep="",collapse="")
    
    data=paste(directory,"\",y,sep="",collapse="")

               a=read.csv(data, head=TRUE)
               
               b=a[complete.cases(a),]
               
               nobs=nrow(b)
               
               next(i) }
               
               c=data.frame(id,nobs)
               
               print(c) }