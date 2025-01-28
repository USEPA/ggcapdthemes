
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggcapdthemes

<!-- badges: start -->
<!-- badges: end -->

The `ggcapdthemes` package provides a custom ggplot2 theme and
functionality to incorporate guidance from the EPA’s Clean Air Power
Division (CAPD) Data Visualization Style Guide. Examples show how to
implement the theme and color palettes and demonstrate best practices
for building various chart types in R.

## Installation

You can install the development version of ggcapdthemes from
[GitHub](https://github.com/) with:

``` r
#NOTE: You will need the “devtools” package to utilize the install_github function
# install.packages("devtools")
devtools::install_github("usepa/ggcapdthemes", build_vignettes = TRUE)
```

## Example

Here we use the `resource_mix` dataset from eGRID 2018-2022 Summary
data. We show the barplot using ggplot2 and and after applying the
`scale_color_capd_discrete` and `theme_capd` functions.

``` r
library(ggplot2)
library(ggcapdthemes)

## build ggplot barplot
p_bar <- ggplot(data = resource_mix[resource_mix$year == 2022,]) +
  geom_bar(mapping = aes(x = generation_resource_mix, y = resource_label, fill = resource_label),
           stat = 'identity') + 
  labs(x = 'Generation Resource Mix (%)', y = 'Resource', fill = 'Resource', 
       title = '2022 eGRID Generation Resource Mix',
       caption = 'Data from 2022 eGRID summary data, Table 2') +
  scale_x_continuous(expand = c(0,0))

## original chart
p_bar
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

## with capd theme
p_bar + theme_capd(orientation = 'vert')
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r

## with fuel type color palette and capd theme
p_bar +
  scale_fill_capd_discrete(palette = 'fuel_type') +
  theme_capd(orientation = 'vert') 
```

<img src="man/figures/README-example-3.png" width="100%" />

## Disclaimer

The United States Environmental Protection Agency (EPA) GitHub project
code is provided on an “as is” basis and the user assumes responsibility
for its use. EPA has relinquished control of the information and no
longer has responsibility to protect the integrity , confidentiality, or
availability of the information. Any reference to specific commercial
products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by EPA. The EPA seal and logo
shall not be used in any manner to imply endorsement of any commercial
product or activity by EPA or the United States Government.
