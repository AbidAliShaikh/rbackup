// t = target o = source files
t <- read.csv('Faculty Stripping/solveitlist.csv',header=T, colClasses='character')
o <- read.csv('Faculty Stripping/originallist.csv',header=T, colClasses='character')

// to check whether name and design  mismatch between 2 specially
// professor and lecturer

profs<- o[o$Designation =='Professor',c(13,3,9,4)]
tprofs <- t[t$Designation == 'Professor' , c(1:3,13)] 
// 72 came out but original file contains 62 prof from registrar

profs[!profs$Name %in% tprofs$Name, ]


t[t$Designation == 'Professor' & !t$Name %in% o$Name, 1:3]
profs[!profs$Name %in% tprofs$Name, ]

//-----------
  lect<- o[o$Designation =='Lecturer',c(13,3,9,4)]
tlect <- t[t$Designation == 'Lecturer' , c(1:3,13)] 
tAP <- t[t$Designation == 'Assistant Professor',c(1:3,13)]
// 72 came out but original file contains 62 prof from registrar

tlect[!tlect$Name %in% lect$Name, ]

for (i in lect$Name)

  print(lect[!grep(i, tlect$Name), ])

//--------------
// following promoted to AP
  tAP[tAP$Name %in% lect$Name,]
  promoted <- character()
for (ap in tAP$Name)
 promoted <- append (agrep(ap, lect$Name, value=T),promoted)
//------------
  // the program can merge two tables on approximate 
// greping on names or any column ; will include all rows
// of the target table but matching rows of source table

// t = target o = source tables
t <- read.csv('Faculty Stripping/solveitlist.csv',header=T, colClasses='character')
o <- read.csv('Faculty Stripping/originallist.csv',header=T, colClasses='character')

ind <- numeric()
ch <- character()
  l=0
  ind2 <- 1
names <- character()
  names2 <- character()
  for (n in o$Name)
  {
    
    l <- length(agrep(n, t$Name))
  
    names <- append(names, t[agrep(n, t$Name),2])
     
    ch <- rep('',ifelse(l>0,l-1,0))
    if(l>0){
    names2 <- append(names2,n)
    
    names2 <- append(names2, ch)}
  
    
    
  }
write.csv(cbind(names,names2), 'miracl.csv')

ind <- numeric(0)
for (i in names2)
{ 
  
  if (i!= '') ind <-  append (ind, rownames(o[o$Name == i ,]))
  else ind <- append(ind, NA)
}
  
ind <- numeric(0)
for (i in names)
{ 
  
  if (i!= '') ind <-  append (ind, rownames(t[t$Name == i ,]))
  else ind <- append(ind, NA)
}
