here::i_am("code/01_make_table.R")

data <- readRDS(file = here::here("output/data_clean.rds"))

library(knitr)
library(dplyr)

mean_age_table <- data %>%
  arrange(year_id)

saveRDS(mean_age_table, file = here::here("output/mean_age_table.rds"))
