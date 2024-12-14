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


my_data4_long <- my_data4_numeric %>%
  pivot_longer(
    cols = c(gas, diesel, lpg, hybrid, electric, unknown), 
    names_to = "vehicle_type", 
    values_to = "value"        
  )

vehicle_trends <- ggplot(my_data4_long, aes(x = year, y = value / 10^4, color = vehicle_type)) +
  geom_line(size = 1) +
  theme_bw() +
  labs(
    title = "Vehicle Trends Over Time",
    x = "Year",
    y = "Value (in 10,000s)",
    color = "Vehicle Type"
  )

vehicle_trends