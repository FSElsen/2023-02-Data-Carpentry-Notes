library(tidyverse)
library(ggplot2)

mtcars %>% 
  ggplot(aes(mpg, hp, color =cyl)) +
  geom_point()




