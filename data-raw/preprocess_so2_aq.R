
## SO2 Data source
## https://www.epa.gov/power-sector/progress-report-air-quality

so2_aq_orig <- readxl::read_excel('data-raw/2022_air_quality_data.xlsx',sheet = 1, skip = 2, range = 'A3:F46')

so2_aq <- so2_aq_orig |>
  rename(year = Year, avg = Mean, q10 = `10th Percentile`, q90 = `90th Percentile`, units = Units) |>
  select(year, avg, q10, q90, units) |>
  mutate(year = as.numeric(year))

usethis::use_data(so2_aq, overwrite = TRUE)
