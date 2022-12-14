% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{seton2012}
\alias{seton2012}
\title{Seton reconstruction file}
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
seton2012
}
\description{
Reconstruction files provide pre-generated palaeocoordinates for a
1° x 1° spatial grid which can be used to spatiotemporally link
fossil localities (or other geographic data) with their position in the
geological past. Rotations were generated for the midpoint age of all
Phanerozoic stratigraphic stages (0--540 Ma).
\cr
\cr
This file provides palaeorotations from the PALEOMAP plate rotation model
(Seton et al., 2012).
Palaeocoordinates were generated via the GPlates API service, available at
the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
coverage of 0--200 Ma.
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

Seton, M., Müller, R.D., Zahirovic, S., Gaina, C., Torsvik, T.H.,
Shephard, G., Talsma, A., Gurnis, M., Turner, M., Maus, S., Chandler, M.
(2012). Global continental and ocean basin reconstructions since 200 Ma.
Earth-Science Reviews, Volume 113, Issues 3-4, July 2012, Pages 212--270.
\doi{10.1016/j.earscirev.2012.03.002}.

See GPlates documentation for additional information and details:
\url{https://gwsdoc.gplates.org/reconstruction}.
}

\keyword{datasets}
