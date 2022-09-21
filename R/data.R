#' Golonka reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Golonka plate rotation model
#' (Golonka, 2007; Wright et al., 2013).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--540 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Golonka, J. (2007). Late Triassic and Early Jurassic palaeogeography of the
#' world. Palaeogeography, Palaeoclimatology, Palaeoecology, 244(1-4), 297-307.
#'
#' Wright, N., Zahirovic, S., Müller, R. D., & Seton, M. (2013). Towards
#' community-driven paleogeographic
#' reconstructions: integrating open-access paleogeographic and paleobiology
#' data with plate tectonics.
#' Biogeosciences, 10(3), 1529–1541. \doi{10.5194/bg-10-1529-2013}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"golonka"

#' Matthews mantle reference frame reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Matthews mantle reference frame
#' plate rotation model (Matthews et al., 2016).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--410 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Matthews, K.J., Maloney, K.T., Zahirovic, S., Williams, S.E., Seton, M.,
#' and Müller, R.D. (2016). Global plate boundary evolution and kinematics
#' since the late Paleozoic, Global and Planetary Change, 146, 226-250.
#' \doi{10.1016/j.gloplacha.2016.10.002}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"matthews2016_mantle"

#' Matthews palaeomagnetic reference frame reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Matthews palaeomagnetic reference
#' frame plate rotation model (Matthews et al., 2016).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--410 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Matthews, K.J., Maloney, K.T., Zahirovic, S., Williams, S.E., Seton, M.,
#' and Müller, R.D. (2016). Global plate boundary evolution and kinematics
#' since the late Paleozoic, Global and Planetary Change, 146, 226-250.
#' \doi{10.1016/j.gloplacha.2016.10.002}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"matthews2016_pmag"

#' Merdith reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Merdith plate rotation model
#' (Merdith et al., 2021).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--540 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Merdith, A., Williams, S.E., Collins, A.S., Tetley, M.G., Mulder, J.A.,
#' Blades, M.L., Young, A., Armistead, S.E., Cannon, J., Zahirovic, S.,
#' Müller. R.D. (2021).
#' Extending full-plate tectonic models into deep time: Linking the
#' Neoproterozoic and the Phanerozoic.
#' Earth-Science Reviews 214 (103477). \doi{10.1016/j.earscirev.2020.103477}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"merdith2021"

#' Müller reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Müller plate rotation model
#' (Müller et al., 2016).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--230 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Müller R.D., Seton, M., Zahirovic, S., Williams, S.E., Matthews, K.J.,
#' Wright, N.M., Shephard, G.E., Maloney, K.T., Barnett-Moore, N.,
#' Hosseinpour, M., Bower, D.J., Cannon, J., 2016.
#' Ocean basin evolution and global-scale plate reorganization events since
#' Pangea breakup, Annual Review of Earth and Planetary Sciences, Vol 44,
#' 107-138. \doi{10.1146/annurev-earth-060115-012211}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"muller2016"

#' Müller reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the Müller plate rotation model
#' (Müller et al., 2016).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--1100 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Müller, R. D., Zahirovic, S., Williams, S. E., Cannon, J., Seton, M.,
#' Bower, D. J., Tetley, M. G., Heine, C., Le Breton, E., Liu, S.,
#' Russell, S. H. J., Yang, T., Leonard, J., and Gurnis, M. (2019).
#' A global plate model including lithospheric deformation along major rifts
#' and orogens since the Triassic.
#' Tectonics, vol. 38. \doi{10.1029/2018TC005462}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"muller2019"

#' PALEOMAP reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the PALEOMAP plate rotation model
#' (Scotese & Wright, 2018).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--750 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Scotese, C., & Wright, N. M. (2018). PALEOMAP Paleodigital Elevation Models
#' (PaleoDEMs) for the
#' Phanerozoic. PALEOMAP Project.
#' \url{https://www.earthbyte.org/paleodem-resource-scotese-and-wright-2018/}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"paleomap"

#' Seton reconstruction file
#'
#' Reconstruction files provide pre-generated palaeocoordinates for a
#' 1&deg; x 1&deg; spatial grid which can be used to spatiotemporally link
#' fossil localities (or other geographic data) with their position in the
#' geological past. Rotations were generated for the midpoint age of all
#' Phanerozoic stratigraphic stages (0--540 Ma).
#' \cr
#' \cr
#' This file provides palaeorotations from the PALEOMAP plate rotation model
#' (Seton et al., 2012).
#' Palaeocoordinates were generated via the GPlates API service, available at
#' the following: \url{https://gwsdoc.gplates.org}. This model has a temporal
#' coverage of 0--200 Ma.
#' \cr
#' \cr
#' **NOTE**: two modifications have been made to the data accessed via the API
#' service:
#' (1) data has been rounded to two decimal places to reduce file size, and
#' (2) palaeocoordinates which do not change across the whole time series are
#' assumed to be areas not covered by the models, and are updated to
#' NA accordingly.
#' @section Reference:
#' Seton, M., Müller, R.D., Zahirovic, S., Gaina, C., Torsvik, T.H.,
#' Shephard, G., Talsma, A., Gurnis, M., Turner, M., Maus, S., Chandler, M.
#' (2012). Global continental and ocean basin reconstructions since 200 Ma.
#' Earth-Science Reviews, Volume 113, Issues 3-4, July 2012, Pages 212--270.
#' \doi{10.1016/j.earscirev.2012.03.002}.
#'
#' See GPlates documentation for additional information and details:
#' \url{https://gwsdoc.gplates.org/reconstruction}.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitude of the reference longitude at 1 Ma}
#'   \item{lat_1}{Palaeolatitude of the reference latitude at 1 Ma}
#'   \item{...}{Palaeocoordinates of reference coordinates at
#'   respective age of rotation}
#'   }
"seton2012"

#' Uncertainty reconstruction file
#'
#' This file provides the range in reconstructed palaeocoordinates from all
#' available reconstruction files for each cell in the 1&deg; x 1&deg; spatial grid.
#'
#' @format A data frame with 196 variables:
#' \describe{
#'   \item{lng}{Reference longitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lat}{Reference latitude for the 1&deg; x 1&deg; spatial grid}
#'   \item{lng_1}{Palaeolongitudinal range of the reference longitude at 1 Ma
#'   for all reconstruction files}
#'   \item{lat_1}{Palaeolatitudinal range of the reference longitude at 1 Ma
#'   for all reconstruction files}
#'   \item{...}{Range in palaeocoordinates of reference coordinates at
#'   respective age of rotation for all reconstruction files}
#'   }
"uncertainty"
