kth <- function(cum, count, k) {
     if ('best' == k)
         k <- 1
     
     if ('worst' == k)
         k <- count
   
     if (k > count)
         NA
     else
         cum - count + k
   }
 
 rankuser1 <- function(outcome, num = 'best') {
     accepted_outcomes <- data.frame(outcome = c('heart attack', 'heart failure', 'pneumonia'), column = c(11, 17, 23))
     rankCol <- accepted_outcomes$column[accepted_outcomes$outcome == outcome]
   
     if (0 == length(rankCol))
         stop('invalid outcome')
   
     data <- read.csv('outcome-of-care-measures.csv', colClasses='character')
     colnames(data)[rankCol] <- 'Outcome'
     data <- data[!is.na(data$Outcome), ]
     data <- data[order(data$State, as.numeric(data$Outcome), data$Hospital.Name), ]
   
     count <- aggregate(Outcome ~ State, data, length)
     data.frame(hospital = data$Hospital.Name[mapply(kth, cumsum(count$Outcome), count$Outcome, num)],
                                state = count$State)
   }
