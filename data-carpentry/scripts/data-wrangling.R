# for data wrangling we use two R packages that are part of the tidyverse: dplyr and tidyr
# we can load the libraries individually or load the whole tidyverse:
library(tidyverse)
# load the here package
library(here)

## first load the SAFI dataset again

interviews  <- read_csv(here("data/SAFI_clean.csv"), na = "NULL")

## inspect the data
interviews

#### selecting columns and filtering rows ####
select(interviews, village, no_membrs, months_lack_food) # select() function from dplyr to select columns from a dataframe

interviews[c("village", "no_membrs", "months_lack_food")] # select the same columns using subsetting

select(interviews, village:respondent_wall_type) # select a series of connected columns

## select rows based on specific criteria using filter()
filter(interviews, village == "Chirodzo") # filter observations where village name is Chirodzo

filter(interviews, village == "Chirodzo" &
         rooms > 1 &
       no_meals > 2) # filter observations with the "and" operator > output dataframe satisfies ALL specified conditions

## select rows based on an "or" statement (| logical operator), where at least one of the conditions must be met
filter(interviews, village == "Chirodzo" | village == "Ruaca") # filter output that satisfies one of these two criteria

#### Pipes ####

## what if we want to select and filter at the same time?
## we can use multiple steps:
interviews2 <- filter(interviews, village == "Chirodzo") # we make a new dataframe to filter on village
interviews3 <- select(interviews2, village:respondent_wall_type) # next we select a number of columns from this new dataframe

## another option is to nest functions:
interviews3 <- select(filter(interviews, village == "Chirodzo"),
                      village:respondent_wall_type)
## downsides of nesting: difficult to read, 
# need to consider the order (R evaluates from the inside out: here filtering, then selecting)

## recent addition to R are pipes: %>% (part of magrittr package in tidyverse)
## pipes let you take output of one function to the next function
## shortcut: Ctrl + Shift + M and for Mac: Cmd + Shift + M 

interviews3_pipe <- interviews %>% # first we take the dataframe
  filter(village == "Chirodzo") %>% # then we filter on village and send it forward
  select(village:respondent_wall_type) # then we select the columns

## Exercise solution
interviews4 <- interviews %>% 
  filter(memb_assoc == "yes") %>% 
  select(affect_conflicts, liv_count, no_meals)

#### Mutate() ####
## If we want to create new columns based on existing columns, we use mutate()

interviews_avg_room <- interviews %>% 
  mutate(people_per_room = no_membrs / rooms) # average number of people per room

## Question: has being a member of an irrigation association any effect on the average number of people per room?
interviews_avg_room <- interviews %>% 
  filter(!is.na(memb_assoc)) %>% # remove respondents with missing irrigation association data
  mutate(people_per_room = no_membrs / rooms) # new column: average no. of people per room
## some more information on the filter: ! symbol negates the result of the is.na() function:
## if is.na() returns TRUE (because memb_assoc is missing) the ! symbol negates this and says:
## only use values of FALSE where memb_assoc is not missing

## Exercise solution
interviews_total_meals <- interviews %>% 
  mutate(total_meals = no_membrs * no_meals) %>% 
  filter(total_meals > 20) %>% 
  select(village, total_meals)

#### Split-apply-combine data analysis and the summarize() function ####


