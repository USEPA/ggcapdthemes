
#' Define function for retrieving color palettes
#'
#' @param palette name of palette, from `egrid_palettes`. Defaults to "fuel_type".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... additional arguments passed to grDevices::colorRampPalette

#' @return a palette function that takes an integer argument for the number of colors and returns a character vector of hex color codes. If the number is greater than the size of the vector, additional colors are interpolated.
#' @keywords internal
#' @noRd
#'
#'
egrid_pal <- function(palette = "fuel_type",
                      reverse = FALSE,
                      ...) {

  pal <- ggcapdthemes::egrid_palettes[[palette]]

  if (reverse){
    pal <- rev(pal)
  }

  grDevices::colorRampPalette(pal, ...)

}
