#' Calculate longitudinal and latitudinal range
#'
#' A function to calculate the longitudinal and latitudinal range of
#' geographic coordinates with antimeridian handling.
#'
#' @param lat \code{numeric}. Latitudinal coordinate(s).
#' @param lng \code{numeric}. Longitudinal coordinate(s).
#'
#' @details This function calculates the longitudinal and latitudinal range of
#' input geographic coordinates. While latitudinal range can be calculated in a
#' straight forward manner:
#' `x = max(latitude) - min(latitude)`
#' Longitudinal range requires extra handling as coordinates wrap around the
#' antimeridian. For example, consider the longitudinal range of 170&deg; and
#' -170&deg;. Using the above range calculation, longitudinal range would be
#' determined as 340&deg;, when it is in fact 20&deg;. In this function,
#' longitudinal range is calculated as follows:
#'
#'
#'
#' @return A \code{data.frame} of the original input coordinates and ages,
#' appended with the longitudinal and latitudinal range.
#'
#' @export
#' @examples
#' lng <- c(-50, 10, 170)
#' lat <- c(10, -40, 70)
#' coord_range(lng = lng, lat = lat)
coord_range <- function(lng, lat){
  # Calculate longitudinal range
  range_lng <- vector("numeric")
  # Run across rows
  for (i in seq_len(nrow(lng))) {
    tmp_lng <- na.omit(as.numeric(lng[i, ]))
    if (length(tmp_lng) <= 1) {
      range_lng[i] <- NA
      next
    }

    range_cal <- lng %% 360

    vec1 <- which(range_cal >= 180)
    vec2 <- which(range_cal <= -180)

    range_cal[vec1] <- range_cal[vec1] - 180
    range_cal[vec2] <- range_cal[vec2] + 180

    range_cal <- expand.grid(range_cal, range_cal)
    max(abs(range_cal[, 1] - range_cal[, 2]))



    mx <- max(lng)
    if(mx > 0) {
      mx <- mx %% 360
    }
    mn <- min(lng)
    if(mn > 0) {
      mn <- mn %% 360
    }

    range_cal <- lng %% 360
    max(range_cal) - min(range_cal)
    range_cal <- expand.grid(range_cal, range_cal)
    max(abs(range_cal[, 1] - range_cal[, 2]))

    # Calculate range
    range <- abs((mx %% 360) - (mn %% 360))
    # Return NA
    if (is.na(range)) {
      range_lng[i] <- range
      next
    }
    # date line handling
    if (range >= 180) {
      range <- abs(range - 360)
    } else {
      range <- abs(range)
    }
    range_lng[i] <- range
  }

  # Calculate latitudinal range
  range_lat <- vector("numeric")
  # Run across rows
  for (i in seq_len(nrow(lat))) {
    tmp_lat <- na.omit(as.numeric(lat[i, ]))
    if (length(tmp_lat) <= 1) {
      range_p_lat[i] <- NA
      next
    }
    # Calculate latitudinal range
    range_lat[i] <- max(as.numeric(tmp_lat)) -
      min(as.numeric(tmp_lat))
  }
  # Bind and return
  cbind.data.frame(range_lng, range_lat)
}
