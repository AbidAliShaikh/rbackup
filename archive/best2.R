best2 <- function (state, outcome.name){
  
  if (!is.character(state)) stop(); if( !is.character(outcome.name))stop()
  outcome <- read.csv ("outcome-of-care-measures.csv",colClasses="character")
  tab.state <- table(outcome$State)
  
  column = c("HEART ATTACK"=11, "HEART FAILURE"=17,"PNEUMONIA"=23)
  
  ## check for invalid inputs
  if( !( state %in% names(tab.state))) stop("invalid state")
  
  if (!(toupper(outcome.name) %in% names(column))) stop("invalid outcome")
  ##
  OUTCOME_NAME <- toupper(outcome.name)
  suppressWarnings(outcome [,column[[OUTCOME_NAME]]] 
                    <- as.numeric(outcome[,column [[OUTCOME_NAME]]]))
  
  s <- subset(outcome, outcome$State == state)
  s2 <- s[order(s[,column[[OUTCOME_NAME]]], s[,2], na.last=NA),]
  
  s2$Hospital.Name[1]
  }
