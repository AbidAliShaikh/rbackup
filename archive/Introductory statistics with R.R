weight <- c(60, 72, 57, 90, 95, 72)
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight/height^2
s_dev <- sqrt(sum((weight-mean(weight))^2)/(length(weight)-1))

plot(height, weight)
// as we know ideal bmi = 22.5 we can calculate ideal weights
// line for given heights above
lines(height, 22.5 * height^2)
// since the heights are not sorted the line will run forth
// and back between points

//*********FUNCTION ARGUMENTS **************
args(plot.default)

//***************MATRIX *****************
a <- 1:16;  dim(a) <- c(4,4); rownames(a) <- letters[1:4]
x<- matrix(1:9, nrow=3, byrow=T); rownames(x) <- LETTERS[1:3]
y<-cbind(A=1:3,B=4:6,C=7:9)
y<-rbind(A=1:3,B=4:6,C=7:9)
month.name;month.abb

///*********factors and categorial data ***********
// may be useful for surveys
response <- c(4,1,2,3,4,3,2,3,1,2,3,4,2)
resp_lev <- factor(response, levels=(1:4))
levels(resp_lev) <- c("Strongly Disagree","Disagree","Agree","Strongly Agree")
plot(resp_lev); as.numeric(resp_lev);levels(resp_lev)


//**************EXERCISE 1 *******************

  // 1.1
  all.equal(a,b)
//1.3
// data set not available
sapply(rexp(20), rep(20))

//********SAVING OUTPUT ***************
  sink("outputfile")
ls()
sink(file=NULL)

//**************ATTACH, DETACH, DATA(PACKAGE) *************
search();attach(iris);search();detach(iris);search()

/*Note also that changing a data frame after attaching it will not affect the
variables available since attach involves a (virtual) copy operation of the
data frame.  It is, how-ever, possible to specify that a data frame should be searched before
.GlobalEnv by using constructions of the form*/

with(thuesen, plot(blood.glucose, short.velocity))

//*******DOWNLOAD PACKAGE NAMED ISwR for this book*********

//*********** using WITHIN *********************
  a<- within (iris,{
  log.iris <- log(iris$Sepal.Length)
  m <- mean(log.iris)
  centered.iris.log <- log.iris-m
  rm(m)
    } )
a
//**********PLOT, TEXT, ABLINE, RUNIF, MTEXT***************
plot(sort(c(runif(50,0,2),runif(50,0,2))))
hist(sort(c(runif(50,0,2),runif(50,0,2))))       
text(.6,.6,"text at (.6,.6)")
abline(.6,6) 
// i.e. y=a+bx  a,b are args but can also be used for straight line
mtext(1,text="hello")
mtext(1,text="hellow",side=1,at=.7)
for (side in 1:4) mtext(-1:4, side=side, text=1:4)

//************BLANK PLOT ********************
x=rnorm(100);y=rnorm(100)
  plot(x,y, type="n", xlab="",ylab="",axes=F)
points(x,y)
axis(1)
axis(2, at=seq(-2,2,.1))
box()
title(main="Plot Dissection", xlab="100 rand",ylab="100 rand",sub="subtile")


