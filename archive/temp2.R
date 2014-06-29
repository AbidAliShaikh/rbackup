rankall <- function (outcome, num= "best")
{
  outcome.name <-outcome
  if( !is.character(outcome.name))stop()
  outcome <- read.csv ("outcome-of-care-measures.csv",colClasses="character")
  tab.state <- table(outcome$State)
  N <- 1e4
  s <- NULL
  df <- data.frame(hospital=rep("",N), state=rep("",N), stringsAsFactors=FALSE)

  outcome.list = c("Heart Attack", "Heart Failure","Pneumonia")
  col_num = c(11,17,23)
  outcomebystates<-NULL
  hospital.data <- c()
  if (!(toupper(outcome.name) %in% toupper(outcome.list))) stop("invalid outcome")
  oc_num <- grep (outcome.name, outcome.list, ignore.case=T,na.omit)
  suppressWarnings(outcome [,col_num[oc_num]] <- as.numeric(outcome [,col_num[oc_num]]))
  
  for (state in names(tab.state))
  {
    o <- subset (outcome, outcome$State == state)
    o <- o[order(o[,col_num[oc_num]], o[,2], na.last=NA),]  
            o[,col_num[oc_num]] <- na.omit(o[,col_num[oc_num]])
    
  if (is.character(num)){
    if (num == "best") hospital.name = o$Hospital.Name[1]
    if (num == "worst") hospital.name =o$Hospital.Name[length(o[,col_num[oc_num]])]
  
  }
  else if (is.numeric(num)){
    if (num <1 ) hospital.name=NA
    else if (num > length(o[,col_num[oc_num]])) hospital.name=NA
    else hospital.name = o$Hospital.Name[num]
  }
  
  hospital <- hospital.name
  s <- c(s, state)
  df[state,] <- c(hospital, state)
     }
  df[s,]
}