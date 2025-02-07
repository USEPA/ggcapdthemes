#' @title Set CAPD ggplot theme
#'
#' @param base_size font size, in pt
#' @param orientation direction to use for gridlines
#' @param gridlines should both major and minor gridlines ("both") or major only ("major") be displayed?
#' @return theme object to be appended to a ggplot call
#'
#' @importFrom ggplot2 theme element_text element_line element_blank element_rect %+replace% rel margin
#' @export
#'
#' @examples
#' # chart ggplot mpg dataset with CAPD theme
#' library(ggplot2)
#' library(ggcapdthemes)
#' df <- resource_mix[resource_mix$year == 2022,]
#' p_bar <- ggplot(data = df) +
#' geom_bar(mapping = aes(x = generation_resource_mix, y = resource_label, fill = resource_label),
#'         stat = 'identity') +
#'  labs(x = 'Generation Resource Mix (%)', y = 'Resource', fill = 'Resource',
#'       title = '2022 eGRID Generation Resource Mix',
#'       caption = 'Data from 2022 eGRID summary data, Table 2')
#' p_bar + theme_capd()

theme_capd <- function(base_size=11, orientation = "horiz",
                       gridlines = 'both'){

  # if(!('source-sans-3' %in% sysfonts::font_families())){
  #   sysfonts::font_add_google('Source Sans 3',family = 'source-sans-3')
  # }

  #extrafont::font_import(pattern='Source Sans 3',prompt=F)
  #extrafont::loadfonts(quiet = TRUE)
  #extrafont::font_import(pattern='Source Sans 3',prompt=F)
  # suppressMessages(
  #   trace(grDevices::png, exit = quote({
  #   showtext::showtext_begin()
  # }), print = FALSE)
  # )

  if(gridlines == 'both'){
    panel.grid <- element_line(color = '#c9c9c9',linetype = 'dotted',linewidth = ggplot2::rel(1))
    panel.grid.minor <- element_line(color = '#c9c9c9',linetype = 'dotted',linewidth = ggplot2::rel(1))
  } else if(gridlines == 'major'){
    panel.grid <- element_line(color = '#c9c9c9',linetype = 'dotted',linewidth = ggplot2::rel(1))
    panel.grid.minor <- element_blank()
  } else{
    stop('Please use either "both" or "major" for the gridlines argument.')
  }

  if(orientation == 'vert'){
    axis.line.x = element_blank()
    axis.line.y = element_line(color = '#2e2e2e', linetype = 'solid')
  } else if(orientation == 'horiz'){
    axis.line.x = element_line(color = '#2e2e2e', linetype = 'solid')
    axis.line.y = element_blank()
  }

  #suppressMessages(  untrace(grDevices::png))
  #showtext::showtext_begin()

  ## use default font until sysfonts kinks are worked out
  base_family <- 'Source Sans 3'
  half_line <- base_size/2
  th <- list(
    ggplot2::theme_bw(base_size=base_size) %+replace%
      theme(
        text = element_text(family = base_family, face = "plain",
                                    colour = "black", size = base_size),

        ## format title, subtitle, caption
        plot.title= element_text(hjust = 0, size = ggplot2::rel(1.2), family = base_family, margin = ggplot2::margin(b = half_line)),
        plot.subtitle = element_text(hjust = 0, family = base_family, margin = ggplot2::margin(b = half_line)),
        plot.caption = element_text(family = base_family, size = ggplot2::rel(0.8)),

        ## format plot background
        ## change background color
        plot.background = element_rect(fill = 'white', color = NA),
        panel.background = element_rect(fill = 'white', color = NA),
        panel.border = element_blank(),

        ## gridlines
        panel.grid = panel.grid,
        panel.grid.minor = panel.grid.minor,
        #axis.line = element_line(color = '#2e2e2e', linetype = 'solid'),
        axis.line.x = axis.line.x,
        axis.line.y = axis.line.y,
        ## format axes
        axis.title = element_text(family = base_family),
        #axis.title.y = element_text(vjust = 1, angle=0,hjust = 1),#,margin=margin(l=0,r=-100)),
        axis.ticks = element_blank(),
        axis.text = element_text(family = base_family, size=ggplot2::rel(0.8)),
        ## format legend
        legend.text = element_text(family = base_family, size = ggplot2::rel(0.8)),
        legend.title = element_text(family = base_family, ),

      )

  )

  if(orientation == "horiz"){
    th[[1]]$panel.grid.major.x <- element_blank()
    th[[1]]$panel.grid.minor.x <- element_blank()

  } else if (orientation == "vert"){
    th[[1]]$panel.grid.major.y <- element_blank()
    th[[1]]$panel.grid.minor.y <- element_blank()

  }


  #showtext::showtext_end()

  return(th)
}
