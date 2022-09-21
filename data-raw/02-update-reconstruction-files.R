# Update reconstruction files
# Prepared by: Lewis A. Jones
# Load data -------------------------------------------------------------
# Seton model returns input coordinates beyond its age range (0 to 200 Ma)
# These are updated to NAs here
SETON2012 <- readRDS("./data-raw/SETON2012.RDS")
# Update ages 205 to 535
SETON2012[, 87:196] <- NA
# Save data
saveRDS(SETON2012, "SETON2012.rds", compress = "xz")

# Muller2016 model returns input coordinates beyond its age range (0 to 230 Ma)
# These are updated to NAs here
MULLER2016 <- readRDS("./data-raw/MULLER2016.RDS")
# Update ages 232 to 535
MULLER2016[, 91:196] <- NA
# Save data
saveRDS(MULLER2016, "MULLER2016.rds", compress = "xz")

# Matthews models returns input coordinates beyond its age range (0 to 410 Ma)
# These are updated to NAs here
MATTHEWS2016_pmag_ref <- readRDS("./data-raw/MATTHEWS2016_pmag_ref.rds")
MATTHEWS2016_mantle_ref <- readRDS("./data-raw/MATTHEWS2016_mantle_ref.rds")
# Update ages 415 to 535
MATTHEWS2016_pmag_ref[, 145:196] <- NA
MATTHEWS2016_mantle_ref[, 145:196] <- NA
# Save data
saveRDS(MATTHEWS2016_mantle_ref, "MATTHEWS2016_mantle_ref.rds", compress = "xz")
saveRDS(MATTHEWS2016_pmag_ref, "MATTHEWS2016_pmag_ref.rds", compress = "xz")
