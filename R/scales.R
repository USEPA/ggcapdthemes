
#' @title CAPD discrete color scales
#' @description
#'  Apply discrete color scale to ggplot object using CAPD palettes
#'
#' @param palette name of palette, from `capd_palettes`. Defaults to "fuel_type".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... Additional parameters passed on to the scale type
#'
#' @export
#'
scale_color_capd_discrete <- function(palette = "fuel_type", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("color", pal,
                          na.value = NA_col,
                          palette = pal, ...)

}


#' @title CAPD discrete fill scales
#' @description
#'  Apply discrete fill scale to ggplot object using CAPD palettes
#'
#' @inheritParams scale_color_capd_discrete
#'
#' @export
#'
scale_fill_capd_discrete <-function(palette = "fuel_type", reverse = FALSE, ...) {

 ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("fill",
                          na.value = NA_col,
                          palette = pal, limits=names(ggcapdthemes::capd_palettes[[palette]]), ...)

}

#' @title CAPD continuous scales
#' @description
#'  Apply continuous color scale to ggplot object using CAPD palettes
#'
#' @inheritParams scale_color_capd_discrete
#'
#' @export
#'
scale_color_capd_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}

#' @title CAPD continuous fill scales
#' @description
#'  Apply continuous fill scale to ggplot object using CAPD palettes
#'
#' @inheritParams scale_color_capd_discrete
#'
#' @export
#'
scale_fill_capd_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}
