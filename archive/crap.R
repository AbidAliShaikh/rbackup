crap<-function(state,outcome) 
  {bdata<-read.csv("outcome-of-care-measures.csv",colClasses = "character") 
   "heart attack"<-as.numeric(gsub("Not Available", NA, bdata[,11]))
   "heart failure"<-as.numeric(gsub("Not Available", NA, bdata[,17]))
   "pneumonia"<-as.numeric(gsub("Not Available", NA, bdata[,23])) 
   dx <-c("heart attack", "heart failure", "pneumonia") 
   if(is.na(match(outcome,dx)))stop("invalid outcome") 
   if(is.na(match(state,bdata$State))){stop("invalid state")} 
   dta<-bdata[order(outcome,na.last=NA),]
                               
   b<-subset(dta,dta$State==state)
                               
   b$Hospital.Name[1]}