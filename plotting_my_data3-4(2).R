library(readr)
library(readxl)
library(dplyr)
library(ggplot2)
library(tidyr)

# filter Turkey

my_data3_turkey <- my_data3 |>
  filter(entity == "Turkey")

# make the year column numeric

my_data3_turkey$year <- as.numeric(my_data3_turkey$year)

# select the interested columns

my_data4_selected_prop <- my_data4 |>
  select(year, percentage_gas, percentage_diesel, percentage_lpg, percentage_hybrid, percentage_electric, percentage_unknown)

# make the year column numeric

my_data4_selected_prop$year <- as.numeric(my_data4_selected_prop$year)

# join the two tables

my_data3_4_prop <- my_data3_turkey |>
  full_join(my_data4_selected_prop, by = c("year"))

# adjust the table

vehicle_prop <- c("percentage_gas", "percentage_diesel", "percentage_lpg", "percentage_hybrid", "percentage_electric", "percentage_unknown")

my_data3_4_prop_long <- my_data3_4_prop |>
  pivot_longer(cols = vehicle_prop, names_to = "vehicle_type", values_to = "percentage")

# make the percentage column numeric

my_data3_4_prop_long$percentage <- as.numeric(my_data3_4_prop_long$percentage)

# plot the data

my_data3_4_prop_plot <- my_data3_4_prop_long |>
  ggplot(aes(x = year, y = percentage, fill = vehicle_type)) +
  geom_bar(stat = "identity", position = "fill", width = 0.8) +
  scale_fill_brewer(palette = "Paired") +
  labs(title = "Vehicle Propensity Over Time", y = "Percentage")

my_data3_4_prop_plot
