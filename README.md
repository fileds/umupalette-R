# umupalette
R package proividing palettes generated from Umea University's three different color palettes. See https://www.aurora.umu.se/en/service-and-support/advice-and-guidelines/communication/visual-identity/ .

## Installation GitHub
To install the package from GitHub make sure you have `devtools` installed, otherwise run
```R
install.packages("devtools")
```
Then run
```R
install_github("umupalette-R", username="fileds")
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
