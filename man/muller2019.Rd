% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{muller2019}
\alias{muller2019}
\title{Müller reconstruction file}
\format{
A data frame with 196 variables:
\describe{
\item{lng}{Reference longitude for the 1° x 1° spatial grid}
\item{lat}{Reference latitude for the 1° x 1° spatial grid}
\item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
\item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
...
}
}
\usage{
muller2019
}
\description{
Reconstruction files provide pre-generated palaeocoordinates for a
1° x 1° spatial grid which can be used to spatiotemporally link
fossil localities (or other geographic data) with their position in the
geological past. Rotations were generated for the midpoint age of all
Phanerozoic stratigraphic stages (0--540 Ma).
\cr
\cr
This file provides palaeorotations from the Müller plate rotation model
(Müller et al., 2016).
Palaeocoordinates were generated via the GPlates API service, available at
the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
coverage of 0--1100 Ma.
\cr
\cr
\strong{NOTE}: three modifications have been made to the data accessed via the API
service:
(1) data has been rounded to two decimal places to reduce file size,
(2) palaeocoordinates which do not change across the whole time series are
assumed to be areas not covered by the models, and are updated to
NA accordingly, and (3) all returned palaeocoordinates beyond the temporal
range of the respective model are set to NA.
}
\section{Reference}{

Müller, R. D., Zahirovic, S., Williams, S. E., Cannon, J., Seton, M.,
Bower, D. J., Tetley, M. G., Heine, C., Le Breton, E., Liu, S.,
Russell, S. H. J., Yang, T., Leonard, J., and Gurnis, M. (2019).
A global plate model including lithospheric deformation along major rifts
and orogens since the Triassic.
Tectonics, vol. 38. \doi{10.1029/2018TC005462}.

See GPlates documentation for additional information and details:
\url{https://gwsdoc.gplates.org/reconstruction}.
}

\keyword{datasets}
