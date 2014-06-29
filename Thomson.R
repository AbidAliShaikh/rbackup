
b <- file('Thomson ISI Journals List.csv',open='r')
journ <- readLines(b)

data_jounls <- array(data=NA, dim=c(1,1))
index <- grep('^ISSN', journ)

journ_index <- append(1, index+1)

journ_end_index <- index-1

k=1
for (i in 1:14822){
  for (j in journ_index[i]:journ_end_index[i]) 
  {
    data_jounls[k] <- paste( data_jounls[k], journ[j])
    
} 
  k=k+1
}