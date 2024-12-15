library(dplyr)
library(ggplot2)
library(tidyr)

countries <- c("United States", "Germany", "United Arab Emirates", "China", "Turkey")

# country recommendation?

emissions_by_country <- my_data3 |>
  filter(entity %in% countries) |>
  ggplot(aes(x = year, y = transport_co2_emissions, color = entity)) +
  geom_line(size = 1) +
  scale_y_continuous(
    trans = "log10",
    breaks = c(1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000),
    labels = c("1", "10", "100", "1K", "10K", "100K", "1M", "10M", "100M", "1B", "10B")
  ) +
  facet_wrap(~ entity)

emissions_by_country