## code to prepare `egrid_palettes` dataset goes here

egrid_palettes <- list(

  ## fuel type
  'fuel_type' = c('Other Unknown' = '#CD425B','Gas' = '#EF5E25','Oil'= '#8E704F','Solar'= '#8A984B', 'Biomass' = '#4D8055',
                  'Wind' = '#168092', 'Coal' = '#5C5C5C', 'Hydro' = '#2378C3', 'Nuclear'='#9287D8','Other Fossil'='#B04ABD',
                  'Geothermal' = '#C84281'),

  ## pollutant
  'pollutant' = c('CO2' = '#CD425B', 'NOx'='#2378C3','SO2'='#9287D8','Hg'='#C84281','PM2.5'='#8A984B',
                  'CH4'='#B04ABD','N2O'='#919191','SF6'='#4D8055'),

  ## sequential
  'sequential' = c('#D9E8F6','#AACDEC','#73B3E7','#4F97D1','#2378C3','#2C608A','#274863'),

  ## divergent 1
  'divergent' = c('#782312','#CF4900','#FC906D','#E6E6E6','#73B3E7','#2378C3','#274863'),

  ## divergent 2
  'divergent2' = c('#5C410A', '#936F38', '#E5A000', '#E6E6E6','#73B3E7','#2378C3','#274863'),

  ## unordered
  'unordered' = c('#2378C3','#2E2E2E','#919191','#5C5C5C','#EF5E25','Other'='#C9C9C9'),

  ## unordered 2
  'unordered2' = c('#2378C3','#5C5C5C','#9287D8','#EF5E25','#8A984B','Other'='#C9C9C9'),

  ## fuel type 2: Not for line charts
  'fuel_type2' = c('Other Unknown' = '#CD425B','Gas' = '#EF5E25','Oil'= '#8E704F','Solar'= '#947100', 'Biomass' = '#4D8055',
                   'Wind' = '#168092', 'Coal' = '#5C5C5C', 'Hydro' = '#2378C3', 'Nuclear'='#9287D8','Other Fossil'='#B04ABD',
                   'Geothermal' = '#C84281'),

  ## Consolidated fuel type: renewables
  'renewables' = c('#EF5E25', '#8A984B','Hydro'='#2378C3','Nuclear'='#9287D8'),

  'renewables2' = c('Non-renewable'='#EF5E25','Renewable'='#8A984B'),

  ## Consolidated fuel type: combustion
  'combustion' = c('Combustion' = '#EF5E25','Non-combustion'='#2378C3')


)

egrid_palettes_dynamic <- list(
  'divergent' =  list(
    '2' = c('#FC906D','#73B3E7'),
    '3' = c('#FC906D','#E6E6E6','#73B3E7'),
    '4' = c('#CF4900','#FC906D','#73B3E7','#2378C3'),
    '5' = c('#CF4900','#FC906D','#E6E6E6','#73B3E7','#2378C3'),
    '6' = c('#782312','#CF4900','#FC906D','#73B3E7','#2378C3','#274863'),
    '7' = c('#782312','#CF4900','#FC906D','#E6E6E6','#73B3E7','#2378C3','#274863')
  ),
  'divergent2' = list(
    '2' = c('#E5A000', '#73B3E7'),
    '3' = c('#E5A000', '#E6E6E6', '#73B3E7'),
    '4' = c('#936F38', '#E5A000', '#73B3E7', '#2378C3'),
    '5' = c('#936F38', '#E5A000', '#E6E6E6', '#73B3E7', '#2378C3'),
    '6' = c('#5C410A', '#936F38', '#E5A000', '#73B3E7', '#2378C3', '#274863'),
    '7' = c('#5C410A', '#936F38', '#E5A000', '#E6E6E6', '#73B3E7', '#2378C3','#274863'),

  )

)

usethis::use_data(egrid_palettes, overwrite = TRUE)




