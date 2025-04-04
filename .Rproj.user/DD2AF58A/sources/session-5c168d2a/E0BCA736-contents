here::i_am("code/02_make_plot.R")

data <- readRDS(file = here::here("output/data_clean.rds"))

library(ggplot2)

plot_trend <- ggplot(data, aes(x = year_id, y = val)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = "Trends in Mean Age at Death Due to Suicide",
       x = "Year",
       y = "Mean Age at Death (Years)") +
  theme_minimal()

ggsave(
  here::here("output/trend_plot.png"),
  plot = plot_trend,
  device = "png"
)
