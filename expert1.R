# The following code takes two data frames and checks both 
#name1 and name2 in each to find a match
#presently it only finds the exact matches but could be tailored
# to find partially iterating each call to expertcall() function
# with substrings from name1 and name2 :e.g  groups of four 
#or more consecutives letters also it could be made more expert
#by not matching Mr., Ms.,Prof., Prof, Abdul, Dr.,Dr etc.
# and substituting Mohd or M[[:space::]] or M. for Mohammad or
# Muhammad and A[[:space:]] or A. for Ahmed etc.
# FOR NOW expertcall function could be used alone by passing
# manually such partial strings i.e. parts of name1 and name2



expert1 <- function(){
ptm<- read.csv('ptmfaculty.csv',header=T,colClasses='character')
f <- read.csv('smbfaculty.csv',header=T, colClasses='character')
expert(ptm$Department, ptm$Name, cbind(f$Name,f$Department))
}
expert <- function( name1, name2, f)
{
# f is a data frame with two columns to search against name1 and name2
  
for (i in 1:length(name1))
{
  expertcall(name1[i],name2[i],f)
}



}

expertcall <- function(n2, n1, f)
{
 print( agrep(n1,f[agrep(n2,f[,2], ignore.case=T),1],ignore.case=T,value=T))
}