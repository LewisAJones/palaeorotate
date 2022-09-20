# Save data
# Prepared by: Lewis A. Jones
# Load libraries ----------------------------------------------------------
library(devtools)
# Available models --------------------------------------------------------
mod <- c("MERDITH2021", "MULLER2019", "MULLER2016", "MATTHEWS2016_mantle_ref",
         "MATTHEWS2016_pmag_ref", "SETON2012", "GOLONKA",
         "PALEOMAP")
# Load and save data ------------------------------------------------------
# Load files
MERDITH2021 <- readRDS("./data-raw/MERDITH2021.RDS")
MULLER2019 <- readRDS("./data-raw/MULLER2019.RDS")
MULLER2016 <- readRDS("./data-raw/MULLER2016.RDS")
MATTHEWS2016_mantle_ref <- readRDS("./data-raw/MATTHEWS2016_mantle_ref.RDS")
MATTHEWS2016_pmag_ref <- readRDS("./data-raw/MATTHEWS2016_pmag_ref.RDS")
SETON2012 <- readRDS("./data-raw/SETON2012.RDS")
GOLONKA <- readRDS("./data-raw/GOLONKA.RDS")
PALEOMAP <- readRDS("./data-raw/PALEOMAP.RDS")
uncertainty <- readRDS("./data-raw/prot-uncertainty.RDS")
# Save data
use_data(MERDITH2021,
         MULLER2019,
         MULLER2016,
         MATTHEWS2016_mantle_ref,
         MATTHEWS2016_pmag_ref,
         SETON2012,
         GOLONKA,
         PALEOMAP,
         uncertainty,
         compress = "xz")
