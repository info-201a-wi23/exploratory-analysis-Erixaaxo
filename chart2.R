
# Runs the code to make the table from the file table.R
kidz_bop_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)
library("dplyr")

number_of_censors <- kidz_bop_df %>% group_by(year) %>% summarise(count = sum(count))

library(ggplot2)
ggplot() +
  geom_line(aes(x=number_of_censors$year, y = number_of_censors$count))

