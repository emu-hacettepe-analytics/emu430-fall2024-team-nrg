


# Preparation: Library


library(readr)
library(readxl)
library(dplyr)
library(ggplot2)

# Preparation : Renaming the variables

# my_data1

my_data1 <- my_data1 |>
  rename(make = Make,
         model = Model,
         year = Year,
         engine_size_l = `Engine Size (L)`,
         fuel_type = `Fuel Type`,
         price_usd = `Price (USD)`
  )

my_data1 <- my_data1 |>
  filter(year %in% c(2011:2021)) |>
  arrange(year)

head(my_data1)

# my_data2

my_data2 <- my_data2 |>
  filter(year %in% c(2011:2021))
  arrange(year)

head(my_data2)

# my_data3

my_data3 <- my_data3 |>
  rename(entity = Entity,
         code = Code,
         year = Year
  )

my_data3 <- my_data3 |>
  filter(year %in% c(2011:2021)) |>
  arrange(year)

head(my_data3)


# my_data4

my_data4 <- my_data4 |>
  rename(year = Yıl,
         total = Toplam,
         gas = Benzin,
         diesel = Dizel,
         lpg = LPG,
         hybrid = `Hibrit (2)`,
         electric = Elektrik,
         unknown = `Bilinmeyen (3)`
  )
my_data4 <- my_data4 |>
  rename(percentage_total = ...3,
         percentage_gas = ...5,
         percentage_diesel = ...7,
         percentage_lpg = ...9,
         percentage_hybrid = ...11,
         percentage_electric = ...13,
         percentage_unknown = ...15
  )

my_data4 <- my_data4 |>
  filter(year %in% c(2011:2021)) |>
  arrange(year)

head(my_data4)

# my_data5
my_data5 <- read_csv("C:/Users/Tolkan/Documents/GitHub/emu430-fall2024-team-nrg/veriler.csv")

my_data5 <- as.data.frame(my_data5)
my_data5 <- my_data5 |>
  rename(year = period,
         state_id = stateid,
         state_description = stateDescription,
         sector_id = sectorid,
         sector_name = sectorName,
         price_in_units = `price-units`
  ) 

my_data5 <- my_data5 |>
  filter(year %in% c(2011:2021)) |>
  arrange(year)

head(my_data5)