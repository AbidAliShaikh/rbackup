x <- seq(1,100, by=4)
y = diff(x)
x <- append(x, seq(1,100,by=3))
y = diff(x)

x <- sort (x)
y=diff(x)

z=NULL
z = 1:100
z <- z [!z %in% x]

data <- array(data = rep(NA,100), dim=c(100,5))
j=1
k=1

for (i in z) 
{
  data[j,k] =z[i]
  while ( (z[i]+1 == z[i+1]))
  {
    k=k+1
    i=i+1
    data[j,k]=z[i]
  }
    j=j+1
      
}
                                    
