
#############
# Problem 1 #
#############
library(tidyverse) |> suppressPackageStartupMessages()

#############
# Problem 2 #
#############
storms2 <- mutate(dplyr::storms, category = factor(category))

#############
# Problem 3 #
#############
ggplot(storms2, aes(x = category)) +
  geom_bar(color = "black", fill = "lightblue") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.4) +
  labs(title = "Bar Plot of Hurricane Category")
  
#############
# Problem 4 #
#############
ggplot(storms2, aes(x = wind)) +
  geom_histogram(binwidth = 10, color = "black", fill = "lightblue") +
  labs(x = "Wind Speed", y = "Frequency", 
       title = "Histogram for Storm Wind Speed") +
  scale_x_continuous(breaks = seq(0, 160, by = 10))

#############
# Problem 5 #
#############
ggplot(storms2, aes(y = wind)) +
  geom_boxplot(color = "black", fill = "lightblue") +
  labs(y = "Wind Speed", 
       title = "Boxplot for Storm Wind Speed") +
  theme(plot.title = element_text(size = 20),
        axis.title = element_text(size = 14)) +
  scale_x_continuous(breaks = NULL)

#############
# Problem 6 #
#############
ggplot(storms2, aes(x = category, y = wind, fill = category)) +
  geom_boxplot(color = "black") +
  labs(x = "Hurricane Category", y = "Wind Speed", 
       title = "Boxplot for Storm Wind Speed by Category") +
  theme_bw() +
  theme(legend.position = "none")

#############
# Problem 7 #
#############
storms2 |>
  filter(year > 2020) |>
  ggplot(aes(x = wind, y = pressure, color = status)) +
  geom_point() +
  labs(x = "Wind Speed (in knots)", y = "Pressure (in millibars)",
       color = "Status", 
       title = "Scatterplot of Pressure vs Wind Speed by Status") +
  scale_color_manual(values = c("red", "orange4", "gold", "green3","blue",
                                "purple", "gray2"))

#############
# Problem 8 #
#############
storms2 |>
  mutate(status = fct_relevel(status, "hurricane", after = Inf)) |> 
  ggplot(aes(x = factor(year), fill = status)) +
  geom_bar(color = "black") +
  labs(x = "Year", y = "Frequency", fill = "Status") +
  scale_fill_brewer(palette = "Set1", direction = -1) +
  scale_y_continuous(breaks = seq(0, 800, 100)) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

#############
# Problem 9 #
#############
p <- storms2 |>
  filter(year >= 2019) |>
  ggplot(aes(x = wind, fill = factor(year))) +
  geom_histogram(color = "black", bins = 30) +
  facet_grid(rows = vars(year)) +
  labs(x = "Wind Speed (knots)", y = "Frequency", 
       fill = "Year", title = "Histogram of Wind Speed by Year") +
  theme_classic() +
  theme(plot.title = element_text(size = 20, face = "bold"),
        strip.text = element_text(size = 12, face = "bold"))
p

##############
# Problem 10 #
##############
library(plotly)
ggplotly(p)
