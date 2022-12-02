# Prepare reconstruction files
# Prepared by: Lewis A. Jones
# Available models --------------------------------------------------------
mod <- c("MERDITH2021", "MULLER2019", "MULLER2016", "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref", "SETON2012", "GOLONKA", "PALEOMAP")

# Rotation ages -----------------------------------------------------------
ages <- c(1, 2, 3, 4, 6, 9, 13, 15, 18, 22, 25, 31, 36, 39, 44, 52, 58,
          60, 64, 69, 78, 85, 88, 92, 97, 107, 119, 127, 131, 136, 142, 149,
          155, 160, 165, 167, 169, 172, 178, 187, 195, 200, 205, 218, 232, 240,
          245, 249, 252, 253, 257, 262, 267, 271, 278, 287, 292, 296, 301, 305,
          311, 319, 327, 339, 353, 366, 377, 385, 390, 400, 409, 415, 421, 424,
          426, 429, 432, 436, 440, 442, 444, 449, 456, 463, 469, 474, 482, 487,
          492, 496, 499, 502, 507, 512, 518, 525, 535)

# Reference dataframe -----------------------------------------------------
# Load reference coordinates
ref <- readRDS(file = "./data-raw/REF.RDS")
# Generate column names
lngs <- paste0("lng_", ages)
lats <- paste0("lat_", ages)
# Create empty dataframe
df <- data.frame(matrix(ncol = length(ages) * 2, nrow = nrow(ref)))
colnames(df)[seq(from = 1, to = ncol(df), by = 2)] <- lngs
colnames(df)[seq(from = 2, to = ncol(df), by = 2)] <- lats
ref <- cbind(ref, df)

# Load data ---------------------------------------------------------------
for (i in mod) {
  # Temp reference dataframe
  tmp <- ref
  # Get file names
  files <- list.files(paste0("./data-raw/", i, "/"), full.names = TRUE)
  # Bind dataframe
  df <- do.call(cbind, lapply(files, readRDS))
  # Populate reference dataframe
  for (j in colnames(df)) {
    tmp[, which(colnames(tmp) == j)] <- df[, j]
  }
  # Round off data
  tmp <- round(tmp, digits = 2)
  # Save data
  saveRDS(object = tmp, file = paste0("./data-raw/", i, ".RDS"), compress = "xz")
}
