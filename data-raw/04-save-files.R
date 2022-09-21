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
merdith2021 <- readRDS("./data-raw/MERDITH2021.RDS")
muller2019 <- readRDS("./data-raw/MULLER2019.RDS")
muller2016 <- readRDS("./data-raw/MULLER2016.RDS")
matthews2016_mantle <- readRDS("./data-raw/MATTHEWS2016_mantle_ref.RDS")
matthews2016_pmag <- readRDS("./data-raw/MATTHEWS2016_pmag_ref.RDS")
seton2012 <- readRDS("./data-raw/SETON2012.RDS")
golonka <- readRDS("./data-raw/GOLONKA.RDS")
paleomap <- readRDS("./data-raw/PALEOMAP.RDS")
uncertainty <- readRDS("./data-raw/prot-uncertainty.RDS")
# Save data
use_data(merdith2021,
         muller2019,
         muller2016,
         matthews2016_mantle,
         matthews2016_pmag,
         seton2012,
         golonka,
         paleomap,
         uncertainty,
         compress = "xz")
