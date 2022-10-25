3 + 5
print("hello world")


# install.packages("tidyverse") # uncomment if tidyverse not installed


# Downloading data 
# download.file("https://ndownloader.figshare.com/files/11492171",
#               "data/SAFI_clean.csv", mode = "wb")

# R as a calculator

3 + 5
12/7
12 * 7
3 ^ 5 # 3 to the power of 5

# Creating objects

area_hectares <- 1.0
area_hectares

# Arithmetic with objects

area_hectares * 2.47

area_hectares <- 2.5

area_hectares * 2.47

area_acres <- area_hectares * 2.47
area_acres

area_hectares <- 50
area_acres

area_hectares * 2.47

# Functions 

sqrt(9)

# Functions with multiple arguments
round(3.1415)
round(3.1415, digits = 0)
round(3.1415, digits = 2)

# ?round # use '?' for documentation

 # dATA TYPES AND VECTORS 

# Vectors 

hh_members <- c(3, 7, 10, 6) # vector of numbers
hh_members


respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks" )
respondent_wall_type


# Adding to a vector
possessions <- c("bicycle", "radio", "television")
possessions

possessions <- c(possessions, "mobile phone")
possessions

possessions <-c("car", possessions)
possessions

# Subsetting vectors

# by Index 
respondent_wall_type

respondent_wall_type[2]
respondent_wall_type[c(3,2)]

# by logical vector
hh_members

hh_members[c(TRUE, FALSE, TRUE, TRUE)]

# by condition

