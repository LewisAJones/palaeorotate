# Calculate range
range <- function(lng, lat){
  # Calculate palaeolongitudinal range
  range_p_lng <- vector("numeric")
  # Run across rows
  for (i in seq_len(nrow(lng))) {
    tmp_lng <- na.omit(as.numeric(lng[i, ]))
    if (length(tmp_lng) <= 1) {
      range_p_lng[i] <- NA
      next
    }
    # Max and minimum range
    mx <- max(as.numeric(tmp_lng))
    mn <- min(as.numeric(tmp_lng))
    # Calculate range
    range <- abs((mx %% 360) - (mn %% 360))
    # Return NA
    if (is.na(range)) {
      range_p_lng[i] <- range
      next
    }
    # date line handling
    if (range >= 180) {
      range <- abs(range - 360)
    } else {
      range <- abs(range)
    }
    range_p_lng[i] <- range
  }

  # Calculate palaeolatitudinal range
  range_p_lat <- vector("numeric")
  # Run across rows
  for (i in seq_len(nrow(lat))) {
    tmp_lat <- na.omit(as.numeric(lat[i, ]))
    if (length(tmp_lat) <= 1) {
      range_p_lat[i] <- NA
      next
    }
    # Calculate latitudinal range
    range_p_lat[i] <- max(as.numeric(tmp_lat)) -
      min(as.numeric(tmp_lat))
  }
  # Bind and return
  cbind.data.frame(range_p_lng, range_p_lat)
}

# Calculate maxdist
maxdist <- function(lng, lat) {
  # Calculate GCD distance between points
  uncertainty_dist <- vector("numeric")
  for (i in seq_len(nrow(lng))) {
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
    # Get maximum GCD in km
    uncertainty_dist[i] <- as.numeric(max(vals))
  }
  uncertainty_dist
}
# Calculate stdist
stdist <- function(lng, lat) {
  uncertainty_stdist <- vector("numeric")
  for (i in seq_len(nrow(lat))) {
    # Get combination of coordinates for all models
    tmpdf <- cbind(p_lng = as.numeric(lng[i, ]),
                   p_lat = as.numeric(lat[i, ]))
    # Get centroid
    centroid <- colMeans(tmpdf)
    # Calculate distance matrix
    dist <- geosphere::distm(x = tmpdf, y = centroid, fun = distGeo)
    # append to vector
    uncertainty_stdist[i] <- mean(as.numeric(dist))
  }
  uncertainty_stdist
}

# Calculate MST
MST <- function(lng, lat) {
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
    dist_mat <- geosphere::distm(tmpdf, fun = distGeo)
    # Calculate MST
    mst_dist <- vegan::spantree(dist_mat)$dist
    # Sum tree and convert to km
    mst_dist <- sum(mst_dist) / 10^3
    # Get maximum GCD in km
    uncertainty_MST[i] <- mst_dist
  }
  uncertainty_MST
}
