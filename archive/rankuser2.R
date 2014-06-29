rankuser2 <- function(outcome, num = "best") { 
  # specify valid outcomes
  validOutcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)    
  
  # Check argument is valid
  col.use <- validOutcomes[outcome]
  if(is.na(col.use))stop("invalid outcome")
  
  # Read in data
  outcomesIn <- (read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available"))[,c(2,7,col.use)]
  # Convert to as.numeric
  outcomesIn[,3] <- as.numeric(outcomesIn[,3])
  
  # Create list of states sorted alphabetically
  states <- levels(factor(outcomesIn$State))
  states <- states[order(states)]
  
  # Now rank outcomesIn by state, then death rate and then hospital name 
  outcomesIn <- outcomesIn[  order(outcomesIn$State,outcomesIn[,3],outcomesIn$Hospital.Name)   ,]
  
  # Now determine number of hospitals for each state
  nhospitals <- table(outcomesIn$State[!is.na(outcomesIn[,3])])
  
  # convert second argument to index in outcomesIn data frame
  if(is.character(num)){
    if(num=='worst'){
      num <- table(outcomesIn$State[!is.na(outcomesIn[,3])])
    } else if(num=='best'){
      num <- rep(1,length(states))
    }
  }else{
    num <- rep(num,length(states))
  }
  # next make sure num in range, adjusting for offset for start of state and return hospital, NA otherwise  
  hospital <- ifelse( num <= nhospitals , outcomesIn[num + match(states,outcomesIn$State)-1,1],"<NA>")       
  
  # return data
  return(data.frame(hospital=hospital,state=states,row.names=states))
}
