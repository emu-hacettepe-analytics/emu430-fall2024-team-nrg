library(dplyr)
library(ggplot2)
library(tidyr)

# changing Turkiye due to confusion

my_data2$region[my_data2$region == "Turkiye"] <- "Turkey"

# don't want to give percentages and convert it into standard notation

my_data2_ev_stock <- my_data2 |>
  filter(parameter == "EV stock") |>
  mutate(value = as.numeric(format(value, scientific = FALSE)))
 
# take the emission data of Turkey

my_data3_turkey <- my_data3 |>
  filter(entity == "Turkey")

# select the columns interested

my_data4_selected <- my_data4 |>
  select(year, total)

# year column of my_data4 is character, make it numeric

my_data4_selected$year <- as.numeric(my_data4_selected$year)

# join my_data3 and my_data4 by year

my_data3_4_turkey <- my_data3_turkey |>
  full_join(my_data4_selected, by = c("year"))

# columns total, year and efficiency shown as character, make them numeric

my_data3_4_turkey$total <- as.numeric(my_data3_4_turkey$total)
my_data3_4_turkey$year <- as.numeric(my_data3_4_turkey_eff$year)
my_data3_4_turkey$efficiency <- as.numeric(my_data3_4_turkey_eff$efficiency)

# plot efficiency vs. year

my_data3_4_turkey_eff <- my_data3_4_turkey |>
  mutate(co2_emission_per_vehicle = total / transport_co2_emissions,
         efficiency = 1 / co2_emission_per_vehicle) |>
  ggplot(aes(x = year, y = efficiency)) +
  geom_line( color = "blue", size = 1) +
  geom_vline(xintercept = 2020, color = "green", size = 0.5, linetype = "dashed") +
  geom_text(aes(x = 2020, y = 5, label = "pandemic"), color = "green", vjust = -1) +
  ylim(5, 7) +
  ggtitle("Efficiency of Vehicles Over Time") +
  scale_x_continuous(breaks = seq(2011, 2021, 1))

# print to console
my_data3_4_turkey_eff



