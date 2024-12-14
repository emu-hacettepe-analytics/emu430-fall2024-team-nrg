library(readr)
library(readxl)
library(dplyr)
library(ggplot2)

dat <- read_csv("C:/Users/Tolkan/Documents/GitHub/emu430-fall2024-team-nrg/veriler.csv")

dat <- as.data.frame(dat)
dat <- dat |>
  rename(sector_id = sectorId,
         sector_name = `sector-name`,
         fuel_id = fuelId,
         fuel_name = `fuel-name`,
         state_id = stateId,
         state_name = `state-name`,
         value_in_units = `value-units`
         )

head(dat)