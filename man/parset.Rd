% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotfuns.R
\name{parset}
\alias{parset}
\title{parset alters the current base graphics par settings}
\usage{
parset(
  plots = c(1, 1),
  cex = 0.75,
  font = 7,
  outmargin = c(0, 0, 0, 0),
  margin = c(0.45, 0.45, 0.05, 0.05)
)
}
\arguments{
\item{plots}{vector of number of rows and columns, defaults to c(1,1)}

\item{cex}{the size of the font used, defaults to 0.75}

\item{font}{the font used, defaults to 7 which is Times Bold, 6 is
Times, 1 is Sans and 2 is Sans Bold.}

\item{outmargin}{defines whether to leave extra space on the bottom, 
left, top, or right hand sides of the plot. Used when plots 
!= c(1,1). Allows room for mtext statements.}

\item{margin}{defines the space allowed for labels on axes. Again,
likely needs to change is having more than one plot}
}
\value{
nothing but it changes the base graphics par settings. The 
    original par values are returned invisibly if user wishes to reset
    after plotting their graphic.
}
\description{
parset alters the current base graphics par settings
    to suit a single standard plot. It is merely here to simplify
    and speed the coding for exploratory base graphics. The font
    and its font size defaults to 0.75 and font 7 (Times bold). The
    default values can be seen by typing parset with no brackets in
    the console or use args(parset). If a different set of par values
    are wanted then the parset arguments can be modified, or the function 
    parsyn() can be used to act as a prompt to the console for the correct 
    syntax. The console output can be copied to your script and modified.
}
\examples{
 x <- rnorm(100,mean=5,sd=0.5)
 y <- rnorm(100,mean=5,sd=0.5)
 oldpar <- parset(plots=c(1,2))
 plot1(x,y,defpar=FALSE)
 plot1(y,x,defpar=FALSE)
 par(oldpar)
}
