rankall <- function (outcome, num= "best")
{
  outcome.name <-outcome
  if( !is.character(outcome.name))stop()
  outcome <- read.csv ("outcome-of-care-measures.csv",colClasses="character")
  tab.state <- table(outcome$State)
  N <- 1e4
  s <- NULL
  df <- data.frame(hospital=rep("",N), state=rep("",N), stringsAsFactors=FALSE)
  ##DF <- df
  outcome.list = c("Heart Attack", "Heart Failure","Pneumonia")
  col_num = c(11,17,23)
  outcomebystates<-NULL
  hospital.data <- c()
  #hospital <- data.frame(c(), c()) #
      ## check for invalid inputs
      ##if( !( state %in% names(tab.state))) stop("invalid state")
  
  if (!(toupper(outcome.name) %in% toupper(outcome.list))) stop("invalid outcome")
      ##
  
  oc_num <- grep (outcome.name, outcome.list, ignore.case=T,na.omit)
  suppressWarnings(outcome [,col_num[oc_num]] <- as.numeric(outcome [,col_num[oc_num]]))
  
      ##s <- subset(outcome, outcome$State == state)
  for (state in names(tab.state))
  {
    ##o[order(o[,11]], o[,2], state,na.last=NA),])
    o <- subset (outcome, outcome$State == state)
    o <- o[order(o[,col_num[oc_num]], o[,2], na.last=NA),]  
            ##outcomebystates[state] <- data.frame(outcomebystates,o) 
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
  
  #hospital.data <- c(hospital.name, hospital.data) #
        #hospital[state] <- data.frame(hospital, state)   
  hospital <- hospital.name
  s <- c(s, state)
  df[state,] <- c(hospital, state)
  #print(df[state,])
     }
        #hospital.data <- data.frame(rev(hospital.data), names(tab.state))#
 ##for (state in names(tab.state))
  df[s,]
  #hospital #
  }