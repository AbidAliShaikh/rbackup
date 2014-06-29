rankhospital2 <- function (state, outcome.name, num="best"){
  
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
  s2[,column[[OUTCOME_NAME]]] <- na.omit(s2[,column[[OUTCOME_NAME]]])
  
  
  
        if(num== "best") print(s2$Hospital.Name[1])
        if (num== "worst") print(s2$Hospital.Name[length(s2[,2])])
          
        if(is.numeric(num)) print(s2$Hospital.Name[num]  )
         
}
         
