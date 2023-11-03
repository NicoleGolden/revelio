
#------------------------ 1. Prep

# load package & theme 
source("_config/config.R")

# load data
text <- read.table("data/data.txt",
                   sep =",",
                   fill = T, 
                   header = F)

# check data
head(text)
dim(text)

#------------------------ 2. Data Cleaning

# paste text
text <- paste(text, collapse = " ")

# Remove slashes
text <- str_replace_all(text, pattern = '\"', replacement = "") 

# Remove \n
text <- str_replace_all(text, pattern = '\n', replacement = "") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0092', replacement = "'") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0091', replacement = "'") 

# make it to tibble data format (neater data frame)
text_df <- data_frame(Text = text) 

# text: unnest_tokens
text_words <- text_df %>% 
  unnest_tokens(output = word, input = Text) 

# load stop words 
data(stop_words)

# Remove stop words
text_words  <- 
  text_words  %>%
  anti_join(stop_words) 

# save data
# after change plural nouns to singular noun
fwrite(text_words, 
       "cache/text_words.csv",
       row.names = F)

# load modified data
text_words <- fread("cache/text_words2.csv")

# count words
text_words <- 
  text_words  %>% 
  count(word, sort = TRUE)

# check data 
head(text_words,10)
dim(text_words)

#------------------------ 3. Table: 

# Most Frequently Used Words (at least 3 times)

# rank text count 
text_greater3 <- 
  text_words %>% 
  filter(n >= 3) %>% 
  mutate(word = reorder(word,n))

# check dim
dim(text_greater3)

# save data 
fwrite(text_greater3,
       "cache/text_greater3.csv", 
       row.names = F)

#------------------------ 4. Figure

# Most Frequently Used Words (at least three times)

# plot
p1 <- ggplot(data = text_greater3, 
       aes(word, n)) + 
  geom_col(fill="#5a677f") +
  coord_flip() +
  labs(x = "Keywords", 
       y = "\n Count") +
  scale_y_continuous(breaks = seq(from = 0, 
                                  to = 80, 
                                  by = 5)) + 
  theme

# display figure
p1

# save 
ggsave("figure/revelio_text_greater3.png",
       p1,
       width = 15, 
       height = 10,
       dpi = 1000)

