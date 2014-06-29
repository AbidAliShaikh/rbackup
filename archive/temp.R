

rankall <- function (outcome, num= "best")
{
  outcome.name <-outcome
  ## here I checked for validity and reading csv.....
  tab.state <- table(outcome$State)
  N <- 1e4
  states <- NULL
  ## The following line initiates a blank data frame
  df <- data.frame(hospital=rep("",N), state=rep("",N), stringsAsFactors=FALSE)
  ## Following 2 lines make two vecgtors for outcome and outcome number
  outcome.list = c("Heart Attack", "Heart Failure","Pneumonia")
  col_num = c(11,17,23)
  ## Now it is easy to check which outcome passed is not valid
  if (!(toupper(outcome.name) %in% toupper(outcome.list))) stop("invalid outcome")
 oc_num <- grep (outcome.name, outcome.list, ignore.case=T,na.omit)
  ## Now I converted all rows of that outome to numeric
  suppressWarnings(outcome [,col_num[oc_num]] <- as.numeric(outcome [,col_num[oc_num]]))
 for (state in names(tab.state))
  {
    o <- subset (outcome, outcome$State == state)
    o <- o[order(o[,col_num[oc_num]], o[,2], na.last=NA),]  
    o[,col_num[oc_num]] <- na.omit(o[,col_num[oc_num]])
 ## Here I checked for the three cases on o
    }
  states <- c(states, state)
  df[state,] <- c(hospital, state)
  df[states,]
   }