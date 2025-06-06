###########################################
# Data Visualization Workshop: Activity 2 #
###########################################

# Part a
# ======
# Type in code that will load the tidyverse, which contains ggplot2.


# Part b
# ======
# We are going to use the gss_cat data set that was loaded with the tidyverse.
# Using ggplot() and geom_bar(), create a bar plot of the marital variable from 
#   the gss_catdata set.
ggplot(gss_cat, aes()) + # Put the proper variable in the aes() function
  geom_ # Complete this line

# Part c
# ======
# Copy and paste your code from part b. In the geom_bar() function, use the fill
#   option to change the fill color of of bars to one of your choice (except 
#   don't choose black).


# Part d
# ======
# Some fill colors lack contrast with the background. Copy and paste your code 
#   from part c and then add color = "black" inside the geom_bar() function. 
#   Comment on what that did.

# Part e
# ======
# Now make a bar plot with relig on the x-axis. Put fill = marital in the aes()
#   function to make side-by-side bar plots.
ggplot(gss_cat, aes()) + # Complete the aes() function
  geom_bar()

# Part f
# ======
# There are a couple issues with that plot in part e. First, the plot is 
#   dominated by the protestant, catholic, and none categories. Let's adjust
#   each bar so the heights are standardized by putting position = "fill" in
#   the geom_bar() function. Second, the x-axis labels overlap. We can adjust 
#   the angle option in element_text for the axis.text.x in the theme() 
#   function. Putting hjust = 1 might also help.
ggplot(gss_cat, aes()) + # Complete the aes() function
  geom_bar() + # Add position = "fill" here
  theme(axis.text.x = element_text()) # Add angle in here to swivel the category labels

# Part g
# ======
# Now let's move onto a histogram. Make a histogram for the tvhours variable in
#   the gss_cat data set.
ggplot(gss_cat, aes(x = )) + # Fill in the right argument in the aes() function
  geom_histogram() +     # Fill in the color and fill options to make it look 
                         #   good. Also put bins = 15.
  labs(x = "", y = "")   # Fill in the labels for the x and y axes. Make the
                         #   label for the x-axis be "Hours of TV" and the label
                         #   for the y-axis be "Frequency"


# Part h
# ======
# Make a vertical boxplot of tvhours, so you should have y = tvhours 
#   in the aes() function. Change the fill color of it to one of your choice.


# Part i
# ======
# Make side-by-side boxplots for comparing tvhours for the different 
#   marital categories. You can do this by putting x = marital and y = tvhours
#   in the aes() function. Then fill in the rest of the code here. Change the 
#   fill color to one you like and put appropriate labels.
ggplot(gss_cat, aes(x = , y = )) + 
  geom_boxplot() +     
  labs(x = "", y = "")

# Part j
# Finally, make a scatter plot with age on the x-axis and tvhours on the y-axis. 
#   Change the color based on the marital variable. 
#   Change the shape to something other than circles. 
#   Change the background theme to something other than gray.
#   Put some labels, give a title, and change the text size to be bigger. 
#   Then add geom_smooth(method = "lm") to draw the lines of best fit. 
# Does there seem to be a relationship between the variables?
ggplot(gss_cat, ) + # Put the aes() function in ggplot
  geom_ + # Finish this line. Change the shape here. 
  theme_ + # Finish this line  
  labs() + # Add axis labels and a title
  geom_smooth() # Change the method in this function
