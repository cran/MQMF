% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.r
\docType{data}
\name{dataspm}
\alias{dataspm}
\title{dataspm A data.frame of fisheries catch and cpue data}
\format{
A 31 x 5 data.frame
\describe{
  \item{year}{the year from 1986 t0 2016}
  \item{catch}{the catch in tonnes to the nearest 100kg}
  \item{cpue}{the standardized cpue scaled to the mean of the series}
  \item{records}{the number of records making up the yearly totals}
  \item{geom}{the naive geometric mean cpue of the raw data as kg/hr, also 
              rescaled to the mean of the series}
}
}
\source{
Haddon, M. and M. Sporcic (2017) Catch rate standardizations for 
    selected SESSF Species (data to 2016) pp 43-406 in Tuck, G.N. 
    (\emph{ed}) \emph{Stock Assessment for the Southern and Eastern scalefish 
    and shark fishery 2016 and 2017.} 837 pp. ISBN 978-1-4863-1012-8 data 
    extracted from Table 7.96 PinkLing4050 page 216.
}
\description{
A data.frame containing 31 years of catch, standardized
    cpue, number of records, and the unstandardized geometric mean
    cpue for Pink Ling (\emph{Genypterus blacodes}). The fisheries data can 
    be used in the surplus production modelling in Chapter 7. Initial 
    parameter estimates very close to the optimum values could be 
    param <- log(c(r=0.25, K=5500, Binit=3000,sigma=0.2)) for the Schaefer 
    model and log(c(r=0.15, K=6500, Binit=3000, sigma=0.2)) for the Fox model
}
\section{Subjects}{

 \itemize{
  \item Fishery data-set
  \item Surplus Production Modelling
  \item Log-Normal likelihoods
 }
}

\examples{
 data(dataspm)
 oldpar <- par(no.readonly=TRUE)
 plot(dataspm$year,dataspm$geom,type="l",lwd=2,xlab="Year",
 ylab="CPUE",panel.first=grid())
 lines(dataspm$year,dataspm$cpue*mean(dataspm$geom),lwd=2,col=2)
 legend("topright",c("cpue","geom"), col=c(1,2), lwd=3, bty="n",
 cex=1.2)
 par(oldpar)
}
