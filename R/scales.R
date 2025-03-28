
globalVariables(c("capd_palettes"))

#' @title CAPD discrete color scales
#' @description
#'  Apply discrete color scale to ggplot object using CAPD palettes
#'
#' @param palette name of palette, from `capd_palettes`. Defaults to "unordered".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... Additional parameters passed on to the scale type
#'
#' @export
#'
scale_color_capd_discrete <- function(palette = "unordered", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = ''

  pal <- capd_pal_d(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("color",
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
scale_fill_capd_discrete <-function(palette = "unordered", reverse = FALSE, ...) {

 ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal_d(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("fill",
                          na.value = NA_col,
                          palette = pal, limits=names(ggcapdthemes::capd_palettes[[palette]]), ...)

}

#' @title CAPD continuous scales
#' @description
#'  Apply continuous color scale to ggplot object using CAPD palettes
#'
#' @param palette name of palette, from `capd_palettes`. Defaults to "sequential".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... Additional parameters passed on to the scale type
#'
#' @export
#'
scale_color_capd_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal_c(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}

#' @title CAPD continuous fill scales
#' @description
#'  Apply continuous fill scale to ggplot object using CAPD palettes
#'
#' @inheritParams scale_color_capd_continuous
#'
#' @export
#'
scale_fill_capd_continuous <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  pal <- capd_pal_c(palette = palette, reverse = reverse)

  ggplot2::scale_fill_gradientn(colors = pal(256),
                                 na.value = NA_col,
                                 ...)

}

## under development - not yet exported
scale_fill_capd_binned <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

 # pal <- capd_pal_d(palette = palette, reverse = reverse)
  pal <- capd_palettes[[palette]]
  ggplot2::binned_scale('fill',palette = scales::pal_gradient_n(pal),
               guide='coloursteps',n.breaks=length(pal),
                                ...)

}

## under development - not yet exported
scale_color_capd_binned <- function(palette = "sequential", reverse = FALSE, ...) {

  ## Color for missing data - by default, it will not be plotted
  NA_col = NA

  # pal <- capd_pal_d(palette = palette, reverse = reverse)
  pal <- capd_palettes[[palette]]
  ggplot2::binned_scale('color',palette = scales::pal_gradient_n(pal),
               guide='coloursteps',n.breaks=length(pal),
               ...)

}
