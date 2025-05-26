## ----setup, include=FALSE----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)
options(width = 55)
library(dslabs)
library(tidyverse)
library(reticulate)


## ----install ggplot2, eval = FALSE-------------------------------------------
# install.packages("ggplot2")
# install.packages("nycflights13")


## ----load ggplot2------------------------------------------------------------
library(ggplot2)
library(nycflights13)
head(flights, 3)


## ----compare functions, out.width="44%"--------------------------------------
# load the flights dataset and take a sample of 200
flights <- na.omit(nycflights13::flights); set.seed(1)
flights <- flights[sample(1:nrow(flights), 200),]
plot(flights$distance, flights$air_time, 
     xlab = "Flight Distance (miles)", 
     ylab = "Time in Air (minutes)",
     main = "Base Plot: Flights")


## ----ggplot1a, echo=T, eval=F, out.width="47%"-------------------------------
# ggplot(data = flights) +
#   geom_point(aes(x = distance, y = air_time)) +
#   labs(x = "Flight Distance (miles)",
#        y = "Time in Air (minutes)",
#        title = "ggplot: Flights")


## ----ggplot1b, echo=F, eval=T, out.width="93%"-------------------------------
ggplot(data = flights) +
  geom_point(aes(x = distance, y = air_time)) + 
  labs(x = "Flight Distance (miles)", 
       y = "Time in Air (minutes)", 
       title = "ggplot: Flights")


## import pandas as pd    # Needed to read in data file
## from plotnine import * # Import all functions from plotnine
## flights = pd.read_csv('flights.csv') # Read in data file
## 
## p = (
##   ggplot(flights)
##   + geom_point(aes(x = "distance", y = "air_time"))
##   + labs(x = "Flight Distance (miles)",
##          y = "Time in Air (minutes)",
##          title = "plotnine: Flights")
## )
## p.show()

## import pandas as pd    # Needed to read in data file
## from plotnine import * # Important all functions from plotnine
## flights = pd.read_csv('~/My Drive/Red Rock Data Science Conference/2025/Data Visualization Workshop/Slides/flights.csv')
## 
## p = (
##   ggplot(flights)
##   + geom_point(aes(x = "distance", y = "air_time"))
##   + labs(x = "Flight Distance (miles)",
##          y = "Time in Air (minutes)",
##          title = "plotnine: Flights")
## )
## p.show()

## ----ggplot_text, echo=T, eval=T, out.width="58%"----------------------------
ggplot(data = flights) +
  geom_point(aes(x = distance, y = air_time)) + 
  geom_text(aes(x = distance, y = air_time, label = arr_delay)) +
  labs(x = "Flight Distance (miles)", y = "Time in Air (minutes)", 
       title = "ggplot: Flights with Text")


## ----ggplot_text_red, echo=T, eval=T, out.width="55%"------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point() + 
  geom_text(aes(label = arr_delay), nudge_x = 45) +
  labs(x = "Flight Distance", y = "Air Time")


## ----ggplot_red_blue, echo=T, eval=T, out.width="60%"------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(color = "red") + 
  geom_text(aes(label=arr_delay), nudge_x=45, color="blue") +
  labs(x = "Flight Distance", y = "Air Time")


## ----ggplot_pipe2, echo=T, eval=T, out.width="55%"---------------------------
flights |> 
  ggplot(aes(distance, air_time)) + 
  geom_point(col = "brown") + 
  labs(x = "Flight Distance", y = "Air Time")


## ----ggplot_loess, echo=T, eval=T, out.width="50%"---------------------------
ggplot(flights, aes(distance, air_time)) + 
  geom_point() + 
  geom_smooth(color = "red", linetype = "dashed") +
  labs(x = "Flight Distance", y = "Air Time")


## ----ggplot_lm, echo=T, eval=T, out.width="55%"------------------------------
ggplot(flights, aes(distance, air_time)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = F, formula = "y ~ x") +
  labs(x = "Flight Distance", y = "Air Time")


## ----ggplot_theme, echo=T, eval=T, out.width="55%"---------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point() +
  labs(x = "Flight Distance", y = "Air Time") + 
  theme_bw()


## ----ggplot_shape, echo=T, eval=T, out.width="55%"---------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(size = 5, color = "red", shape = 2) + 
  labs(title = "Red, triangular ggplot")


## ----ggplot_font_a, out.width="48%", echo = T, eval = F----------------------
# # change font size and style
# ggplot(data = flights, aes(x = distance, y = air_time)) +
#   geom_point(shape = 16, size = 3) +
#   labs(title = "Check out this Font!",
#        x = "Flight Distance (miles)",
#        y = "Air Time (minutes)") +
#   theme(axis.title = element_text(size = 20),
#         axis.text = element_text(size = 14),
#         plot.title = element_text(size = 30, face = "bold"))


## ----ggplot_font_b, out.width="95%", echo = F, eval = T----------------------
# change font size and style
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(shape = 16, size = 3) +
  labs(title = "Check out this Font!",
       x = "Flight Distance (miles)", y = "Air Time (minutes)") + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 14),
        plot.title = element_text(size = 30, face = "bold"))


## ----ggplot_line, echo=T, eval=T, out.width="65%"----------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_line() + labs(title = "Line ggplot")


## ----ggplot_area, echo=T, eval=T, out.width="60%"----------------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_area() + labs(title = "Area ggplot")


## ----ggplot_group1, echo=T, eval=T, out.width="49%"--------------------------
ggplot(data = flights, aes(x = distance, y = air_time, 
                           color=origin, shape=origin)) +
  geom_point(size = 3)


## ----ggplot_group1_lines, echo=T, eval=T, out.width="55%"--------------------
ggplot(data = flights, aes(x = distance, y = air_time,
                           color=origin, shape=origin)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", formula = "y ~ x", se = F)


## ----ggplot_group1_1line, echo=T, eval=T, out.width="58%"--------------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(aes(color = origin, shape = origin), size = 3) +
  geom_smooth(method = "lm", formula = "y ~ x", color = "black")


## ----ggplot_group1_line_behind, echo=T, eval=T, out.width="58%"--------------
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_smooth(method = "lm", formula = "y ~ x", color = "black") +
  geom_point(aes(color = origin, shape = origin), size = 3) 


## ----ggplot_group2, echo=T, eval=T, out.width="58%"--------------------------
ggplot(data = flights, aes(x = distance, y = air_time, 
                           color=origin, shape=origin)) +
  geom_point(size = 3) +
  scale_color_manual(values=c("orange","darkgreen","lightblue"))


## ----ggplot_group3a, echo=T, eval=F, out.width="45%"-------------------------
# ggplot(data = flights, aes(x = distance, y = air_time,
#                            color=origin, shape=origin)) +
#   geom_point(size = 3) +
#   scale_color_manual(
#     breaks = c("JFK", "LGA", "EWR"),
#     values = c("darkgreen", "lightblue", "orange")
#     ) +
#   scale_shape_manual(
#     breaks = c("JFK", "LGA", "EWR"),
#     values = c("J", "L", "N")
#     ) +
#   theme_bw()


## ----ggplot_group3b, echo=F, eval=T, out.width="95%"-------------------------
ggplot(data = flights, 
       aes(x = distance, y = air_time, color = origin, shape = origin)) +
  geom_point(size = 3) + 
  scale_color_manual(
    breaks = c("JFK", "LGA", "EWR"),
    values = c("darkgreen", "lightblue", "orange")
    ) +
  scale_shape_manual(
    breaks = c("JFK", "LGA", "EWR"),
    values = c("J", "L", "N")
    ) +
  theme_bw()


## ----ggplot_group4a, out.width="45%", eval = F-------------------------------
# # color by a continuous variable
# ggplot(data = flights,
#        aes(x = distance, y = air_time, color = dep_time)) +
#   geom_point() +
#   scale_colour_continuous(type = "viridis")


## ----ggplot_group4b, out.width="95%", echo = F-------------------------------
# color by a continuous variable
ggplot(data = flights, 
       aes(x = distance, y = air_time, color = dep_time)) +
  geom_point() +
  scale_colour_continuous(type = "viridis")


## ----ggplot_limits, out.width="55%", echo = T, eval = T----------------------
# change the x and y limits
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(size = 3) +
  lims(x = c(0, 4000), y = c(0, 400))


## ----ggplot_ticks_a, out.width="56%", echo = T, eval = F---------------------
# # change the x and y breaks and limits
# ggplot(data = flights, aes(x = distance, y = air_time)) +
#   geom_point(size = 3) +
#   scale_x_continuous(breaks = seq(0, 4000, by = 500),
#                      limits = c(0, 4000)) +
#   scale_y_continuous(breaks = seq(0, 400, by = 50),
#                      limits = c(0, 500))


## ----ggplot_ticks_b, out.width="95%", echo = F, eval = T---------------------
# change the x and y breaks and limits
ggplot(data = flights, aes(x = distance, y = air_time)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 4000, by = 500), 
                     limits = c(0, 4000)) +
  scale_y_continuous(breaks = seq(0, 400, by = 50), 
                     limits = c(0, 500))


## ----ggplot_hist1, echo=T, eval=T, out.width="55%"---------------------------
# Save the base plot as an object p. Then add to p.
p <- ggplot(data = flights, aes(x = arr_delay))
p + geom_histogram(color = "black", fill = "lightblue",
                   bins = 20)


## ----ggplot_hist2, echo=T, eval=T, out.width="58%"---------------------------
# We already created p, so we can add other options to it.
# Smaller alpha makes the plot more transparent.
p + geom_histogram(color = "darkgreen", fill = "green",
                   bins = 50, alpha = 0.1, 
                   linetype = 2, linewidth = 1) +
  labs(x = "Arrival Delay (minutes)", y = "Frequency")


## ----ggplot_density, out.width="71%"-----------------------------------------
ggplot(data = flights, aes(x = arr_delay, fill = origin)) +
  geom_density(alpha = 0.3)


## ----ggplot_box1, echo=T, eval=T, out.width="65%"----------------------------
ggplot(data = flights, aes(x = arr_delay)) +
  geom_boxplot(color = "black", fill = "lightblue")


## ----ggplot_box2, echo=T, eval=T, out.width="58%"----------------------------
ggplot(data = flights, aes(x = origin, y = arr_delay)) +
  geom_boxplot(color = "black", fill = "lightblue")


## ----ggplot_bar1a, echo=T, eval=T, out.width="60%"---------------------------
ggplot(data = flights, aes(x = fct_infreq(carrier))) +
  geom_bar(color = "black", fill = "lightblue") +
  labs(x = "Airline", y = "Frequency")


## ----ggplot_bar1b, echo=T, eval=T, out.width="54%"---------------------------
ggplot(data = flights, aes(x = fct_infreq(carrier))) +
  geom_bar(color = "black", fill = "lightblue") +
  labs(x = "Airline", y = "Frequency") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


## ----ggplot_bar2, echo=T, eval=T, out.width="58%"----------------------------
ggplot(data = flights, aes(x = carrier, fill = origin)) +
  geom_bar(color = "black", position = "dodge") +
  labs(x = "Airline", y = "Frequency", fill = "Airport Origin")


## ----ggplot_bar3, echo=T, eval=T, out.width="58%"----------------------------
ggplot(data = flights, aes(x = carrier, fill = origin)) +
  geom_bar(color = "black", position = "dodge") +
  labs(x = "Airline", y = "Frequency",
       fill = "Airport Origin") + 
  scale_fill_manual(values=c("orange", "darkgreen", "lightblue"))


## ----ggplot_bar4, echo=T, eval=T, out.width="55%"----------------------------
ggplot(data = flights, aes(x = carrier, fill = origin)) +
  geom_bar(color = "black", position = "stack") +
  labs(x = "Airline", y = "Frequency",
       fill = "Airport Origin")


## ----ggplot_bar5, echo=T, eval=T, out.width="48%"----------------------------
ggplot(data = flights, aes(x = carrier, fill = origin)) +
  geom_bar(color = "black", position = "fill") +
  labs(x = "Airline", y = "Proportion",
       fill = "Airport Origin")


## ----ggplot_bar6, echo=T, eval=T, out.width="45%"----------------------------
flights |> group_by(origin) |>
  summarize(avg_delay = mean(arr_delay)) |>
  ggplot(aes(x = origin, y = avg_delay, fill = origin)) +
  geom_bar(color = "black", stat = "identity") +
  labs(x = "Airport Origin", y = "Average Arrival Delay (minutes)") +
  theme(legend.position = "none")


## ----ggplot_col, echo=T, eval=T, out.width="45%"-----------------------------
flights |> group_by(origin) |>
  summarize(avg_delay = mean(arr_delay)) |>
  ggplot(aes(x = origin, y = avg_delay, fill = origin)) +
  geom_col(color = "black") +
  labs(x = "Airport Origin", y = "Average Arrival Delay (minutes)") +
  theme(legend.position = "none")


## ----ggplot_facet1,fig.height = 2, fig.width = 6-----------------------------
# make the basis for a plot using ggplot save it as p
p <- ggplot(data = flights, aes(x = distance, y = air_time))
# add a geom (points) and display the plot
p + geom_point(size = 0.5) + facet_grid(cols = vars(origin),
     labeller = label_both) + labs(x = "Distance", y = "Air Time",
       title = "Air time versus distance, separated by origin")


## ----ggplot_facet2,out.width="50%", echo=T, eval=F---------------------------
# # make the basis for a plot using ggplot save it as p
# p <- flights |>
#   filter(carrier %in% c("UA", "DL", "AA")) |>
#   ggplot(aes(x = distance, y = air_time))
# # add a geom (points) and display the plot
# p + geom_point() + geom_jitter(width = 100) +
#   facet_grid(cols = vars(origin), rows = vars(carrier),
#      labeller = label_both) +
#   labs(x = "Distance", y = "Air Time",
#        title = paste("Air time versus",
#                      "distance by origin and carrier"))


## ----ggplot_facet3,out.width="95%", echo=F, eval=T---------------------------
# make the basis for a plot using ggplot save it as p
p <- flights |>
  filter(carrier %in% c("UA", "DL", "AA")) |>
  ggplot(aes(x = distance, y = air_time))
# add a geom (points) and display the plot
p + geom_point() + geom_jitter(width = 100) +
  facet_grid(cols = vars(origin), rows = vars(carrier),
     labeller = label_both) + 
  labs(x = "Distance", y = "Air Time",
       title = paste("Air time versus",
                     "distance by origin and carrier"))


## import pandas as pd    # Needed to read in data file
## import plotnine as p9
## from plotnine import * # Import all functions from plotnine
## p9.options.figure_size = (12, 7)
## flights = pd.read_csv('flights.csv')
## 
## p = (
##   ggplot(flights, aes(x = "distance", y = "air_time",
##                       color = "origin", shape = "origin"))
##   + geom_point(size = 0.5)
##   + geom_jitter(width = 100)
##   + theme_bw()
##   + labs(x="Distance", y = "Air Time", title = "ggplot",
##          color = "Origin Airport", shape = "Origin Airport")
##   + scale_x_continuous(breaks = list(range(0, 3000, 500)))
##   + scale_color_manual(values = ["orange", "darkgreen", "lightblue"])
##   + theme(axis_title = element_text(size = 20), # note _ instead of .
##           plot_title = element_text(size = 24),
##           axis_text_x = element_text(angle = 60, vjust = 1))
##   + facet_grid(rows = "origin", cols = "carrier", labeller = "label_both")
## )
## p.show()

## import pandas as pd    # Needed to read in data file
## import plotnine as p9
## from plotnine import * # Import all functions from plotnine
## p9.options.figure_size = (12.5, 8.5)
## flights = pd.read_csv('~/My Drive/Red Rock Data Science Conference/2025/Data Visualization Workshop/Slides/flights.csv')
## 
## p = (
##   ggplot(flights, aes(x = "distance", y = "air_time",
##                       color = "origin", shape = "origin"))
##   + geom_point(size = 0.5)
##   + geom_jitter(width = 100)
##   + theme_bw()
##   + labs(x="Distance", y = "Air Time", title = "plotnine Plot",
##          color = "Origin Airport", shape = "Origin Airport")
##   + scale_x_continuous(breaks = list(range(0, 3000, 500)))
##   + scale_color_manual(values = ["orange", "darkgreen", "lightblue"])
##   + theme(axis_title = element_text(size = 20), # note _ instead of .
##           plot_title = element_text(size = 24),
##           axis_text_x = element_text(angle = 60, vjust = 1))
##   + facet_grid(rows = "origin", cols = "carrier", labeller = "label_both")
## )
## p.show()

## ----plotly, message=FALSE, eval = F, echo = T-------------------------------
# library(plotly)
# p <- flights |>
#   mutate(hover_label = paste(
#     "Distance:", distance, "miles",
#     "\nAir Time:", air_time, "minutes",
#     "\nDeparture Time:", dep_time,
#     "\nArrival Delay:", arr_delay, "minutes"
#     )
#   ) |>
#   ggplot(aes(x = distance, y = air_time, text = hover_label)) +
#   geom_point()
# ggplotly(p, tooltip = "text") # Makes only text shown in hover,
#                               #   not x or y


## ----pressure, warning = FALSE, cache = F------------------------------------
sessionInfo()

