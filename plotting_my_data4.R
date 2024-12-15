library(dplyr)
library(ggplot2)
library(tidyr)


my_data4_numeric <- my_data4 |>
  mutate(across(everything(), as.numeric))

# To convert all variables in a data frame to numeric, you can use the following approach:

# 1. Convert All Columns to Numeric
# Here’s how you can do it while preserving the data frame structure:
  
# my_data4 <- my_data4 %>%
# mutate(across(everything(), as.numeric))
# Explanation:
  # across(everything(), as.numeric): Applies as.numeric to every column in the data frame.

# adjust the table

my_data4_long <- my_data4_numeric |>
  pivot_longer(
    cols = c(gas, diesel, lpg, hybrid, electric, unknown), 
    names_to = "vehicle_type", 
    values_to = "value"        
  )

# plot the data

vehicle_trends_plot <- ggplot(my_data4_long, aes(x = year, y = value, color = vehicle_type)) +
  geom_line(size = 1) +
  theme_bw() +
  labs(
    title = "Vehicle Trends Over Time (Logarithmic Scale)",
    x = "Year",
    y = "Value",
    color = "Vehicle Type"
   ) + 
    scale_y_continuous(
    trans = "log10",
    breaks = c(1, 10, 100, 1000, 10000, 100000, 1000000, 10000000),
    labels = c("1", "10", "100", "1K", "10K", "100K", "1M", "10M")
  ) + 
   facet_wrap(~ vehicle_type) +
   scale_x_continuous(breaks = 2011:2021) +
   theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
vehicle_trends_plot


