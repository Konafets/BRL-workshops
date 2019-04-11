# Tidyverse

# Subsetting

reprex({#+ eval = FALSE
filter(mtcars, mpg > 30)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    filter(mpg > 30)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars[mtcars$mpg > 25, ]}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    slice(5:7)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    sample_n(4)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    select(mpg, hp)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    arrange(mpg)}, venue = "rtf")

reprex({#+ eval = FALSE
  mtcars %>%
    select(mpg:am, carb, gear)}, venue = "rtf")

# Transforming

reprex({#+ eval = FALSE
  iris %>%
    rename(sepal_length = Sepal.Length)}, venue = "rtf")

reprex({#+ eval = FALSE
  df %>%
    mutate(GDP = GDP/1000)}, venue = "rtf")

reprex({#+ eval = FALSE
  df %>%
    mutate(GDPNEW = GDP/1000)}, venue = "rtf")

reprex({#+ eval = FALSE
  iris %>%
    mutate(SLgroup = if_else(Sepal.Length > mean(Sepal.Length),
                             "high", "low"))}, venue = "rtf")

df <- data.frame(temp = rnorm(100, 60, 15))

reprex({#+ eval = FALSE
  df %>% mutate(temp_group =
                case_when(
                  temp < 32 ~ "freezing",
                  temp < 50 ~ "cold",
                  temp < 65 ~ "cool",
                  temp < 75 ~ "nice",
                  temp < 85 ~ "warm",
                  TRUE ~ "hot"
                  )
                )}, venue = "rtf")

# Summarizing

reprex({#+ eval = FALSE
  summary(iris)}, venue = "rtf")

reprex({skimr::skim(iris)}, venue = "rtf")

reprex({
  library(tidyverse)
  iris %>%
    group_by(Species) %>%
    summarize(SLmean = mean(Sepal.Length))}, venue = "rtf")

reprex({
  library(tidyverse)
  iris %>%
    group_by(Species) %>%
    summarize(SLmean = mean(Sepal.Length)) %>%
    arrange(desc(SLmean))}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(gear, am) %>%
    summarize(mean_mpg = mean(mpg))}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(gear, am) %>%
    summarize(mean_mpg = mean(mpg)) %>%
    ungroup() %>%
    complete(gear, am)}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(gear) %>%
    summarize(count = n()) %>%
    mutate(percent = count/sum(count))}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(gear, am) %>%
    summarize(count = n()) %>%
    mutate(percent = count/sum(count))}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(am, gear) %>%
    summarize(count = n()) %>%
    mutate(percent = count/sum(count))}, venue = "rtf")

mutate(percent = count/sum(count))}, venue = "rtf")

reprex({
  library(tidyverse)
  mtcars %>%
    group_by(gear, am) %>%
    summarize(count = n()) %>%
    ungroup() %>%
    mutate(percent = count/sum(count))}, venue = "rtf")

# Tidying

reprex(head(mtcars), venue = "rtf")

reprex({library(tidyverse)
  mtcars <- mtcars %>%
    rownames_to_column("carname")}, venue = "rtf")
