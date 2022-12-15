# The three different Umea University color palettes.
umu_palettes <- list(
    "original" = c("blue"  = "#2A4765",
                   "pink"  = "#EABAB9",
                   "green" = "#73A790",
                   "beige" = "#D7B17C",
                   "black" = "#000000",
                   "cream" = "#F1EFE4"),
    "light"    = c("blue"  = "#65718B",
                   "pink"  = "#F1D0CF",
                   "green" = "#A3C2B1",
                   "beige" = "#E3C8A4",
                   "black" = "#000000",
                   "cream" = "#F1EFE4"),
    "dark"     = c(
                   "blue"  = "#253B52",
                   "pink"  = "#AE898B",
                   "green" = "#577F72",
                   "beige" = "#9E8264",
                   "black" = "#000000",
                   "cream" = "#F1EFE4"))

#' A UmU palette generator
#'
#' Three color palettes from the Umea University color profile. Link: https://www.aurora.umu.se/en/service-and-support/advice-and-guidelines/communication/visual-identity/
#' Based on the enjoyable wesanderson package.
#'
#' @param name Name of desired palette. Choices are: \code{original},
#'   \code{light},  \code{dark}. Default value is \code{original}.
#' @param n Number of colors desired. All palettes contain four colors. If
#'   omitted, uses all colours. If \code{type} is continuous \code{n} specifies
#'   the number of discrete colors to output. See \code{type}. Default value is
#'   4 (all colors except background colors, see \code{background}.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @param background Specifies if black and cream are included in the output.
#'   Default value is \code{FALSE}.
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' umu_palette("original")
#' umu_palette("light")
#' umu_palette("dark")
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- umu_palette(21, name = "original", type = "continuous")
#' image(volcano, col = pal)
umu_palette <- function(name = "original", n = 4, type = c("discrete", "continuous"), background = FALSE) {
  type <- match.arg(type)

  if (background)
    pal <- umu_palettes[[name]]
  else
    pal <- umu_palettes[[name]][1:4]

  if (is.null(pal))
    stop(paste("Palette not found ", name, " not found."))

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
