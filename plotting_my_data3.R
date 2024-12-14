library(dplyr)
library(ggplot2)

countries <- c("United Kingdom", "Germany", "United Arab Emirates", "Japan", "Turkey")

# country recommendation?

emissions_by_country <- my_data3 |>
  filter(entity %in% countries) |>
  ggplot(aes(x = year, y = transport_co2_emissions, color = entity)) +
  geom_line(size = 1) +
  scale_y_log10()

emissions_by_country