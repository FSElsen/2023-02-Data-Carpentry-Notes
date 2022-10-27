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
## split data into groups, apply some analysis to each group, combine the results
## example using the group_by() and summarize() functions from dplyr:
interviews %>% 
  group_by(village) %>% # use a categorical variable to group the data
  summarize(mean_no_membrs = mean(no_membrs)) # compute the average household
## group by multiple columns:
interviews %>% 
  group_by(village, memb_assoc) %>% # group by village AND memb_assoc
  summarize(mean_no_membrs = mean(no_membrs)) %>% 
  ungroup()

## after grouping, it is also possible to summarize multiple values
interviews %>% 
  filter(!is.na(memb_assoc)) %>% # filter out memb_assoc = NA / missing
  group_by(village, memb_assoc) %>% # group by village AND memb_assoc
  summarize(mean_no_membrs = mean(no_membrs), # first we summarize the mean no. of members, then place a comma
            min_membrs = min(no_membrs)) %>% # next, we summarize the minimum household size
  arrange(min_membrs) # rearrange output by min_membrs using arrange()

## we can use the count() function to count the number of observations for certain factors
interviews %>% 
  count(village, sort = TRUE) # count the number of rows per village
# sort will five results in decreasing order

## Exercise solution
interviews %>%
  count(no_meals)

interviews %>% 
  group_by(village) %>% 
  summarize(
    mean_no_membrs = mean(no_membrs),
    min_no_membrs = min(no_membrs),
    max_no_membrs = max(no_membrs),
    n = n()
  )

#### Reshaping with pivot_wider() and pivot_longer() ####
## Rules of tidy datasets:
## 1. Each variable has its own column
## 2. Each observation has its own row
## 3. Each value must have its own cell

interviews_wide <- interviews %>% 
  mutate(wall_type_logical = TRUE) %>% # we create a dummy variable wall_type_logical (=TRUE)
  pivot_wider(names_from = respondent_wall_type, # take the names for the new columns from respondent_wall_type
              values_from = wall_type_logical, # take values from dummy variable
              values_fill = list(wall_type_logical = FALSE)) # fill remainder of the wall type columns with FALSE

# from wide to long again, we use pivot_longer
interviews_long <- interviews_wide %>% 
  pivot_longer(cols = c(muddaub, cement, sunbricks, burntbricks),
               names_to = "respondent_wall_type",
               values_to = "wall_type_logical")

#### Exporting data ####

interviews_plotting <- interviews %>%
  ## pivot wider by items_owned
  separate_rows(items_owned, sep = ";") %>%
  ## if there were no items listed, changing NA to no_listed_items
  replace_na(list(items_owned = "no_listed_items")) %>%
  mutate(items_owned_logical = TRUE) %>%
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE)) %>%
  ## pivot wider by months_lack_food
  separate_rows(months_lack_food, sep = ";") %>%
  mutate(months_lack_food_logical = TRUE) %>%
  pivot_wider(names_from = months_lack_food,
              values_from = months_lack_food_logical,
              values_fill = list(months_lack_food_logical = FALSE)) %>%
  ## add some summary columns
  mutate(number_months_lack_food = rowSums(select(., Jan:May))) %>%
  mutate(number_items = rowSums(select(., bicycle:car)))







