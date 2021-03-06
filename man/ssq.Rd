% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fisheries.r
\name{ssq}
\alias{ssq}
\title{ssq a generalized function for summing squared residuals}
\usage{
ssq(funk, observed, ...)
}
\arguments{
\item{funk}{a function that uses a parameter vector and vector of
observations to calculate predicted values, which are compared
with the observed values to give the ssq and be returned}

\item{observed}{a vector containing the observed data (y-axis)}

\item{...}{required to allow funk to access its parameters and data 
without having to explicitly declare them in ssq. Note that
this means inside the ssq function the call to funk also needs
to have the ellipsis, otherwise it will not be able to see those
other arguments. It is vital to spell the names of funk's
arguments correctly as errors are not always announced and 
will obviously lead to misleading outputs.}
}
\value{
a single number (scaler) that is the sum of squared
    residuals between the dep values and those calculated by funk
}
\description{
ssq is a generalized function for summing squared
    residuals which is designed for ease of use in nlm (or
    optim, or nlminb). NAs are removed automatically. It assumes the 
    input of a predefined function 'funk' that will calculate 
    predicted values of a 'dependent' variable from a vector of 
    'independent' or observed values, for which one has observations. 
    The dependent or predicted values are compared with the observed 
    or 'independent' data, and the resulting SSQ returned. The use 
    of ... means this is a very general function but it does mean you 
    need to be very careful with placement and spelling of the input 
    variables required by whatever funk you are using. It is
    always best to explicitly name the arguments although the correct
    order will also work correctly.
}
\examples{
  data(minnow)  # remember -13 is only 3+ months
  pars <- c(89, 0.1,-13)  # ssq = 83477.84
  ssq(funk=vB,observed=minnow$length,p=pars,ages=minnow$week)
}
