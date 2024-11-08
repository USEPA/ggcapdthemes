
#' @title eGRID discrete color scales
#' @description
#'  Apply discrete color scale to ggplot object using eGRID palettes
#'
#' @param palette name of palette, from `egrid_palettes`. Defaults to "fuel_type".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... Additional parameters passed on to the scale type
#'
#' @export
#'
scale_color_egrid_discrete <- function(palette = "fuel_type", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- egrid_pal(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("color", pal,
                          na.value = NA_col,
                          palette = pal, ...)

}


#' @title eGRID discrete fill scales
#' @description
#'  Apply discrete fill scale to ggplot object using eGRID palettes
#'
#' @inheritParams scale_color_egrid_discrete
#'
#' @export
#'
scale_fill_egrid_discrete <-function(palette = "fuel_type", reverse = FALSE, ...) {

 ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- egrid_pal(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("fill",
                          na.value = NA_col,
                          palette = pal, limits=names(ggcapdthemes::egrid_palettes[[palette]]), ...)

}

#' @title eGRID continuous scales
#' @description
#'  Apply continuous color scale to ggplot object using eGRID palettes
#'
#' @inheritParams scale_color_egrid_discrete
#'
#' @export
#'
scale_color_egrid_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- egrid_pal(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}

#' @title eGRID continuous fill scales
#' @description
#'  Apply continuous fill scale to ggplot object using eGRID palettes
#'
#' @inheritParams scale_color_egrid_discrete
#'
#' @export
#'
scale_fill_egrid_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- egrid_pal(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}
