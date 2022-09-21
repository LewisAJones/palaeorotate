# palaeorotate

This R package contains reconstruction files for a 1&deg; x 1&deg; spatial grid rotated to the midpoint age of all Phanerozoic stratigraphic stages (0--540 Ma). Palaeocoordinates were generated via the [GPlates API service](https://gwsdoc.gplates.org), and include the following models:

- MERDITH2021
- MULLER2019
- MULLER2016
- MATTHEWS2016_mantle_ref
- MATTHEWS2016_pmag_ref
- SETON2012
- GOLONKA
- PALEOMAP

The package also contains an uncertainty file for the 1&deg; x 1&deg; spatial grid which provides the palaeolongitudinal and palaeolatitudinal range from all reconstruction files for each cell and timestep.

## Installation

Due to file size limitations, palaeorotate is not available on CRAN. However, the development version can be installed via GitHub:

```R
# Install the development version from GitHub
devtools::install_github("LewisAJones/palaeorotate")
```

## Code of Conduct

Please note that the palaeorotate package is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
