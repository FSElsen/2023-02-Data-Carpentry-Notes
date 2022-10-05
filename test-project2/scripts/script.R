library(tidyverse)
library(ggplot2)

my_plot<- 
  mtcars %>% 
  ggplot(aes(mpg, hp, color = cyl)) +
  geom_point()


ggsave("fig_output/cars.png", my_plot)

