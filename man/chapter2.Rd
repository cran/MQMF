% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ch_chunks.R
\name{chapter2}
\alias{chapter2}
\title{chapter2 The 15 R-code chunks from A Non-Introduction to R}
\usage{
chapter2(verbose = TRUE)
}
\arguments{
\item{verbose}{Should instructions to written to the console, default=TRUE}
}
\description{
chapter2 contains no active function but rather acts 
    as a repository for the various example code chunks found in 
    chapter2. There are 15 r-code chunks in chapter2.
}
\examples{
\dontrun{
# All the example code from  # A Non-Introduction to R
### Using Functions

# R-chunk 1  Page 18
#make a function called countones2, don't overwrite original

countones2 <- function(x) return(length(which(x == 1)))  # or
countones3 <- function(x) return(length(x[x == 1]))
vect <- c(1,2,3,1,2,3,1,2,3)  # there are three ones
countones2(vect)  # should both give the answer: 3
countones3(vect)
set.seed(7100809) # if repeatability is desirable.
matdat <- matrix(trunc(runif(40)*10),nrow=5,ncol=8)
matdat #a five by eight matrix of random numbers between 0 - 9
apply(matdat,2,countones3)  # apply countones3 to 8 columns
apply(matdat,1,countones3)  # apply countones3 to 5 rows


# R-chunk 2 Page 19
 #A more complex function prepares to plot a single base graphic
 #It has syntax for opening a window outside of Rstudio and
 #defining a base graphic. It includes oldpar <- par(no.readonly=TRUE)
 #which is returned invisibly so that the original 'par' settings
 #can be recovered using par(oldpar) after completion of your plot.

plotprep2 <- function(plots=c(1,1),width=6, height=3.75,usefont=7,
                      newdev=TRUE) {
  if ((names(dev.cur()) \%in\% c("null device","RStudioGD")) &
      (newdev)) {
    dev.new(width=width,height=height,noRStudioGD = TRUE)
  }
  oldpar <- par(no.readonly=TRUE)  # not in the book's example
  par(mfrow=plots,mai=c(0.45,0.45,0.1,0.05),oma=c(0,0,0,0))
  par(cex=0.75,mgp=c(1.35,0.35,0),font.axis=usefont,font=usefont,
      font.lab=usefont)
  return(invisible(oldpar))
}  #  see ?plotprep; see also parsyn() and parset()


### Random Number Generation
# R-chunk 3 pages 20 - 21
#Examine the use of random seeds.

seed <- getseed()  # you will very likely get different answers
set.seed(seed)
round(rnorm(5),5)
set.seed(123456)
round(rnorm(5),5)
set.seed(seed)
round(rnorm(5),5)

### Plotting in R
# R-chunk 4  page 22
#library(MQMF)   # The development of a simple graph  see Fig. 2.1
# The statements below open the RStudio graphics window, but opening
# a separate graphics window using plotprep is sometimes clearer.

data("LatA")  #LatA = length at age data; try properties(LatA)
# plotprep(width=6.0,height=5.0,newdev=FALSE) #unhash for external plot
oldpar <- par(no.readonly=TRUE)  # not in the book's example
setpalette("R4") #a more balanced, default palette see its help
par(mfrow=c(2,2),mai=c(0.45,0.45,0.1,0.05))  # see ?parsyn
par(cex=0.75, mgp=c(1.35,0.35,0), font.axis=7,font=7,font.lab=7)
hist(LatA$age) #examine effect of different input parameters
hist(LatA$age,breaks=20,col=3,main="") # 3=green #try ?hist
hist(LatA$age,breaks=30,main="",col=4) # 4=blue
hist(LatA$age, breaks=30,col=2, main="", xlim=c(0,43), #2=red
     xlab="Age (years)",ylab="Count")
par(oldpar)  # not in the book's example

### Dealing with Factors
# R-chunk 5  pages 23 - 24
#Dealing with factors/categories can be tricky

DepCat <- as.factor(rep(seq(300,600,50),2)); DepCat
try(5 * DepCat[3], silent=FALSE) #only returns NA and a warning!
as.numeric(DepCat) # returns the levels not the original values
as.numeric(levels(DepCat)) #converts 7 levels not the replicates
DepCat <- as.numeric(levels(DepCat))[DepCat] # try ?facttonum
#converts replicates in DepCat to numbers, not just the levels
5 * DepCat[3]   # now treat DepCat as numeric
DepCat <- as.factor(rep(seq(300,600,50),2)); DepCat
facttonum(DepCat)

## Writing Functions
# R-chunk 6  page 25
#Outline of a function's structure

functionname <- function(argument1, fun,...) {
  # body of the function
  #
  # the input arguments and body of a function can include other
  # functions, which may have their own arguments, which is what
  # the ... is for. One can include other inputs that are used but
  # not defined early on and may depend on what function is brought
  # into the main function. See for example negLL(), and others
  answer <- fun(argument1) + 2
  return(answer)
} # end of functionname
functionname(c(1,2,3,4,5),mean)  # = mean(1,2,3,4,5)= 3 + 2 = 5

### Simple Functions
# R-chunk 7  page 26
# Implement the von Bertalanffy curve in multiple ways

ages <- 1:20
nages <- length(ages)
Linf <- 50;  K <- 0.2;  t0 <- -0.75
# first try a for loop to calculate length for each age
loopLt <- numeric(nages)
for (ag in ages) loopLt[ag] <- Linf * (1 - exp(-K * (ag - t0)))
# the equations are automatically vectorized so more efficient
vecLt <- Linf * (1 - exp(-K * (ages - t0))) # or we can convert
# the equation into a function and use it again and again
vB <- function(pars,inages) { # requires pars=c(Linf,K,t0)
  Lt <- pars[1] * (1 - exp(-pars[2] * (inages - pars[3])))
  return(Lt)
}
funLt <- vB(c(Linf,K,t0),ages)
ans <- cbind(ages,funLt,vecLt,loopLt)


# R-chunk 8  page 26 - code not shown in book.
# Tabulate the ans from chunk 7

library(knitr)  # needed for the function knitr - pretty tables
kable(halftable(ans,yearcol="ages",subdiv=2),digits=c(0,3,3,3,0,3,3,3))


# R-chunk 9  page 27
#A vB function with some input error checking

vB <- function(pars,inages) { # requires pars=c(Linf,K,t0)
  if (is.numeric(pars) & is.numeric(inages)) {
    Lt <- pars[1] * (1 - exp(-pars[2] * (inages - pars[3])))
  } else { stop(cat("Not all input values are numeric! \n")) }
  return(Lt)
}
param <- c(50, 0.2,"-0.75")
funLt <- vB(as.numeric(param),ages) #try without the as.numeric
halftable(cbind(ages,funLt))


### Scoping of Objects
# R-chunk 10   page 29
# demonstration that the globel environment is 'visible' inside a
# a function it calls, but the function's environment remains
# invisible to the global or calling environment

vBscope <- function(pars) { # requires pars=c(Linf,K,t0)
  rhside <- (1 - exp(-pars[2] * (ages - pars[3])))
  Lt <- pars[1] * rhside
  return(Lt)
}
ages <- 1:10; param <- c(50,0.2,-0.75)
vBscope(param)
try(rhside)    # note the use of try() which can trap errors ?try


### Function Inputs and Outputs
# R-chunk 11  page 30
#Bring the data-set schaef into the working of global environment

data(schaef)


# R-chunk 12   page 30  Table 2.2 code not shown
#Tabulate the data held in schaef. Needs knitr

kable(halftable(schaef,yearcol="year",subdiv=2),digits=c(0,0,0,4))

# R-chunk 13  page 30
#examine the properties of the data-set schaef

class(schaef)
a <- schaef[1:5,2]
b <- schaef[1:5,"catch"]
c <- schaef$catch[1:5]
cbind(a,b,c)
mschaef <- as.matrix(schaef)
mschaef[1:5,"catch"]  # ok
d <- try(mschaef$catch[1:5]) #invalid for matrices
d  # had we not used try()eveerything would have stopped.


# R-chunk 14  page 31
#Convert column names of a data.frame or matrix to lowercase

dolittle <- function(indat) {
  indat1 <- as.data.frame(indat)
  colnames(indat) <- tolower(colnames(indat))
  return(list(dfdata=indat1,indat=as.matrix(indat)))
} # return the original and the new version
colnames(schaef) <- toupper(colnames(schaef))
out <- dolittle(schaef)
str(out, width=63, strict.width="cut")


# R-chunk 15  page 32
#Could have used an S3 plot method had we defined a class   Fig.2.2

plotspmdat(schaef) # examine the code as an eg of a custom plot
}
}
