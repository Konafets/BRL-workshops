# Tidyverse

# Subsetting


filter(mtcars, mpg > 30)


mtcars %>%
  filter(mpg > 30)


mtcars[mtcars$mpg > 25, ]


mtcars %>%
  slice(5:7)


mtcars %>%
  sample_n(4)


mtcars %>%
  select(mpg, hp)


mtcars %>%
  arrange(mpg)


mtcars %>%
  select(mpg:am, carb, gear)

# Transforming


iris %>%
  rename(sepal_length = Sepal.Length)


df %>%
  mutate(GDP = GDP/1000)


df %>%
  mutate(GDPNEW = GDP/1000)


iris %>%
  mutate(SLgroup = if_else(Sepal.Length > mean(Sepal.Length),
               "high", "low"))

df <- data.frame(temp = rnorm(100, 60, 15))


df %>% mutate(temp_group =
        case_when(
        temp < 32 ~ "freezing",
        temp < 50 ~ "cold",
        temp < 65 ~ "cool",
        temp < 75 ~ "nice",
        temp < 85 ~ "warm",
        TRUE ~ "hot"
        )
        )

# Summarizing


summary(iris)

skimr::skim(iris)


library(tidyverse)
iris %>%
  group_by(Species) %>%
  summarize(SLmean = mean(Sepal.Length))


library(tidyverse)
iris %>%
  group_by(Species) %>%
  summarize(SLmean = mean(Sepal.Length)) %>%
  arrange(desc(SLmean))


library(tidyverse)
mtcars %>%
  group_by(gear, am) %>%
  summarize(mean_mpg = mean(mpg))


library(tidyverse)
mtcars %>%
  group_by(gear, am) %>%
  summarize(mean_mpg = mean(mpg)) %>%
  ungroup() %>%
  complete(gear, am)


library(tidyverse)
mtcars %>%
  group_by(gear) %>%
  summarize(count = n()) %>%
  mutate(percent = count/sum(count))


library(tidyverse)
mtcars %>%
  group_by(gear, am) %>%
  summarize(count = n()) %>%
  mutate(percent = count/sum(count))


library(tidyverse)
mtcars %>%
  group_by(am, gear) %>%
  summarize(count = n()) %>%
  mutate(percent = count/sum(count))

mutate(percent = count/sum(count))


library(tidyverse)
mtcars %>%
  group_by(gear, am) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  mutate(percent = count/sum(count))

# Tidying

reprex(head(mtcars), venue = "rtf")

library(tidyverse)
mtcars <- mtcars %>%
  rownames_to_column("carname")
