#' Combustion vs non-combustion resource mix data
#'
#' @description Resource Mix by combustible vs. non-combustible fuels
#' by eGRID subregion, 2023. Data collected from EPA eGRID Data Explorer.
#'
#' @format
#' A data frame with 56 rows and 4 columns
#' \describe{
#'   \item{region}{eGRID subregion abbreviation}
#'   \item{fuel_type}{fuel type(s)}
#'   \item{resource_mix}{percent of total resource mix}
#'   \item{year}{year of data collection. currently only 2023}
#'}
#' @source https://www.epa.gov/egrid/data-explorer
"combustion"


#' Renewable vs. non-renewable resource mix data
#'
#' @description Resource Mix by renewable vs. non-renewable fuels
#' by eGRID subregion, 2023. Data collected from EPA eGRID Data Explorer.
#'
#' @format
#' A data frame with 84 rows and 4 columns
#' \describe{
#'   \item{region}{eGRID subregion abbreviation}
#'   \item{fuel_type}{fuel type(s)}
#'   \item{resource_mix}{percent of total resource mix}
#'   \item{year}{year of data collection. currently only 2023}
#'  }
#' @source https://www.epa.gov/egrid/data-explorer
"renewables"


#' SO2 Air Quality dataset
#'
#' @description Collected from EPA Clean Air Power Sector 2022 Progress Report on Air Quality
#'
#' @format
#' A data frame with 129 rows and 4 columns
#' \describe{
#'   \item{year}{year of data collection}
#'   \item{units}{scientific units of SO2, ppb}
#'   \item{stat}{label for SO2 summary statistic, either "avg" for average, "q10" for 10th %ile, or "q90" for 90th %ile}
#'   \item{value}{value of SO2 summary statistic}
#'}
#' @source https://www.epa.gov/power-sector/progress-report-air-quality
"so2_aq"


#' Resource Mix Data
#'
#' @description Collected from eGRID 2018-2022 Summary datasets Table 2. Example data for demonstrating eGRID themes and scales for barplots
#'
#' @format
#' A data frame with 11 rows and 6 columns
#' \describe{
#'   \item{year}{year of data collection}
#'   \item{nameplate_capacity_mw}{Nameplate Capacity (MW)}
#'   \item{net_generation_m_wh}{Net Generation (MWh)}
#'   \item{resource}{cleaned resource name for use in R}
#'   \item{generation_resource_mix}{Generation Resource Mix (percent)}
#'   \item{resource_label}{Original Resource name, for charts}
#'}
#' @source eGRID 2018-2022 Summary data
"resource_mix"

#' CO2 Emissions dataset
#'
#' @description Collected from U.S. EPA eGRID Data Explorer
#'
#' @format
#' A data frame with 28 rows and 3 columns
#' \describe{
#'   \item{region}{eGRID subregion abbreviation}
#'   \item{co2}{CO2 total output emission rate (lb/MWh)}
#'   \item{year}{year of emissions, currently just 2022}
#'}
#' @source https://www.epa.gov/egrid/data-explorer
"co2_emission_2022"

#' Color Palettes for CAPD
#'
#' @description Color Palettes for CAPD
#'
#' @format
#' A named list with hex color codes
#'
#' @source CAPD Data Visualization Style Guide
"capd_palettes"
