here::i_am("code/00_load_data.R")

library(dplyr)
library(here)

data <- read.csv(here::here("raw_data", "IHME_GBD_2021_SUICIDE.csv"))

filtered_data <- data %>%
  filter(sex_id == 3, location_name == "Global", cause_name == "Self-harm") %>%
  select(year_id, val)

saveRDS(filtered_data, file = here::here("output/data_clean.rds"))
