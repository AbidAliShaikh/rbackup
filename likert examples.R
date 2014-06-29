## See file HH/demo/likert-paper.r for a complete set of examples using
## the formula method into the underlying lattice:::barchart plotting
## technology.  See file HH/demo/likert-paper-noFormula.r for the same
## set of examples using the matrix and list of matrices methods.  See
## file HH/demo/likertMosaic-paper.r for the same set of examples using
## the still experimental functions built on the vcd:::mosaic as the
## underlying plotting technology

require(grid)
require(lattice)
require(latticeExtra)
require(HH)

data(ProfChal)  ## ProfChal is a data.frame.
## See below for discussion of the dataset.


## Count plot
likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
       main='Is your job professionally challenging?',
       ylab=NULL,
       sub="This plot looks better in a 9in x 4in window.")

## Percent plot calculated automatically from Count data
likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
       as.percent=TRUE,
       main='Is your job professionally challenging?',
       ylab=NULL,
       sub="This plot looks better in a 9in x 4in window.")

## formula method
data(NZScienceTeaching)
likert(Question ~ . | Subtable, data=NZScienceTeaching,
       ylab=NULL,
       scales=list(y=list(relation="free")), layout=c(1,2))

## Not run: 
## formula notation with expanded right-hand-side
likert(Question ~
         "Strongly disagree" + Disagree + Neutral + Agree + "Strongly agree" |
         Subtable, data=NZScienceTeaching,
       ylab=NULL, 
       scales=list(y=list(relation="free")), layout=c(1,2))

## End(Not run)

## Not run: 
## formula notation with long data arrangement
NZScienceTeachingLong <- melt(NZScienceTeaching, id.vars=c("Question", "Subtable"))
names(NZScienceTeachingLong)[3] <- "Agreement"
head(NZScienceTeachingLong)

likert(Question ~ Agreement | Subtable, value="value", data=NZScienceTeachingLong,
       ylab=NULL,
       scales=list(y=list(relation="free")), layout=c(1,2))

## End(Not run)

## Examples with higher-dimensional arrays.
tmp3 <- array(1:24, dim=c(2,3,4),
              dimnames=list(A=letters[1:2], B=LETTERS[3:5], C=letters[6:9]))

## positive.order=FALSE is the default.  With arrays
## the rownames within each item of an array are identical.

## likert(tmp3)
likert(tmp3, layout=c(1,4))
likert(tmp3, layout=c(2,2), resize.height=c(2,1), resize.width=c(3,4))


## plot.likert interprets vectors as single-row matrices.
## http://survey.cvent.com/blog/customer-insights-2/box-scores-are-not-just-for-baseball
Responses <- c(15, 13, 12, 25, 35)
names(Responses) <- c("Strongly Disagree", "Disagree", "No Opinion",
                      "Agree", "Strongly Agree")
## Not run: 
likert(Responses, main="Retail-R-Us offers the best everyday prices.",
       sub="This plot looks better in a 9in x 2.6in window.")

## End(Not run)
## reverse=TRUE  is needed for a single-column key with
## horizontal=FALSE and with space="right"
likert(Responses, horizontal=FALSE,
       aspect=1.5,
       main="Retail-R-Us offers the best everyday prices.",
       auto.key=list(space="right", columns=1,
                     reverse=TRUE, padding.text=2),
       sub="This plot looks better in a 4in x 3in window.")


## Not run: 
## Since age is always positive and increases in a single direction,
## this example uses colors from a sequential palette for the age
## groups.  In this example we do not use a diverging palette that is
## appropriate when groups are defined by a characteristic, such as
## strength of agreement or disagreement, that can increase in two directions.

## Initially we use the default Blue palette in the sequential_hcl function.
likert(AudiencePercent,
       auto.key=list(between=1, between.columns=2),
       xlab="Percentage of audience younger than 35 (left of zero) and older than 35 (right of zero)",
       main="Target Audience",
       col=rev(sequential_hcl(4)),
       sub="This plot looks better in a 7in x 3.5in window.")

## The really light colors in the previous example are too light.
## Therefore we use the col argument directly.  We chose to use an
## intermediate set of Blue colors selected from a longer Blue palette.
likert(AudiencePercent,
       positive.order=TRUE,
       auto.key=list(between=1, between.columns=2),
       xlab=paste("Percentage of audience younger than 35",
                  "(left of zero) and older than 35 (right of zero)"),
       main="Brand A has the most even distribution of ages",
       col=sequential_hcl(11)[5:2],
       scales=list(x=list(at=seq(-90,60,10),
                          labels=as.vector(rbind("",seq(-80,60,20))))),
       sub="This plot looks better in a 7in x 3.5in window.")

## End(Not run)


## Not run: 
## See the ?as.pyramidLikert help page for these examples
## Population Pyramid
data(USAge.table)
USA79 <- USAge.table[75:1, 2:1, "1979"]/1000000
PL <- likert(USA79,
             main="Population of United States 1979 (ages 0-74)",
             xlab="Count in Millions",
             ylab="Age",
             scales=list(
               y=list(
                 limits=c(0,77),
                 at=seq(1,76,5),
                 labels=seq(0,75,5),
                 tck=.5))
)
PL
as.pyramidLikert(PL)

likert(USAge.table[75:1, 2:1, c("1939","1959","1979")]/1000000,
       main="Population of United States 1939,1959,1979 (ages 0-74)",
       sub="Look for the Baby Boom",
       xlab="Count in Millions",
       ylab="Age",
       scales=list(
         y=list(
           limits=c(0,77),
           at=seq(1,76,5),
           labels=seq(0,75,5),
           tck=.5)),
       strip.left=FALSE, strip=TRUE,
       layout=c(3,1), between=list(x=.5))

## End(Not run)


Pop <- rbind(a=c(3,2,4,9), b=c(6,10,12,10))
dimnames(Pop)[[2]] <- c("Very Low", "Low", "High", "Very High")
likert(as.listOfNamedMatrices(Pop),
       as.percent=TRUE,
       resize.height="rowSums",
       strip=FALSE,
       strip.left=FALSE,
       main="Area and Height are proportional to 'Row Count Totals'.\nWidth is exactly 100%.")


## Professional Challenges example.
##
## The data for this example is a list of related likert scales, with
## each item in the list consisting of differently named rows.  The data
## is from a questionnaire analyzed in a recent Amstat News article.
## The study population was partitioned in several ways.  Data from one
## of the partitions (Employment sector) was used in the first example
## in this help file.  The examples here show various options for
## displaying all partitions on the same plot.
##
data(ProfChal)
levels(ProfChal$Subtable)[6] <- "Prof Recog" ## reduce length of label

## 1. Plot counts with rows in each panel sorted by positive counts.
##
## Not run: 
likert(Question ~ . | Subtable, ProfChal,
       positive.order=TRUE,
       main="This works, but needs more specified arguments to look good")

likert(Question ~ . | Subtable, ProfChal,
       scales=list(y=list(relation="free")), layout=c(1,6),
       positive.order=TRUE,
       between=list(y=0),
       strip=FALSE, strip.left=strip.custom(bg="gray97"),
       par.strip.text=list(cex=.6, lines=5),
       main="Is your job professionally challenging?",
       ylab=NULL,
       sub="This looks better in a 10inx7in window")

## End(Not run)

ProfChalCountsPlot <-
  likert(Question ~ . | Subtable, ProfChal,
         scales=list(y=list(relation="free")), layout=c(1,6),
         positive.order=TRUE,
         box.width=unit(.4,"cm"),
         between=list(y=0),
         strip=FALSE, strip.left=strip.custom(bg="gray97"),
         par.strip.text=list(cex=.6, lines=5),
         main="Is your job professionally challenging?",
         rightAxis=TRUE,  ## display Row Count Totals
         ylab=NULL,
         sub="This looks better in a 10inx7in window")
ProfChalCountsPlot


## Not run: 
## 2. Plot percents with rows in each panel sorted by positive percents.
##    This is a different sequence than the counts.  Row Count Totals are
##    displayed on the right axis.
ProfChalPctPlot <-
  likert(Question ~ . | Subtable, ProfChal,
         as.percent=TRUE,    ## implies display Row Count Totals
         scales=list(y=list(relation="free")), layout=c(1,6),
         positive.order=TRUE,
         box.width=unit(.4,"cm"),
         between=list(y=0),
         strip=FALSE, strip.left=strip.custom(bg="gray97"),
         par.strip.text=list(cex=.6, lines=5),
         main="Is your job professionally challenging?",
         rightAxis=TRUE,  ## display Row Count Totals
         ylab=NULL,
         sub="This looks better in a 10inx7in window")
ProfChalPctPlot

## 3. Putting both percents and counts on the same plot, both in
##    the order of the positive percents.

LikertPercentCountColumns(Question ~ . | Subtable, ProfChal,
                          layout=c(1,6), scales=list(y=list(relation="free")),
                          ylab=NULL, between=list(y=0),
                          strip.left=strip.custom(bg="gray97"), strip=FALSE,
                          par.strip.text=list(cex=.7),
                          positive.order=TRUE,
                          main="Is your job professionally challenging?")


## Restore original name
##levels(ProfChal$Subtable)[6] <- "Attitude\ntoward\nProfessional\nRecognition"

## End(Not run)

## The ProfChal data is done again with explicit use of ResizeEtc
## in ?HH:::ResizeEtc