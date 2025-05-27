###########################################
# Data Visualization Workshop: Activity 2 #
###########################################

# Part a
# ======
# Type in code that will import pandas as pd and and import all functions 
#   from plotnine
import pandas as pd
from plotnine import *

# Part b
# ======
# We are going to use the gss_cat data set that is on the GitHub page.
# Read in the file, name it gss_cat, and then, using ggplot() and geom_bar(), 
# create a bar plot of the marital variable from the gss_catdata set.
gss_cat = pd.read_csv("~/My Drive/Red Rock Data Science Conference/2025/RRDS25 (GitHub)/Data/gss_cat.csv")
plot_b = (
  ggplot(gss_cat, aes(x = "marital")) # Put the proper variable in the aes() function
  + geom_bar() # Complete this line
)
plot_b.show() # Type plot_b or plot_b.show() to show the plot

# Part c
# ======
# Copy and paste your code from the plot in part b. In the geom_bar() function,
#   use the fill option to change the fill color of of bars to one of your 
#   choice (except don't choose black). Name this plot plot_c instead of plot_b.
plot_c = (
  ggplot(gss_cat, aes(x = "marital")) # Put the proper variable in the aes() function
  + geom_bar(fill = "steelblue") # Complete this line
)
plot_c.show() 

# Part d
# ======
# Some fill colors lack contrast with the background. Copy and paste your code 
#   from part c and then add color = "black" inside the geom_bar() function.
#   Name it plot_d. Comment on what that did.
plot_d = (
  ggplot(gss_cat, aes(x = "marital")) # Put the proper variable in the aes() function
  + geom_bar(fill = "steelblue", color = "black") # Complete this line
)
plot_d.show() 
# That put a black border around the bars.

# Part e
# ======
# Now make a bar plot with relig on the x-axis. Put fill = "marital"" in the 
#   aes() function to make side-by-side bar plots.
plot_e = (
  ggplot(gss_cat, aes(x = "relig", fill = "marital")) # Complete the aes() function
  + geom_bar(color = "black")
)
plot_e.show() # Type plot_e or plot_e.show()

# Part f
# ======
# There are a couple issues with that plot in part e. First, the plot is 
#   dominated by the protestant, catholic, and none categories. Let's adjust
#   each bar so the heights are standardized by putting position = "fill" in
#   the geom_bar() function. Second, the x-axis labels overlap. We can adjust 
#   the angle option in element_text for the axis.text.x in the theme() 
#   function. Putting hjust = 1 might also help.
plot_f = (
  ggplot(gss_cat, aes(x = "relig", fill = "marital")) # Complete the aes() function
  + geom_bar(color = "black", position = "fill") # Add position = "fill" here
  + theme(axis_text_x = element_text(angle = 60, hjust = 1)) # Add angle in here to swivel the category labels
)
plot_f.show() # Type plot_f or plot_f.show()

# Part g
# ======
# Now let's move onto a histogram. Make a histogram for the tvhours variable in
#   the gss_cat data set.
plot_g = (
  ggplot(gss_cat, aes(x = "tvhours")) # Fill in the right argument in the aes() function
  + geom_histogram(color = "black", fill = "steelblue", bins = 15)     # Fill in the color and fill options to make it look good. Also put bins = 15.
  + labs(x = "Hours of TV", y = "Frequency") # Fill in the labels for the x and y axes. Make the
                         #   label for the x-axis be "Hours of TV" and the label
                         #   for the y-axis be "Frequency"
)
plot_g.show() # Type plot_g or plot_g.show()

# Part h
# ======
# Make a vertical boxplot of tvhours, so you should have y = tvhours 
#   in the aes() function. Change the fill color of it to one of your choice.
plot_h = (
  ggplot(gss_cat, aes(y = "tvhours"))
  + geom_boxplot(fill = "steelblue")
)
plot_h.show()

# Part i
# ======
# Make side-by-side boxplots for comparing tvhours for the different 
#   marital categories. You can do this by putting x = marital and y = tvhours
#   in the aes() function. Then fill in the rest of the code here. Change the 
#   fill color to one you like and put appropriate labels.
plot_i = (
  ggplot(gss_cat, aes(x = "marital", y = "tvhours"))
  + geom_boxplot(fill = "steelblue") 
  + labs(x = "Marital Status", y = "TV Hours")
)
plot_i # Type plot_i or plot_i.show()

# Part j
# Finally, make a scatter plot with age on the x-axis and tvhours on the y-axis. 
#   Change the color based on the marital variable. 
#   Change the shape to something other than circles. 
#   Change the background theme to something other than gray.
#   Put some labels, give a title, and change the text size to be bigger. 
#   Then add geom_smooth(method = "lm") to draw the lines of best fit. 
# Does there seem to be a relationship between the variables?
plot_j = (
  ggplot(gss_cat, aes(x = "age", y = "tvhours", color = "marital")) # Put the aes() function in ggplot
  + geom_point(shape = ",") # Finish this line. Change the shape here. 
  + theme_classic() # Finish this line  
  + labs(x = "Age", y = "TV Hours", title = "Scatterplot of TV Hours vs Age") # Add axis labels and a title
  + geom_smooth(method = "lm", se = False) # Change the method in this function
)
plot_j
# The relationship between age and tv hours seems to be very weak, but positive. 
# Based on the lines of best fit, those who are married seem to watch the least
#   amount of TV. For those under the age of about 45, widowed people tend to 
#   watch the most TV while for those over 45, separated watch the most. 

