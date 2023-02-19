
kidz_bop_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)

library("dplyr")
library("stringr")
View(kidz_bop_df)

# Created a new DF with the desired columns and summarized count column
KB_our_df <- kidz_bop_df %>% group_by(badword, ogArtist,songName category, year) %>% summarize(total_count = sum(count))
View(KB_our_df)
# Made a variable for how many rows in the new df
num_categories <- nrow(kidz_bop_df)

# Created a separate dataframe to count up how many times the categories
category_count <- data.frame(Kidz_bop_df$category)
category_count <- kidz_bop_df %>% count(category)
category_count <- category_count %>% mutate(category_prop = n / num_categories)
View(category_count)

# Created the final table df by joining the category_count df and t KB_data_df together, renamed and reordered the columns
summary_table <- left_join(KB_data_df, category_count, by= "category")
colnames(summary_table)[6] = "category_count"
summary_table <- summary_table[,c("badword", "ogArtist", "total_count", "year", "category", "category_count", "category_prop")]
View(summary_table)

