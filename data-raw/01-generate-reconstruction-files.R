# Generate reconstruction files
# Prepared by: Lewis A. Jones
# Load libraries ----------------------------------------------------------
library(pbmcapply)
library(httr)
library(h3jsr)
library(sf)
# Update working directory if using CESGA
setwd("/mnt/netapp2/Store_uni/home/uvi/ba/ljo/rotations/")
# Available models --------------------------------------------------------
mod <- c("MULLER2022",
         "MERDITH2021",
         "MULLER2019",
         "MULLER2016",
         "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref",
         "SETON2012",
         "GOLONKA",
         "PALEOMAP")

age_range <- list(MULLER2022 = 1000,
                  MERDITH2021 = 1000,
                  MULLER2019 = 250,
                  MULLER2016 = 230,
                  MATTHEWS2016_mantle_ref = 410,
                  MATTHEWS2016_pmag_ref = 410,
                  SETON2012 = 200,
                  GOLONKA = 550,
                  PALEOMAP = 1100)
# Generate grid -----------------------------------------------------------
# Generate a ~100 km grid using the h3jsr package
# Get cells from resolution at 0
cells <- h3jsr::get_res0()
# Get child cells at resolution ~100 km
cells <- get_children(h3_address = cells, res = 3)
# Unlist cell list
cells <- unlist(cells)
# Get centroids of cells
pts <- cell_to_point(cells, simple = FALSE)
# Extract coordinates
pts <- sf::st_coordinates(pts)
# Update column names
colnames(pts) <- c("lng", "lat")
# Round coordinates
pts <- round(pts, digits = 2)
# Save data
saveRDS(object = pts,
        file = "./REF.RDS",
        compress = "xz")# Generate rotation files
# Indexing ----------------------------------------------------------------
# How many rows?
nr <- nrow(pts)
# Size of chunks to be rotated
chunks <- nr / 300
# Generate chunk bins
chunks <- 300 * 1:chunks
# Add starting and ending value
chunks <- c(0, chunks, nr)
# Generate rotation files -------------------------------------------------
for (m in 1:length(mod)) {
  model <- mod[m]
  dir.create(path = paste0("./", model))

  # Ages to reconstruct ---------------------------------------------------
  ages <- c(1, 2, 3, 4, 6, 9, 13, 15, 18, 22, 25, 31, 36, 39, 44, 52, 58,
            60, 64, 69, 78, 85, 88, 92, 97, 107, 119, 127, 131, 136, 142, 149,
            155, 160, 165, 167, 169, 172, 178, 187, 195, 200, 205, 218, 232, 240,
            245, 249, 252, 253, 257, 262, 267, 271, 278, 287, 292, 296, 301, 305,
            311, 319, 327, 339, 353, 366, 377, 385, 390, 400, 409, 415, 421, 424,
            426, 429, 432, 436, 440, 442, 444, 449, 456, 463, 469, 474, 482, 487,
            492, 496, 499, 502, 507, 512, 518, 525, 535)
  # Subset ages for model coverage
  ages <- ages[which(ages <= age_range[model])]
  # Reconstruct coordinates
  pbmcapply::pbmclapply(ages, function(i) {
    rot_age <- i
    df <- lapply(2:length(chunks), function(x) {
      # Lower index
      ind_l <- chunks[x-1] + 1
      # Upper index
      ind_u <- chunks[x]
      # Make API
      tmp <- pts[ind_l:ind_u,]
      tmp <- toString(as.vector(t(tmp)))
      API <- sprintf('?points=%s&time=%f&model=%s', gsub(" ", "", tmp), rot_age, model)
      API <- paste0("https://gws.gplates.org/reconstruct/reconstruct_points/",
                    API, "&return_null_points")
      pxy <- httr::RETRY(verb = "GET",
                         url = API,
                         times = 10,
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
    df <- df[order(df$cell),]
    # Extract palaeocoordinates
    df <- df[, c("lng", "lat")]
    # Add age to col names
    colnames(df) <- c(paste0("lng_", rot_age), paste0("lat_", rot_age))
    # Save data
    saveRDS(object = df,
            file = paste0("./", model, "/rot_", rot_age, ".RDS"),
            compress = "xz")
  }, mc.cores = detectCores(), mc.cleanup = TRUE)
}
