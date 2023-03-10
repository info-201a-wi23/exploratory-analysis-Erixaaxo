kidz_bop_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)

library("dplyr")
total_words_censored <- sum(kidz_bop_df$count, na.rm = T)
most_censored_word <- kidz_bop_df %>% group_by(badword) %>% summarise(count = sum(count)) %>% filter(count == max(count)) %>% pull(badword)
most_censored_category <- kidz_bop_df %>% group_by(category) %>% summarise(count = sum(count)) %>% filter(count == max(count)) %>% pull(category)
most_censored_year <- kidz_bop_df %>% group_by(year) %>% summarise(count = sum(count)) %>% filter(count == max(count)) %>% pull(year)
least_censored_year <- kidz_bop_df %>% group_by(year) %>% summarise(count = sum(count)) %>% filter(count == min(count)) %>% pull(year)

