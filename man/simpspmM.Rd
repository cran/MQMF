% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spm.r
\name{simpspmM}
\alias{simpspmM}
\title{simpspmM calculates predicted CE when multiple indices are present}
\usage{
simpspmM(
  pars,
  indat,
  schaefer = TRUE,
  year = "year",
  cats = "catch",
  index = "cpue"
)
}
\arguments{
\item{pars}{the parameters of the SPM = r, K, Binit if fishery is 
depleted to start with (omit otherwise), and a sigma for each 
cpue series. Each parameter is in log space and is 
back-transformed inside simpspmM.}

\item{indat}{the data which needs to include year, catch, and cpue. 
The latter should have a separate column for each fleet, with 
a column name beginning with cpue or whatever name you put in 
index (see below) for example cpue1, cpue2, etc.}

\item{schaefer}{a logical value determining whether the spm is to 
be a simple Schaefer model (p=1) or approximately a Fox model 
(p=1e-08). The default is TRUE}

\item{year}{column name within indat containing the years, default='year'}

\item{cats}{column name within indat containing the catches, default='catch'}

\item{index}{the prefix in the column names given to the indices of 
relative abundance used, perhaps 'cpue' as in cpueTW, cpueAL, 
etc. grep is used to search for columns containing this prefix 
to identify whether there are more than one column of cpue data. Be sure 
to only use the prefix for indices of relative abundance.}
}
\value{
a vector or matrix of nyrs of the predicted CPUE
}
\description{
simpspmM calculates the predicted CPUE for an surplus
    production model and is designed for when there are more than 
    one time-series of an index of relative abundance. The parameter
    vector includes the standard deviations for the log-normal
    distributions assumed for the indices of relative abundance. 
    They are not used in this function but will be when the 
    likelihoods are calculated as a next step in fitting the model.
}
\examples{
 data(twoindex)
 fish <- as.matrix(twoindex)
 pars <- log(c(0.04,155000,0.4,0.3))
 bestSP <- nlm(f=negLLM,p=pars,funk=simpspmM,indat=fish,
             schaefer=TRUE,logobs=log(fish[,c("cpue1","cpue2")]),
             steptol=1e-06,harvpen=TRUE)
 outfit(bestSP)  # best fitting estimates
 simpspmM(bestSP$estimate,fish) # the two log(predicted cpue)
}
