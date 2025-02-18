
renewables_raw <- read.csv('data-raw/resource_mix_renewable_vs_non-renewable_fuels_by_eGRID_subregion_2023.csv') |>
  janitor::clean_names()

renewables <- renewables_raw |>
  dplyr::mutate(hydro = readr::parse_number(hydro),
          all_non_hydro_renewables = readr::parse_number(all_non_hydro_renewables),
         all_non_renewables = readr::parse_number(all_non_renewables),
         region = factor(region, levels=region)) |>
  tidyr::pivot_longer(cols=hydro:all_non_renewables, names_to='fuel_type', values_to='resource_mix') |>
  # mutate(fuel_type = str_replace_all(fuel_type, c('hydro' = 'Hydro', 'all_non_hydro_renewables'='Non-hydro', 'all_non_renewables'='Non-nuclear'))) %>%
  dplyr::mutate(fuel_type = stringr::str_replace_all(fuel_type, c('all_non_hydro_renewables'='Renewables', 'all_non_renewables'='Non-renewables','hydro' = 'Renewables')))

usethis::use_data(renewables, overwrite = TRUE)


combustion_raw <- read.csv('data-raw/resource mix_combustible_vs_non-combustible_fuels_by_eGRID_subregion_2023.csv') |>
  janitor::clean_names()

combustion <- combustion_raw |>
  dplyr::mutate(all_combustion = readr::parse_number(all_combustion),
         all_non_combustion = readr::parse_number(all_non_combustion),
         region = factor(region, levels=region)) |>
  tidyr::pivot_longer(cols=all_combustion:all_non_combustion, names_to='fuel_type', values_to='resource_mix') |>
  dplyr::mutate(fuel_type = stringr::str_replace_all(fuel_type, c( 'all_combustion'='Combustion', 'all_non_combustion'='Non-combustion')))

usethis::use_data(combustion, overwrite = TRUE)
