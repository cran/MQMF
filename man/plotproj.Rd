% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spm.r
\name{plotproj}
\alias{plotproj}
\title{plotproj generate a plot of a matrix of biomass projections}
\usage{
plotproj(projs, spmout, qprob = c(0.1, 0.5, 0.9), refpts = NULL, fnt = 7)
}
\arguments{
\item{projs}{the N x yrs matrix of biomass trajectories}

\item{spmout}{the object output from the function spm}

\item{qprob}{the quantiles to include in the plot, default=c(0.1,0.5,0.9)}

\item{refpts}{the proportion of Bzero=K acting as limit and target
reference points ( a vector of two)}

\item{fnt}{the font to use in the figure, default = 7 = bold Times}
}
\value{
This plots a graph and returns, invisibly, the requested 
    quantiles and the proportion less than the limit reference point.
}
\description{
plotproj generate a plot of a matrix of N biomass projections
    and includes the option of including reference points relative to 
    Bzero = K. Quantiles are included in the plot
}
\examples{
  data(abdat)
  schf <- FALSE
  param <- log(c(r=0.3,K=11500,Binit=3300,sigma=0.05))
  bestmod <- nlm(f=negLL1,p=param,funk=simpspm,logobs=log(abdat$cpue),
                 indat=abdat,typsize=magnitude(param),iterlim=1000,
                 schaefer=schf,hessian = TRUE)
  out <- spm(bestmod$estimate,indat=abdat,schaefer=schf)
  matpar <- parasympt(bestmod,50) # use at least 1000 in reality
  projs <- spmproj(matpar,abdat,projyr=10,constC=900)
  plotproj(projs,out,qprob=c(0.1,0.5),refpts=c(0.2,0.4))
}
