
kidz_bop_df <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)

library("dplyr")
library("stringr")


# Created a new DF with the top 10 most censored words using the total_count column

new_df <- kidz_bop_df  %>% group_by(badword, category) %>% summarize(total_count = sum(count))
new_df <- new_df %>% group_by(badword, category, total_count) %>% filter(total_count >= 74) %>% arrange(-total_count)

# Made a variable for how may rows in the original kidz_bop_df
num_categories <- nrow(kidz_bop_df)

# Created a separate data frame to count up the proportion each category makes up of the total entries in the original df
category_count <- data.frame(kidz_bop_df$category)
category_count <- kidz_bop_df %>% count(category)
category_count <- category_count %>% mutate(category_prop = n / num_categories)


# Created the final table df by joining the category_count df and new_df, renamed and reordered the columns
summary_table <- left_join(new_df, category_count, by= "category")
colnames(summary_table)[4] = "category_count"
summary_table <- summary_table[,c("badword", "category", "total_count","category_count", "category_prop")]


