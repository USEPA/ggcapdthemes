#' Set CAPD ggplot theme
#'
#' @return theme object to be appended to a ggplot call
#'
#' @importFrom ggplot2 theme element_text element_line element_blank element_rect %+replace%
#' @export
#'
#' @examples
#' # chart ggplot mpg dataset with CAPD theme
#' df <- ggplot2::mpg
#' ggplot2::ggplot(df, ggplot2::aes(x=cyl, y=cty)) +
#'   ggplot2::geom_point() +
#'   theme_capd()
theme_capd <- function(){

  ## use default font until sysfonts kinks are worked out
  base_family <- NULL
  th <- list(
    ggplot2::theme_bw() %+replace%
      theme(
        ## format title, subtitle, caption
        plot.title= element_text(hjust = 0.5, family = base_family),
        plot.subtitle = element_text(hjust = 0.5, family = base_family),
        plot.caption = element_text(family = base_family),

        ## format plot background
        ## change background color
        plot.background = element_rect(fill = 'white', color = NA),
        panel.background = element_rect(fill = 'white', color = NA),
        panel.border = element_blank(),

        ## gridlines
        panel.grid = element_line(color = '#c9c9c9',linetype = 'dotted'),
        axis.line = element_line(color = '#2e2e2e', linetype = 'solid'),

        ## format axes
        axis.title = element_text(family = base_family),
        axis.title.y = element_text(vjust = 1, angle=0,hjust = 1),#,margin=margin(l=0,r=-100)),
        axis.ticks = element_blank(),
        axis.text = element_text(family = base_family),
        ## format legend
        legend.text = element_text(family = base_family),
        legend.title = element_text(),

      )
  )

  return(th)
}
