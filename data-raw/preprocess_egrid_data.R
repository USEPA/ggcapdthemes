## load eGRID summary data
egrid_summary_data <- read_excel('data-raw/summary_data_for_ggplot.xlsx') %>%
  janitor::clean_names()

resource_mix_2022 <- egrid_summary_data %>%
  filter(year == 2022) %>%
  pivot_longer(coal:other_unknown_purchased_fuel,
               names_to = 'resource',values_to = 'generation_resource_mix') %>%
  mutate(
    resource_label = case_when(
      resource == 'coal' ~ 'Coal',
      resource == 'oil' ~ 'Oil',
      resource == 'gas' ~ 'Gas',
      resource == 'geo_thermal' ~ 'Geothermal',
      resource == 'other_fossil' ~ 'Other Fossil',
      resource == 'other_unknown_purchased_fuel' ~ 'Other Unknown',
      resource == 'solar' ~ 'Solar',
      resource == 'biomass' ~ 'Biomass',
      resource == 'hydro' ~ 'Hydro',
      resource == 'nuclear' ~ 'Nuclear',
      resource == 'wind' ~ 'Wind'
    )
  )

usethis::use_data(resource_mix_2022, overwrite = TRUE)
