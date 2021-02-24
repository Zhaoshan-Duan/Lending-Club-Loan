
# import packages ---- 
library(pacman)
p_load(tidyverse, data.table, fs, tictoc, lubridate, beepr, naniar)

# import data ----
lending_club_data <- fread("./data/accepted_2007_to_2018Q4.csv")

# subset or the years 2012 - 2014 ---- 
# use issue_d variable to determine year 
# subset year 2012 to 2014 as training data 
lending_club_data_2012_2014 <- lending_club_data %>% 
  mutate(year = year(mdy(issue_d))) %>% 
  filter(year %in% c(2012, 2013, 2014)) %>% 
  select(-id, -member_id)

# subset the year 2015 for the testing data
lending_club_data_2015 <- lending_club_data %>% 
  mutate(year = year(mdy(issue_d))) %>%
  filter(year == 2015) %>% 
  select(-id)


# EDA ---- 

# first try pick one x and make it numeric FICO: i.e score 


# second, take a sample 10% 

sample <- lending_club_data_2012_2014 %>% 
  slice_sample(n=0.1 * nrow(lending_club_data_2012_2014), replace = FALSE) 


# third, incorporte as many numeric as possible (rest of the numerics )

# fourth, look at categorical variables 