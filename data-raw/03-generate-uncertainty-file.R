# Generate uncertainty file
# Prepared by: Lewis A. Jones
# Available models --------------------------------------------------------
mod <- c("MERDITH2021", "MULLER2019", "MULLER2016", "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref", "SETON2012", "GOLONKA",
         "PALEOMAP")
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
    mx <- max(lng[i, ], na.rm = TRUE)
    mn <- min(lng[i, ], na.rm = TRUE)

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
    uncertainty_p_lat[i] <- max(lat[i, ], na.rm = TRUE) -
      min(lat[i, ], na.rm = TRUE)
  }

  # Update values
  uncertainty_p_lng[which(is.nan(uncertainty_p_lng))] <- NA
  uncertainty_p_lat[which(is.nan(uncertainty_p_lat))] <- NA
  uncertainty_p_lng[which(is.infinite(uncertainty_p_lng))] <- NA
  uncertainty_p_lat[which(is.infinite(uncertainty_p_lat))] <- NA

  # Bind data
  tmp <- cbind.data.frame(uncertainty_p_lng, uncertainty_p_lat)
  colnames(tmp) <- c(paste0("lng_", j), paste0("lat_", j))

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


