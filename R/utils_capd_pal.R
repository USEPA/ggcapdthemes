
min_colors <- c('divergent' = 2,'divergent2' = 2,'sequential' = 3,'unordered' = 2, 'unordered2' = 2)
max_colors <-  c('divergent' = 7,'divergent2' = 7,'sequential' = 7,'unordered' = 5, 'unordered2' = 5)

globalVariables(c("capd_palettes"))


#' Define function for retrieving color palettes
#'
#' @param palette name of palette, from `capd_palettes`. Defaults to "fuel_type".
#' @param reverse logical to indicate if palette order should be reversed. Defaults to FALSE.
#' @param ... additional arguments passed to grDevices::colorRampPalette

#' @return a palette function that takes an integer argument for the number of colors and returns a character vector of hex color codes. If the number is greater than the size of the vector, additional colors are interpolated.
#' @keywords internal
#' @noRd
#'
#'
#'
#'
capd.pal <- function(n, name){
  if (!(name %in% names(capd_palettes))) {
    stop(paste(name, "is not a valid palette name for brewer.pal\n"))
  }


  if(!(name %in% names(min_colors))){
    return(capd_palettes[[name]])
  }

  if (n < min_colors[name]) {
    warning("minimal value for n is 3, returning requested palette with 3 different levels\n")
    return(capd.pal(min_colors[name], name))
  }
  if (n > max_colors[name]) {
    warning(paste("n too large, allowed maximum for palette",
                  name, "is", max_colors[name]),
            "\nReturning the palette you asked for with that many colors\n")
    return(capd.pal(max_colors[name],
                    name))
  }
  switch(name,
         'divergent' =  switch(n-1,
                               `2` = c('#FC906D','#73B3E7'),
                               `3` = c('#FC906D','#E6E6E6','#73B3E7'),
                               `4` = c('#CF4900','#FC906D','#73B3E7','#2378C3'),
                               `5` = c('#CF4900','#FC906D','#E6E6E6','#73B3E7','#2378C3'),
                               `6` = c('#782312','#CF4900','#FC906D','#73B3E7','#2378C3','#274863'),
                               `7` = c('#782312','#CF4900','#FC906D','#E6E6E6','#73B3E7','#2378C3','#274863')
         ),
         'divergent2' = switch(n-1,
                               '2' = c('#E5A000', '#73B3E7'),
                               '3' = c('#E5A000', '#E6E6E6', '#73B3E7'),
                               '4' = c('#936F38', '#E5A000', '#73B3E7', '#2378C3'),
                               '5' = c('#936F38', '#E5A000', '#E6E6E6', '#73B3E7', '#2378C3'),
                               '6' = c('#5C410A', '#936F38', '#E5A000', '#73B3E7', '#2378C3', '#274863'),
                               '7' = c('#5C410A', '#936F38', '#E5A000', '#E6E6E6', '#73B3E7', '#2378C3','#274863')
         ),
         'sequential' = switch(n-2,
                               '3' =  c('#D9E8F6','#AACDEC','#73B3E7'),
                               '4' =  c('#D9E8F6','#AACDEC','#73B3E7','#4F97D1'),
                               '5' =  c('#D9E8F6','#AACDEC','#73B3E7','#4F97D1','#2378C3'),
                               '6' =  c('#D9E8F6','#AACDEC','#73B3E7','#4F97D1','#2378C3','#2C608A'),
                               '7' =  c('#D9E8F6','#AACDEC','#73B3E7','#4F97D1','#2378C3','#2C608A','#274863')
         ),
         'unordered' = switch(n-1,
                              '2' = c('#2378C3','#2E2E2E'),
                              '3' = c('#2378C3','#2E2E2E','#919191'),
                              '4' = c('#2378C3','#2E2E2E','#919191','#5C5C5C'),
                              '5' = c('#2378C3','#2E2E2E','#919191','#5C5C5C','#EF5E25')
         ),
         'unordered2' = switch(n-1,
                               '2' = c('#2378C3','#5C5C5C','Other'='#C9C9C9'),
                               '3' = c('#2378C3','#5C5C5C','#9287D8','Other'='#C9C9C9'),
                               '4' = c('#2378C3','#5C5C5C','#9287D8','#EF5E25','Other'='#C9C9C9'),
                               '5' = c('#2378C3','#5C5C5C','#9287D8','#EF5E25','#8A984B','Other'='#C9C9C9')
         ),
         'fuel_type' = c('Other Unknown' = '#CD425B','Gas' = '#EF5E25','Oil'= '#8E704F','Solar'= '#8A984B', 'Biomass' = '#4D8055',
                         'Wind' = '#168092', 'Coal' = '#5C5C5C', 'Hydro' = '#2378C3', 'Nuclear'='#9287D8','Other Fossil'='#B04ABD',
                         'Geothermal' = '#C84281'),
         'fuel_type2' = c('Other Unknown' = '#CD425B','Gas' = '#EF5E25','Oil'= '#8E704F','Solar'= '#FFBE2E', 'Biomass' = '#4D8055',
                                   'Wind' = '#5ABF95', 'Coal' = '#5C5C5C', 'Hydro' = '#2378C3', 'Nuclear'='#9287D8','Other Fossil'='#B04ABD',
                                   'Geothermal' = '#C84281'),
         ## Consolidated fuel type: renewables
         'renewables' = c('Non-renewables (excluding nuclear)' = '#EF5E25', 'Renewables (excluding hydro)'= '#8A984B','Hydro'='#2378C3','Nuclear'='#9287D8'),

         'renewables2' = c('Non-renewable'='#EF5E25','Renewable'='#8A984B'),

         ## Consolidated fuel type: combustion
         'combustion' = c('Combustion' = '#EF5E25','Non-combustion'='#2378C3'),

         ## pollutant
         'pollutant' = c('CO2' = '#CD425B', 'NOx'='#2378C3','SO2'='#9287D8','Hg'='#C84281','PM2.5'='#8A984B',
                         'CH4'='#B04ABD','N2O'='#919191','SF6'='#4D8055')

  )
}

capd_pal_c <- function(palette = "sequential",
                      reverse = FALSE,
                      ...) {

  pal <- capd_palettes[[palette]]

  pal <- unname(pal)
  if (reverse){
    pal <- rev(pal)
  }

  grDevices::colorRampPalette(pal, ...)

}

capd_pal_d <- function(palette = "unordered", reverse = FALSE){
  function(n){

    if(!(palette %in% names(min_colors))){
      all_colors <- capd_palettes[[palette]]
    } else if(n < min_colors[palette]){
      warning('Too few colors for this palette')
    } else if (n > max_colors[palette]){
      warning("Too many colors for this palette")
    } else {
      all_colors <- suppressWarnings(capd.pal(n, palette))
     # all_colors <- unname(all_colors)
      if(reverse == T){
        all_colors <- rev(all_colors)
      }

      all_colors[1:n]
    }

  }
}
