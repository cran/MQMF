% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fisheries.r
\name{domed}
\alias{domed}
\title{domed calculates domed selectivity curves}
\usage{
domed(p, L)
}
\arguments{
\item{p}{a vector of six parameters.}

\item{L}{a vector of the mean of nL age/size classes}
}
\value{
a vector of selectivities
}
\description{
domed uses 6 parameters and a set of mean size or age
    classes to calculate a domed selectivity curve with a maximum 
    of 1.0 (rescaling can be done outside the function), but has 
    parameters for the selectivity of the initial and final 
    size/age classes. There is an ascending limb and a descending 
    limb with the potential of a plateau in between. The six 
    parameters are 1) the age/size where selectivity first becomes 
    1.0, 2) the size/age where selectivity first begins to decline, 
    3) the steepness of the ascending limb, 4) the steepness of the
    descending limb, 5) the selectivity of the first age/size
    class, and 6) the selectivity of the last age/size class.
}
\examples{
  L <- seq(1,30,1)
  p <- c(10,11,16,33,-5,-2)
  sel <- domed(p,L)
  plot1(L,sel,xlab="Age",ylab="Selectivity",lwd=2)
}
\references{
Methot, R.D. and C.R, Wetzel (2013) Stock synthesis: A biological 
    and statistical framework for fish stock assessment and fishery management. 
    Supplementary material, Appendix A. Equs A1.30 onwards. 
    \emph{Fisheries Research} 142:86-99.
}
