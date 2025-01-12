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
