###########################################
# Data Visualization Workshop: Activity 1 #
###########################################

# Part a
# ======
# Type in code that will import pandas as pd and and import all functions 
#   from plotnine


# Part b
# ======
# We are going to use the starwars data set that is on the GitHub page. 
# Go ahead and read it in using the read_csv() function in pandas.


# Part c
# ======
# Run this code below and comment what it creates. It actually does create 
#   something even if it is not very impressive.
plot_c = ggplot(starwars)
plot_c.show() # Sometimes this should be plot_c sometimes plot_c.show() depending on your IDE

# Part d
# ======
# Now run this code and comment on what it does. 
plot_d = ggplot(starwars, aes(x = "height"))
# Type plot_d or plot_d.show()

# Part e
# ======
# Now run this code and comment on what it does. 
plot_e = ggplot(starwars, aes(x = "height", y = "mass"))
# Type plot_e or plot_e.show()

# Part f
# ======
# Now run this code and comment on what it does. 
plot_f = (
  ggplot(starwars, aes(x = "height", y = "mass"))
  + geom_point()
)
# Type plot_f or plot_f.show()

# Part g
# ======
# Hurray! We've made our first ggplot! However, there is one very obvious 
#   outlier. The outlier is from row 16. Remove row 16 and save the new data 
#   frame as starwars2. In pandas, you can do this with starwars.drop(15)


# Part h
# ======
# Now, let's make it prettier. In the geom_bar() function, use the color option 
#   to change the color of the points to one of your choice (except don't choose 
#   black).
plot_h = (
  ggplot(starwars2, aes(x = "height", y = "mass"))
  + geom_point(color = "") # Put your favorite color between the quotes.
)
# Type plot_h or plot_h.show()

# Part i
# ======
# Adding onto this, let's change the shape. You can put numbers in the shape
#   argument. Experiment with a few of these and then choose one you like (that 
#   is not a filled circle).
plot_i = (
  ggplot(starwars2, aes(x = "height", y = "mass"))
  + geom_point(shape = ) # Put a keyboard symbol (in quotes) after the =
)
# Type plot_i or plot_i.show()

# Part j
# ======
# Let's change the x and y labels now. For the x-axis, change the label to 
#   "Height (cm)" and change the y-axis label to "Mass (kg)"
plot_j = (
  ggplot(starwars2, aes(x = "height", y = "mass"))
  + geom_point()
  + labs() # Change the x and y axis labels
)
# Type plot_j or plot_j.show()

# Part k
# ======
# Now copy and paste the code from part j and add a title. You can do this by
#   either putting title = in the labs() function or adding on the ggtitle()
#   function. Name this plot_k instead of plot_j.


# Part l
# ======
# It is time to change the font size. In the follow code, copy and 
#   paste the code from part k so that it has the proper labels and title. Then,
#   the way this is set up, the text size for the axis labels will be increased
#   to size 14. Change also the text size for the title to size 18.
plot_l = (
  ggplot(starwars2, aes(x = "height", y = "mass"))
  + geom_point() +
  # Put labs() function here. Put a + before it
  + theme(axis_title = element_text(size = 14))
)
# Type plot_l or plot_l.show()

# Part m
# ======
# Finally, copy and paste your plot from part l. Go ahead and add the line of 
#   best fit to this plot with geom_smooth(method = "lm"). By default, 
#   confidence interval bands will also be shown. You can remove them using 
#   se = False. Feel free to change the color of the line as well.  
