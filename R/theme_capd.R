#' Set CAPD ggplot theme
#'
#' @return theme object to be appended to a ggplot call
#'
#' @importFrom ggplot2 theme element_text element_line element_blank element_rect %+replace%
#' @export
#'
#' @examples
#' # chart ggplot mpg dataset with CAPD theme
#' library(ggplot2)
#' df <- resource_mix[resource_mix$year == 2022,]
#' p_bar <- ggplot(data = df) +
#' geom_bar(mapping = aes(x = generation_resource_mix, y = resource_label, fill = resource_label),
#'         stat = 'identity') +
#'  labs(x = 'Generation Resource Mix (%)', y = 'Resource', fill = 'Resource',
#'       title = '2022 eGRID Generation Resource Mix',
#'       caption = 'Data from 2022 eGRID summary data, Table 2')
#' p_bar + theme_capd()

theme_capd <- function(){

  if(!('Source Sans 3' %in% sysfonts::font_families())){
    sysfonts::font_add_google('Source Sans 3')
  }

  suppressMessages(
    trace(grDevices::png, exit = quote({
    showtext::showtext_begin()
  }), print = FALSE)
  )

  suppressMessages(  untrace(grDevices::png))
  showtext::showtext_begin()

  ## use default font until sysfonts kinks are worked out
  base_family <- 'Source Sans 3'
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
        legend.title = element_text(family = base_family),

      )
  )

  showtext::showtext_end()

  return(th)
}
