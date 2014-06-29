best <- function (state, outcome.name){
  ##options(warn=-1)
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
  
  s2$Hospital.Name[1]
  }
