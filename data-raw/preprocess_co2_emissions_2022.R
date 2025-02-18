
co2_emission_2022 <- readr::read_csv('data-raw/CO2_total_output_emission_rate_by_eGRID_subregion_2022.csv') |>
    dplyr::rename(region = Region,
         co2 = `CO2 total output emission rate (lb/MWh) by eGRID subregion 2022`,
         year = Year)

usethis::use_data(co2_emission_2022, overwrite = TRUE)
