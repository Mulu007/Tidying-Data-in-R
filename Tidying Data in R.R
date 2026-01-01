library(tidyverse)

billboard <- read.csv("billboard.csv", header = TRUE)
billboard <- as_tibble(billboard)
billboard

#gather
billboard %>% gather(x1st.week:x76th.week, key = "week", value = "rank", na.rm = T) %>%
  arrange(artist.inverted)

tb <-read.csv("tb.csv", header = TRUE)
tb <- as_tibble(tb)
tb

tb.gathered <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = T) %>%
  arrange(country)
tb.gathered

tb.separated <- tb.gathered %>% separate(column, into = c("sex", "age"), sep = ".")
tb.separated

tb.separated$age <- str_replace_all(tb.separated$age, "0", "0-")
tb.separated$age <- str_replace_all(tb.separated$age, "15", "15-")
tb.separated$age <- str_replace_all(tb.separated$age, "25", "25-")
tb.separated$age <- str_replace_all(tb.separated$age, "35", "35-")
tb.separated$age <- str_replace_all(tb.separated$age, "45", "45-")
tb.separated$age <- str_replace_all(tb.separated$age, "55", "55-")
tb.separated$age <- str_replace_all(tb.separated$age, "65", "65-100")

tb.separated

tb.separated <- tb.separated %>% separate(age, into = c("age.low", "age.high"))
tb.separated

tb.united <- tb.separated %>% unite("age.new", c("age.low", "age.high"))
tb.united

weather <- read.csv("weather.csv", header = TRUE)
weather <- as.tibble(weather)
weather

weather.spread <- spread(weather, key = element, value = value)
weather.spread
