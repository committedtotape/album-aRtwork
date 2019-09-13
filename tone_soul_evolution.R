library(tidyverse)

poly1 <- tibble(x = c(0, 4, 4, 0, 0),
                y = c(0, 0, 3, 3, 0))

poly2 <- tibble(x = c(0, 4, 4, 0, 0),
                y = c(3, 3, 5, 5, 3))

poly3 <- tibble(x = c(0, 4, 4, 0, 0),
                y = c(5, 5, 9, 9, 5))

ggplot() +
  coord_equal() + 
  geom_polygon(data = poly1, aes(x = x, y = y), fill = "#d4d000") + 
  geom_polygon(data = poly2, aes(x = x, y = y), fill = "#d43106") + 
  geom_polygon(data = poly3, aes(x = x, y = y), fill = "#6063a6") + 
    geom_hline(yintercept = c(0, 3, 5, 9, 10), size = 3) + 
  geom_vline(xintercept = c(0, 4, 10), size = 3) + 
  annotate("text", label = "THE APPLES IN STEREO", x = 1.8, y = 9.7, size = 3.5) + 
  annotate("text", label = "TONE SOUL EVOLUTION", x = 8, y = 0.3, size = 4) + 
  theme(panel.background=element_blank(), 
        panel.grid.major=element_blank(), 
        panel.grid.minor=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text.x=element_blank(), 
        axis.text.y=element_blank(), 
        axis.title.x=element_blank(), 
        axis.title.y=element_blank(),
        plot.background = element_rect(fill = "transparent",colour = NA))

ggsave("tone_soul_evolution_R.png")


