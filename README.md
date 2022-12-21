# umupalette
R package proividing palettes generated from Umea University's three different color palettes. See https://www.aurora.umu.se/en/service-and-support/advice-and-guidelines/communication/visual-identity/.

Code inspired by the very nice [wesanderson](https://rdrr.io/cran/wesanderson/) package ([GitHub](https://github.com/karthik/wesanderson)).

## Installation GitHub
To install the package from GitHub make sure you have `devtools` installed, otherwise run
```R
install.packages("devtools")
```
Then run
```R
library(devtools)
install_github("https://github.com/fileds/umupalette-R")
```

## Usage
To use the color palettes run
```R
library(umupalette)
# Original palette
pal <- umu_palette()

# Light palette
pal <- umu_palette(name = "light")

# Light palette
pal <- umu_palette(name = "dark")
```
`pal` is now a vector of four colors from the palette. See package documentation for more information.

## Palettes
These are the available palettes
### Original
![alt text](https://github.com/fileds/umupalette-R/blob/main/figures/umu-original.png)
`umu_palette("original")`

### Light
![alt text](https://github.com/fileds/umupalette-R/blob/main/figures/umu-light.png)
`umu_palette("light")`

### Dark
![alt text](https://github.com/fileds/umupalette-R/blob/main/figures/umu-dark.png)
`umu_palette("dark")`
