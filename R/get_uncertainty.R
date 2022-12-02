#' Palaeogeographic uncertainty
#'
#' A function to calculate palaeogeographic uncertainty for geographic
#' coordinates (e.g. fossil occurrences).
#'
#' @param lat \code{numeric}. Latitudinal coordinate(s).
#' @param lng \code{numeric}. Longitudinal coordinate(s).
#' @param age \code{numeric}. Age(s) of reconstruction.
#' @param metric \code{character}. The metric to calculate, choose from:
#' "range", "maxdist", "stdist", and "MST". See details for specifics.
#' @param model \code{character}.The name of the plate rotation model(s) to be
#' used to calculate palaeogeographic uncertainty. Choose from: "all",
#' merdith2021", "paleomap", "muller2019", "muller2016", "matthews2016_mantle",
#' "matthews2016_pmag", "golonka", and "seton2012". See details for additional
#' information.
#'
#' @details
#'
#' @return A \code{data.frame} of the original input coordinates and ages,
#' appended with palaeocoordinates, and uncertainty metrics.
#'
#' @export
#' @examples
get_uncertainty <- function(lat, lng, age, metric, model = "all"){

  # Error-handling ----------------------------------------------------------

  # Set-up ------------------------------------------------------------------
  if (metric == "all") {
    metric <- c("range", "maxdist", "stdist", "MST")
  }

  # Generate matrix of coordinates and ages
  xyz <- cbind.data.frame(lat, lng, age)
  # Generate list of files
  mdl <- list(palaeorotate::merdith2021,
              palaeorotate::muller2019,
              palaeorotate::muller2016,
              palaeorotate::matthews2016_mantle,
              palaeorotate::matthews2016_pmag,
              palaeorotate::paleomap,
              palaeorotate::golonka,
              palaeorotate::seton2012)
  # Add names
  names(mdl) <- c("merdith2021", "muller2019", "muller2016",
                  "matthews2016_mantle", "matthews2016_pmag",
                  "paleomap", "golonka", "seton2012")
  # Which models are desired?
  keep <- which(names(mdl) %in% model)
  # Filter rotations to desired model
  mdl <- mdl[keep]
  # Coordinates -------------------------------------------------------------
  # Generate reference object for linking
  assign("base_model", mdl[[1]])

  # Get available rotation ages
  rot_age <- colnames(base_model)[3:ncol(base_model)]
  rot_age <- unique(as.numeric(sub(".*_", "", rot_age)))

  # Calculate rotation ages for data
  xyz$rot_age <- rot_age[sapply(seq_len(nrow(xyz)), function(i) {
    which.min(abs(xyz[i, c("age")] - rot_age))
  })]

  # Search for matching longitude and  latitude
  xyz$rot_lng <- sapply(seq_len(nrow(xyz)), function(i) {
    # Extract closest longitude
    base_model[which.min(abs(base_model[, c("lng")]  - xyz[i, c("lng")])), 1]
  }, simplify = TRUE)

  xyz$rot_lat <- sapply(seq_len(nrow(xyz)), function(i) {
    # Extract closest latitude
    base_model[which.min(abs(base_model[, c("lat")]  - xyz[i, c("lat")])), 2]
  }, simplify = TRUE)

  # Generate row index
  pc_ind <- sapply(seq_len(nrow(xyz)), function(i) {
    which(base_model[, c("lng")] == xyz[i, "rot_lng"] &
            base_model[, c("lat")] == xyz[i, "rot_lat"])
  })

  # Assign coordinates
  for (m in model) {
    # Get reconstruction file
    tmp <- mdl[[m]]
    # Find matching palaeocoordinates
    tmp <- data.frame(
      t(
        sapply(seq_len(nrow(xyz)), function(i) {
          as.numeric(tmp[pc_ind[i],
                         c(paste0("lng_", xyz$rot_age[i]),
                           paste0("lat_", xyz$rot_age[i]))])
        })))
    # add col names
    colnames(tmp) <- c(paste0("p_lng_", m), paste0("p_lat_", m))
    # Bind coordinates
    xyz <- cbind.data.frame(xyz, tmp)
  }

  # Calculations ------------------------------------------------------------
  # colnames for subsetting
  lng_nme <- paste0("p_lng_", model)
  lat_nme <- paste0("p_lat_", model)
  tmp_lng <- xyz[, lng_nme]
  tmp_lat <- xyz[, lat_nme]

  # Calculate range
  if(c("range") %in% metric) {
    r <- range(lng = tmp_lng, lat = tmp_lat)
    xyz <- cbind.data.frame(xyz, r)
  }

  # Calculate max GCD
  if(c("maxdist") %in% metric) {
    maxdist <- maxdist(lng = tmp_lng, lat = tmp_lat)
    xyz <- cbind.data.frame(xyz, maxdist)
  }

  # Calculate standard distance
  if(c("stdist") %in% metric) {
    stdist <- stdist(lng = tmp_lng, lat = tmp_lat)
    xyz <- cbind.data.frame(xyz, stdist)
  }

  # Calculate MST
  if(c("MST") %in% metric) {
    MST <- MST(lng = tmp_lng, lat = tmp_lat)
    xyz <- cbind.data.frame(xyz, MST)
  }
  # Wrap-up --------------------------------------------------------------
  return(xyz)
}
