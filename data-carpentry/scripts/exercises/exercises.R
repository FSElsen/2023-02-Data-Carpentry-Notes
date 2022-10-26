##################################################################################
#
#                 Data Carpentry for Social Sciences 
#                       & Humanities workshop
#               
#                             Exercises 
#
##################################################################################


# Introduction to R --------------------------------------------------------------

# Exercise 1 ----  

# Create two variables r_length and r_width 
# and assign them values. It should be noted that, 
# because length is a built-in R function, 
# R Studio might add “()” after you type length and 
# if you leave the parentheses you will get unexpected results. 
# This is why you might see other programmers abbreviate common words. 
# Create a third variable r_area and give it a value based 
# on the current values of r_length and r_width. 
# Show that changing the values of either r_length and r_width 
# does not affect the value of r_area.

# Your code here: 




# For solution go here :
# https://datacarpentry.org/r-socialsci/01-intro-to-r/index.html#solution-1


# Exercise 2 ----

# Type in ?round at the console and then look at the output in the Help pane.
# What other functions exist that are similar to round? 
# How do you use the digits parameter in the round function?

# Your code here: 




# Exercise 3 ----

# What will happen in each of these examples? 
# (hint: use class() to check the data type of your objects):

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

# Why do you think it happens?

# Your code here: 




# For solution go here :
# https://datacarpentry.org/r-socialsci/01-intro-to-r/index.html#solution-3


# Exercise 4 ----

# How many values in combined_logical are "TRUE" (as a character)
# in the following example:

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

# Your code here: 




# For solution go here :
# https://datacarpentry.org/r-socialsci/01-intro-to-r/index.html#solution-4


# Exercise 5 ----

# 1. Using the vector of rooms defined below, create a new vector with the NAs removed.
# 2. Use the function median() to calculate the median of the rooms vector.
# 3. Use R to figure out how many households in the set use more than 
#    2 rooms for sleeping.

rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)

# Your code here: 




# For solution go here :
# https://datacarpentry.org/r-socialsci/01-intro-to-r/index.html#solution-5




# Starting with data ------------------------------------------------------

# Exercise 6 ----

# 1. Create a tibble (data frame) interviews_100 
#    containing only the data in row 100 of the interviews dataset.

# 2. Notice how nrow() gave you the number of rows in the tibble?
#     - Use that number to pull out just that last row in the tibble.
#     - Compare that with what you see as the last row using tail() 
#       to make sure it’s meeting expectations.
#     - Pull out that last row using nrow() instead of the row number.
#     - Create a new tibble (interviews_last) from that last row.

# 3. Using the number of rows in the interviews dataset that you 
#    found in question 2, extract the row that is in the middle
#    of the dataset. Store the content of this middle row in an object named
#    interviews_middle. 
#    (hint: This dataset has an odd number of rows, so finding the middle 
#    is a bit trickier than dividing n_rows by 2. 
#    Use the median( ) function and what you’ve learned about sequences in R
#    to extract the middle row!

# 4. Combine nrow() with the '-'
#    notation above to reproduce the behavior of head(interviews), 
#    keeping just the first through 6th rows of the interviews dataset.
                                                                                                                                                                                                                     
                                                                                                                                                                                                                     Combine nrow() with the - notation above to reproduce the behavior of head(interviews), keeping just the first through 6th rows of the interviews dataset.
# Your code here: 




# For solution go here :
# https://datacarpentry.org/r-socialsci/02-starting-with-data/index.html#solution



