# Generate reconstruction files
# Prepared by: Lewis A. Jones
# Load libraries ----------------------------------------------------------
library(raster)
library(pbmcapply)
library(httr)
# Available models --------------------------------------------------------
mod <- c("MERDITH2021", "MULLER2019", "MULLER2016", "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref", "SETON2012", "GOLONKA",
         "PALEOMAP")
# Generate grid -----------------------------------------------------------
# Grid of 1 x 1 deg
r <- raster(res = 1)
xy <- as.data.frame(r, xy = TRUE)[, c("x", "y")]
occdf <- xy
colnames(occdf) <- c("lng", "lat")
saveRDS(object = occdf,
        file = "./REF.RDS",
        compress = "xz")
# Indexing ----------------------------------------------------------------
# How many rows?
nr <- nrow(occdf)
# Size of chunks to be rotated
chunks <- nr / 300
# Generate chunk bins
chunks <- 300 * 1:chunks
# Add starting value
chunks <- append(0, chunks)
# Ages to reconstruct -----------------------------------------------------
ages <- c(1, 2, 3, 4, 6, 9, 13, 15, 18, 22, 25, 31, 36, 39, 44, 52, 58,
          60, 64, 69, 78, 85, 88, 92, 97, 107, 119, 127, 131, 136, 142, 149,
          155, 160, 165, 167, 169, 172, 178, 187, 195, 200, 205, 218, 232, 240,
          245, 249, 252, 253, 257, 262, 267, 271, 278, 287, 292, 296, 301, 305,
          311, 319, 327, 339, 353, 366, 377, 385, 390, 400, 409, 415, 421, 424,
          426, 429, 432, 436, 440, 442, 444, 449, 456, 463, 469, 474, 482, 487,
          492, 496, 499, 502, 507, 512, 518, 525, 535)

# Generate rotation files -------------------------------------------------
for (m in mod) {
  model <- m
  rots <- pbmcapply::pbmclapply(ages, function(i) {
    rot_age <- i
    df <- lapply(2:length(chunks), function(x) {
      # Lower index
      ind_l <- chunks[x-1] + 1
      # Upper index
      ind_u <- chunks[x]
      # Make API
      tmp <- occdf[ind_l:ind_u,]
      tmp <- toString(as.vector(t(tmp)))
      API <- sprintf('?points=%s&time=%f&model=%s', gsub(" ", "", tmp), rot_age, model)
      API <- paste0("https://gws.gplates.org/reconstruct/reconstruct_points/",
                    API, "&return_null_points")
      pxy <- httr::RETRY("GET", API, times = 10,
                         pause_min = 5,
                         pause_base = 2,
                         pause_cap = 30)
      pxy <- content(pxy, "parsed")$coordinates
      rpl <- which(pxy == "NULL")
      if (length(rpl) != 0) {
        for(r in rpl) {pxy[[r]] <- list(NA, NA)}
      }
      pxy <- do.call(rbind.data.frame, pxy)
      colnames(pxy) <- c("lng", "lat")
      pxy$cell <- ind_l:ind_u
      pxy
    })
    # Bind data
    df <- do.call(rbind, df)
    # Order by cell number
    df[order(df$cell),]
    # Extract palaeocoordinates
    df <- df[, c("lng", "lat")]
    # Add age to col names
    colnames(df) <- c(paste0("lng_", rot_age), paste0("lat_", rot_age))
    # Save data
    saveRDS(object = df,
            file = paste0("./data/", model, "/rot_", rot_age, ".RDS"),
            compress = "xz")
    # Print df
    df
  }, mc.cores = detectCores()-1, mc.cleanup = TRUE)
}

#Format data -------------------------------------------------------------
for (m in mod) {
  # Load reference XY
  df <- readRDS("./data/REF.RDS")
  # Load rotations and bind to reference
  for (i in ages) {
    coords <- readRDS(paste0(
      "./data/", m, "/rot_", i, ".RDS"))
    df <- cbind.data.frame(df, coords)
  }
  # Round coordinates to two decimal places
  df <- round(df, digits = 2)
  # Remove row names
  row.names(df) <- NULL
  # Set points not rotated to NA
  for (i in 1:nrow(df)) {
    if (length(unique(as.numeric(df[i, ]))) == 2){
      df[i, 3:ncol(df)] <- NA
    }
  }
  # Save data
  saveRDS(df, paste0("./data/", m,".RDS"), compress = "xz")
}

