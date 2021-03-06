% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mqmf_utils.r
\name{getmin}
\alias{getmin}
\title{getmin can be used to define the lower bound for a plot}
\usage{
getmin(x, mult = 1.05)
}
\arguments{
\item{x}{the vector of data to be tested for its minimum}

\item{mult}{the multiplier for both ends, defaults to 1.05 (=0.95 if >0)}
}
\value{
a suitable lower bound for a plot if required
}
\description{
getmin generates a lower bound for a plot where it is unknown
    whether the minumum is less than zero of not. If less than 0 then
    multiplying by the default mult of 1.05 works well but if the outcome if
    > 0 then the multiplier is adjusted appropriately so that the minimum
    is slightly lower than the minimum of the data
}
\examples{
vect <- rnorm(10,mean=0,sd=2)
sort(vect)
getmin(vect)
getmin(vect,mult=1.0)  # finds actual minimum
}
