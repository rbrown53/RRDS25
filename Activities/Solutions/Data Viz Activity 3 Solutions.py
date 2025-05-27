
#############
# Problem 1 #
#############
import pandas as pd
from plotnine import *
storms = pd.read_csv("~/My Drive/Red Rock Data Science Conference/2025/RRDS25 (GitHub)/Data/storms.csv")

#############
# Problem 2 #
#############
storms2 = storms
storms2.category = storms2.category.astype("category")
storms2.category = storms2.category.cat.add_categories("NA")
storms2.category = storms2.category.fillna("NA")

#############
# Problem 3 #
#############
plot_3 = (
    ggplot(storms2, aes(x = "category"))
    + geom_bar(color = "black", fill = "lightblue")
    + geom_text(aes(label = "..count.."), stat = "count", va = "bottom")
    + labs(title = "Bar Plot of Hurricane Category")
)
plot_3.show()
  
#############
# Problem 4 #
#############
plot_4 = (
    ggplot(storms2, aes(x = "wind")) 
    + geom_histogram(binwidth = 10, color = "black", fill = "lightblue")
    + labs(x = "Wind Speed", y = "Frequency", 
           title = "Histogram for Storm Wind Speed")
    + scale_x_continuous(breaks = range(0, 170, 10))
)
plot_4.show()

#############
# Problem 5 #
#############
plot_5 = (
    ggplot(storms2, aes(y = "wind")) 
    + geom_boxplot(color = "black", fill = "lightblue") 
    + labs(y = "Wind Speed", 
       title = "Boxplot for Storm Wind Speed") 
    + theme(plot_title = element_text(size = 20),
            axis_title = element_text(size = 14))
    + scale_x_continuous(breaks = [])
)
plot_5.show()

#############
# Problem 6 #
#############
plot_6 = (
    ggplot(storms2, aes(x = "category", y = "wind", fill = "category"))
    + geom_boxplot(color = "black")
    + labs(x = "Hurricane Category", y = "Wind Speed", 
           title = "Boxplot for Storm Wind Speed by Category")
    + theme_bw()
    + theme(legend_position = "none")
)
plot_6.show()

#############
# Problem 7 #
#############
plot_7 = (
    ggplot(storms2.query("year > 2020"), aes(x = "wind", y = "pressure", color = "status"))
    + geom_point()
    + labs(x = "Wind Speed (in knots)", y = "Pressure (in millibars)",
           color = "Status", 
           title = "Scatterplot of Pressure vs Wind Speed by Status")
    + scale_color_manual(values = ["red", "orange", "gold", "green", "blue", "purple", "gray"])
)
plot_7.show()

#############
# Problem 8 #
#############
storms2['status'] = storms2['status'].astype('category') # Change status to a categorical variable
levels = list(storms2['status'].cat.categories) # Get the levels of status
levels = [lvl for lvl in levels if lvl != "hurricane"] + ["hurricane"] # Remove "hurricane" and append it at the end
storms2['status'] = storms2['status'].cat.reorder_categories(levels, ordered=True) # Reorder the levels

plot_8 = (
    ggplot(storms2, aes(x = "year", fill = "status"))
    + geom_bar(color = "black")
    + labs(x = "Year", y = "Frequency", fill = "Status")
    + scale_fill_brewer(palette = 10, direction = -1)
    + scale_y_continuous(breaks = range(0, 900, 100))
    + theme(axis_text_x = element_text(angle = 60, hjust = 1))
)
plot_8.show()

#############
# Problem 9 #
#############
# storms2['year'] = storms2['year'].astype('int')
storms2_filtered = storms2.query("year >= 2019").copy()
storms2_filtered['year'] = storms2_filtered['year'].astype("category")

plot_9 = (
    ggplot(storms2_filtered, aes(x = "wind", fill = "year"))
    + geom_histogram(color = "black", bins = 30)
    + facet_grid(rows = "year")
    + labs(x = "Wind Speed (knots)", y = "Frequency", 
           fill = "Year", title = "Histogram of Wind Speed by Year")
    + theme_classic()
    + theme(plot_title = element_text(size = 20, face = "bold"),
            strip_text = element_text(size = 12, face = "bold"))
)
plot_9.show()

##############
# Problem 10 #
##############
# Not going to do in Python
