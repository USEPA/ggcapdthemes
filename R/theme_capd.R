#' @title Set CAPD ggplot theme
#'
#' @param base_size font size, in pt
#' @param axis_lines orientation to use for axis and grid lines. Options are "horiz", "vert", or "both".
#' @param grid_lines should major and/or minor gridlines be displayed? Options are "major","minor", or c("major","minor").
#' @param ticks should tick marks be displayed? Options are TRUE or FALSE.
#' @param legend_position side of chart to put legend on, use "right", "left", "top","bottom", or "none". passed to legend.position argument of ggplot2::theme
#'
#' @return theme object to be appended to a ggplot call
#'
#' @importFrom ggplot2 theme element_text element_line element_blank element_rect %+replace% rel margin
#' @export
#'
#' @examples
#' # chart ggplot mpg dataset with CAPD theme
#' library(ggplot2)
#' library(ggcapdthemes)
#'
#' # apply basic theme
#' gg_ex_bar + theme_capd()
#'
#' # change base font size throughout plot elements
#' gg_ex_bar + theme_capd(base_size = 6)
#' gg_ex_bar + theme_capd(base_size = 16)
#'
#' # rotate axis and grid lines
#' gg_ex_bar + theme_capd(axis_lines = "vert")
#'
#' # show major and minor gridlines (default is major only)
#' gg_ex_bar + theme_capd(axis_lines = "vert", grid_lines = c("major","minor"))
#'
#' # move legend to bottom of plot
#' gg_ex_bar + theme_capd(legend_position = "bottom")
#'
#' ## hide legend
#' gg_ex_bar + theme_capd(legend_position = "none)
#'
#' ## show ticks on non-major axis - depends on axis_lines value
#' gg_ex_bar + theme_capd(ticks = TRUE)
#' gg_ex_bar + theme_capd(axis_lines = "vert", ticks = TRUE)

theme_capd <- function(base_size=11, axis_lines = "horiz",
                       grid_lines = 'major', ticks = FALSE, legend_position = 'right'){

  if(is.na(as.numeric(base_size)) | is.nan(as.numeric(base_size))){
    warning('No valid base_size provided. Setting to 11pt.')
    base_size <- 11
  }

  if(length(grid_lines) == 0){
    warning('No grid_lines value provided. Setting to "major".')
    grid_lines <- 'major'
  } else if(length(grid_lines) > 2){
    warning('Too many grid_lines values provided. Setting to "major".')
    grid_lines <- 'major'
  }

  base_family <- 'Source Sans 3'
  half_line <- base_size/2
  panel.grid <- element_line(color = '#c9c9c9',linetype = 'dashed',
                             linewidth = rel(0.8))
  axis.line = element_line(color = '#2e2e2e', linetype = 'solid')


  if('minor' %in% grid_lines){
    panel.grid.minor <- panel.grid
  } else {
    panel.grid.minor <- element_blank()
  }

  if('major' %in% grid_lines){
    panel.grid.major <- panel.grid
  } else {
    panel.grid.major <- element_blank()
  }

  if(axis_lines == 'vert'){
    axis.line.x <- element_blank()
    axis.line.y <- axis.line

    panel.grid.major.x <- panel.grid.major
    panel.grid.minor.x <- panel.grid.minor

    panel.grid.major.y <- element_blank()
    panel.grid.minor.y <- element_blank()

  } else if(axis_lines == 'horiz'){
    axis.line.x = axis.line
    axis.line.y = element_blank()

    panel.grid.major.x <- element_blank()
    panel.grid.minor.x <- element_blank()

    panel.grid.major.y <- panel.grid.major
    panel.grid.minor.y <- panel.grid.minor
  } else if(axis_lines == 'both'){
    axis.line.x <- axis.line
    axis.line.y <- axis.line

    panel.grid.major.x <- panel.grid.major
    panel.grid.minor.x <- panel.grid.minor

    panel.grid.major.y <- panel.grid.major
    panel.grid.minor.y <- panel.grid.minor
  } else {
    stop('Please use "vert", "horiz", or "both" for the axis_lines argument.')
  }

  if(ticks == TRUE){
    axis.ticks <- element_line(color = 'black')

    if(axis_lines == 'vert'){
      axis.ticks.x <- axis.ticks
      axis.ticks.y <- element_blank()
    } else if(axis_lines == 'horiz'){
      axis.ticks.x <- element_blank()
      axis.ticks.y <- axis.ticks
    } else {
      axis.ticks.x <- axis.ticks
      axis.ticks.y <- axis.ticks
    }
  } else if(ticks == FALSE){
    axis.ticks <- element_blank()
    axis.ticks.x <- axis.ticks
    axis.ticks.y <- axis.ticks
  } else {
    stop('Please use TRUE or FALSE for the ticks argument.')
  }

  th <- list(
    ggplot2::theme_bw(base_size=base_size) %+replace%
      theme(
        text = element_text(family = base_family, face = "plain",
                                    colour = "black", size = base_size),

        ## format title, subtitle, caption
        plot.title= element_text(hjust = 0, size = rel(1.2), family = base_family, margin = margin(b = half_line)),
        plot.subtitle = element_text(hjust = 0, family = base_family, margin = margin(b = half_line)),
        plot.caption = element_text(family = base_family, size = rel(0.8)),

        ## format plot background
        ## change background color
        plot.background = element_rect(fill = 'white', color = NA),
        panel.background = element_rect(fill = 'white', color = NA),
        panel.border = element_blank(),

        ## gridlines
        panel.grid = panel.grid,
        panel.grid.major = panel.grid,
        panel.grid.minor = panel.grid.minor,
        panel.grid.major.x = panel.grid.major.x,
        panel.grid.minor.x = panel.grid.minor.x,
        panel.grid.major.y = panel.grid.major.y,
        panel.grid.minor.y = panel.grid.minor.y,

        axis.line = axis.line,
        axis.line.x = axis.line.x,
        axis.line.y = axis.line.y,
        ## format axes
        axis.title = element_text(family = base_family),
        axis.ticks = axis.ticks,
        axis.ticks.x = axis.ticks.x,
        axis.ticks.y = axis.ticks.y,
        axis.text = element_text(family = base_family, size = rel(0.8)),

        ## facets
        strip.text = element_text(family = base_family, size = rel(0.8), margin = margin(b = half_line, t=half_line)),

        ## format legend
        legend.text = element_text(family = base_family, size = rel(0.8)),
        legend.title = element_text(family = base_family),
        legend.position = legend_position
      )

  )

  return(th)
}
