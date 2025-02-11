library(ggplot2)

gg_ex_bar <- ggplot(data = resource_mix[resource_mix$year == 2023,]) +
  geom_bar(mapping = aes(x = generation_resource_mix, y = resource_label, fill = resource_label),
           stat = 'identity') +
  labs(x = 'Generation Resource Mix (%)',
       y = 'Resource',
       fill = 'Resource',
       title = '2023 eGRID Generation Resource Mix',
       caption = 'Data from 2023 eGRID summary data, Table 2') +
  scale_x_continuous(expand = expansion(add = c(0, 0.01)), labels = scales::label_percent())

usethis::use_data(gg_ex_bar, overwrite = TRUE)
