library("dplyr")
library("ggplot2")
library("stringr")

# Reading CSV file
kidz_bop_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)


# Grouping Bad Words with Category
bad_words_per_category <- kidz_bop_df %>% group_by(category) %>% summarize(bad_words_per_category = sum(count, na.rm = T))



# Creating Graph
ggplot(data = bad_words_per_category, aes(x = category, y = bad_words_per_category)) +
  geom_bar(stat = "identity")

