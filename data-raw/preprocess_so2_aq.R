
## SO2 Data source
## https://www.epa.gov/power-sector/progress-report-air-quality

so2_aq_orig <- readxl::read_excel('data-raw/2022_air_quality_data.xlsx',sheet = 1, skip = 2, range = 'A3:F46')

so2_aq <- so2_aq_orig |>
  rename(year = Year, avg = Mean, q10 = `10th Percentile`, q90 = `90th Percentile`, units = Units) |>
  select(year, avg, q10, q90, units) |>
  mutate(year = as.numeric(year))

so2_aq |>
  pivot_longer(cols = c(avg, q10, q90), names_to = 'stat', values_to = 'value') |>
  ggplot(aes(x=year, y=value, color=stat)) +
  geom_line() +
  labs(color='Statistic', y = 'SO_2 Air Quality')

so2_aq |>
  pivot_longer(cols = c(avg, q10, q90), names_to = 'stat', values_to = 'value') |>
  ggplot(aes(x=year, y=value, color=fct_reorder2(stat,year,value))) +
  geom_line() +
  labs(color = 'Statistic')


