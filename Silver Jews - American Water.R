library(tidyverse)

# colours
# i asked a painter why the roads are coloured #ED5E72
pal <- c(sky = "#6DA0BF", horizon = "#242430", road = "#ED5E72")

# create some mountain ranges using random distributions, not aiming for perfection here
# In 1984, I was hospitalised for approaching perfection...
range1 <- c(sort(runif(7, 0.25, 0.29)), sort(runif(3, 0.25, 0.31), decreasing = TRUE))
range2 <- runif(10, 0.28, 0.29)
range3 <- 0.27
range4 <- runif(10, 0.26, 0.27)
range5 <- c(sort(runif(3, 0.25, 0.29)), sort(runif(5, 0.25, 0.31), decreasing = TRUE))

# length of x-axis that will be required to be filled by horizon line
101 - length(c(range1, range2, range3, range4, range5))

# tibble for horizon - insert ranges in between constant y-values
horizon <- tibble(x = seq(0, 1, 0.01),
                  y = c(rep(0.25, 10), range1, rep(0.25, 27), range2, rep(0.25, 2), 
                        range3, rep(0.25, 2), range4, rep(0.25, 12), range5, rep(0.25, 9)))

# tibble for road
road <- tibble(x = c(0.01, 0.49, 0.51, 0.99),
               y = c(0, 0.24, 0.24, 0))

# plot
ggplot(horizon, aes(x, y)) +
  # horizon
  geom_col(colour = pal[2], fill = pal[2]) +
  # road
  geom_polygon(data = road, aes(x, y), fill = pal[3]) +
  # leaving out the band name as can't get the right font - chalkboard is close but looks lame
  #annotate("text", x = 0.2, y = 0.8, label = "SiLver\nJews",
  #         size = 20, fontface = "bold", family = "ChalkboardSE-Bold") +
  scale_x_continuous(expand = c(0, 0)) +
  # set limits of y axis
  scale_y_continuous(limits = c(0, 1), expand = c(0,0)) +
  # void themes
  theme_void() +
  # fill in background for sky
  theme(plot.background = element_rect(fill = pal[1]),
        plot.margin = margin(0, 0, 0, 0))

# save plot
ggsave("american_water_R.png", width = 10, height = 10)
