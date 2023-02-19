library("dplyr")
library("ggplot2")
library("stringr")

kb_data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_group-overiew.csv", stringsAsFactors = FALSE)

ggplot(data = kb_data, mapping = aes(x = category, y = pctCensored)) +
  geom_point() +
  


