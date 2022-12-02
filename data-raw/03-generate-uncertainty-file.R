# Generate uncertainty file
# Prepared by: Lewis A. Jones
# Load libraries ----------------------------------------------------------
library(geosphere)
library(vegan)
# Available models --------------------------------------------------------
mod <- c("MERDITH2021", "MULLER2019", "MULLER2016", "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref", "SETON2012", "GOLONKA", "PALEOMAP")
# Available ages --------------------------------------------------------
ages <- c(1, 2, 3, 4, 6, 9, 13, 15, 18, 22, 25, 31, 36, 39, 44, 52, 58,
          60, 64, 69, 78, 85, 88, 92, 97, 107, 119, 127, 131, 136, 142, 149,
          155, 160, 165, 167, 169, 172, 178, 187, 195, 200, 205, 218, 232, 240,
          245, 249, 252, 253, 257, 262, 267, 271, 278, 287, 292, 296, 301, 305,
          311, 319, 327, 339, 353, 366, 377, 385, 390, 400, 409, 415, 421, 424,
          426, 429, 432, 436, 440, 442, 444, 449, 456, 463, 469, 474, 482, 487,
          492, 496, 499, 502, 507, 512, 518, 525, 535)
# Generate uncertainty file -----------------------------------------------
files <- lapply(mod, function(x) {
  df <- readRDS(paste0("./data-raw/", x, ".RDS"))
  df
})
names(files) <- mod

uncertainty <- lapply(ages, function(j) {
  # Get lng coordinates for each age
  nme <- c(paste0("lng_", j))
  lng <- cbind(files[["MERDITH2021"]][, nme],
        files[["MULLER2019"]][, nme],
        files[["MULLER2016"]][, nme],
        files[["MATTHEWS2016_mantle_ref"]][, nme],
        files[["MATTHEWS2016_pmag_ref"]][, nme],
        files[["SETON2012"]][, nme],
        files[["GOLONKA"]][, nme],
        files[["PALEOMAP"]][, nme])

  # Get lat coordinates for each age
  nme <- c(paste0("lat_", j))
  lat <- cbind(files[["MERDITH2021"]][, nme],
               files[["MULLER2019"]][, nme],
               files[["MULLER2016"]][, nme],
               files[["MATTHEWS2016_mantle_ref"]][, nme],
               files[["MATTHEWS2016_pmag_ref"]][, nme],
               files[["SETON2012"]][, nme],
               files[["GOLONKA"]][, nme],
               files[["PALEOMAP"]][, nme])

  # Calculate palaeolongitudinal range
  uncertainty_p_lng <- vector("numeric")
  for (i in seq_len(nrow(lng))) {
    tmp_lng <- na.omit(as.numeric(lng[i, ]))
    if (length(tmp_lng) <= 1) {
      uncertainty_p_lng[i] <- NA
      next
    }
    mx <- max(as.numeric(tmp_lng))
    mn <- min(as.numeric(tmp_lng))

    range <- abs((mx %% 360) - (mn %% 360))

    if (is.na(range)) {
      uncertainty_p_lng[i] <- range
      next
    }

    if (range >= 180) {
      range <- abs(range - 360)
    } else {
      range <- abs(range)
    }
    uncertainty_p_lng[i] <- range
  }

  # Calculate palaeolatitudinal range
  uncertainty_p_lat <- vector("numeric")
  for (i in seq_len(nrow(lat))) {
    tmp_lat <- na.omit(as.numeric(lat[i, ]))
    if (length(tmp_lat) <= 1) {
      uncertainty_p_lat[i] <- NA
      next
    }
    uncertainty_p_lat[i] <- max(as.numeric(tmp_lat)) -
      min(as.numeric(tmp_lat))
  }

  # Calculate GCD distance between points
  uncertainty_dist <- vector("numeric")
  for (i in seq_len(nrow(lat))) {
    # Get combination of coordinates for all models
    tmpdf <- cbind(p_lng = as.numeric(lng[i, ]),
                   p_lat = as.numeric(lat[i, ]))
    # Exclude NAs
    tmpdf <- na.omit(tmpdf)
    # Allocate NA if only one or less models are available
    if (nrow(tmpdf) <= 1) {
      uncertainty_dist[i] <- NA
      next
    }
    # Calculate GCD matrix using the Haversine method with a radius of
    # 6378.388 km by default
    vals <- fields::rdist.earth(x1 = tmpdf[, c("p_lng", "p_lat")],
                                miles = FALSE)
    # Extract location of points with max GCD
    loc <- which(vals == max(vals), arr.ind = TRUE)
    # Get maximum GCD in km
    uncertainty_dist[i] <- as.numeric(max(vals))
  }

  # Calculate MST between points
  uncertainty_MST <- vector("numeric")
  for (i in seq_len(nrow(lat))) {
    # Get combination of coordinates for all models
    tmpdf <- cbind(p_lng = as.numeric(lng[i, ]),
                   p_lat = as.numeric(lat[i, ]))
    # Exclude NAs
    tmpdf <- na.omit(tmpdf)
    # Allocate NA if only one or less models are available
    if (nrow(tmpdf) <= 1) {
      uncertainty_MST[i] <- NA
      next
    }
    # Calculate distance matrix
    dist_mat <- distm(tmpdf, fun = distGeo)
    # Calculate MST
    mst_dist <- spantree(dist_mat)$dist
    # Sum tree and convert to km
    mst_dist <- sum(mst_dist) / 10^3
    # Get maximum GCD in km
    uncertainty_MST[i] <- mst_dist
  }



  # Bind data
  tmp <- cbind.data.frame(uncertainty_p_lng,
                          uncertainty_p_lat,
                          uncertainty_dist,
                          uncertainty_MST)
  colnames(tmp) <- c(paste0("lng_", j), paste0("lat_", j),
                     paste0("dist_", j), paste0("MST_", j))

  # Return data
  tmp
})
# Bind data
df <- do.call(cbind.data.frame, uncertainty)
# Load reference XY
ref <- readRDS("./data-raw/REF.RDS")
# Bind data
df <- cbind.data.frame(ref, df)
# Save data
saveRDS(df, "./data-raw/prot-uncertainty.RDS", compress = "xz")


