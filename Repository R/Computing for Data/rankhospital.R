rankhospital <- function (state, outcome, num= "best")
{
  outcome.name <-outcome
  if (!is.character(state)) stop(); if( !is.character(outcome.name))stop()
  outcome <- read.csv ("outcome-of-care-measures.csv",colClasses="character")
  tab.state <- table(outcome$State)
  outcome.list = c("Heart Attack", "Heart Failure","Pneumonia")
  col_num = c(11,17,23)
  ## check for invalid inputs
  if( !( state %in% names(tab.state))) stop("invalid state")
  
  if (!(toupper(outcome.name) %in% toupper(outcome.list))) stop("invalid outcome")
  ##
  
  oc_num <- grep (outcome.name, outcome.list, ignore.case=T,na.omit)
  suppressWarnings(outcome [,col_num[oc_num]] <- as.numeric(outcome [,col_num[oc_num]]))
  
  s <- subset(outcome, outcome$State == state)
  s2 <- s[order(s[,col_num[oc_num]], s[,2], na.last=NA),]
  
  
  s2[,col_num[oc_num]] <- na.omit(s2[,col_num[oc_num]])

  
  if (is.character(num)){
    if (num == "best") hospital.name = s2$Hospital.Name[1]
    if (num == "worst") hospital.name =s2$Hospital.Name[length(s2[,col_num[oc_num]])]
    
  }
  else if (is.numeric(num)){
    if (num <1 ) hospital.name=NA
    else if (num > length(s2[,col_num[oc_num]])) hospital.name=NA
    else hospital.name = s2$Hospital.Name[num]
  }
  
  hospital.name
}