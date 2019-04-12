-   [Functions](#functions)
-   [Messy vs. tidy](#messy-vs.tidy)
-   [Heads up](#heads-up)
    -   [Gathering the `id` column](#gathering-the-id-column)
    -   [Missing *id* column](#missing-id-column)
    -   [Leaving out `key` and `value`](#leaving-out-key-and-value)
-   [Exercise](#exercise)
-   [`gather() + spread()`](#gather-spread)
-   [Number of 1, 2, 3, 4, 5s per
    person](#number-of-1-2-3-4-5s-per-person)

Functions
---------

`gather()` `spread()`

Online tutorial:
<https://github.com/jtr13/codehelp/blob/master/R/gather.md>

Messy vs. tidy
--------------

    library(tidyverse)
    messydata <- tibble(id = c("car1", "car2", "car3"),
                        city = c(19, 20, 29),
                        hwy = c(24, 30, 35))
    messydata

    ## # A tibble: 3 x 3
    ##   id     city   hwy
    ##   <chr> <dbl> <dbl>
    ## 1 car1     19    24
    ## 2 car2     20    30
    ## 3 car3     29    35

    tidydata <- messydata %>% 
      gather(key = "roadtype",
             value = "mpg", 
             -id)
    tidydata

    ## # A tibble: 6 x 3
    ##   id    roadtype   mpg
    ##   <chr> <chr>    <dbl>
    ## 1 car1  city        19
    ## 2 car2  city        20
    ## 3 car3  city        29
    ## 4 car1  hwy         24
    ## 5 car2  hwy         30
    ## 6 car3  hwy         35

Heads up
--------

There are a few problems I’ve seen with the way in which people use
`gather()`:

### Gathering the `id` column

    messydata %>% 
      gather(key = "roadtype",
             value = "mpg")

    ## # A tibble: 9 x 2
    ##   roadtype mpg  
    ##   <chr>    <chr>
    ## 1 id       car1 
    ## 2 id       car2 
    ## 3 id       car3 
    ## 4 city     19   
    ## 5 city     20   
    ## 6 city     29   
    ## 7 hwy      24   
    ## 8 hwy      30   
    ## 9 hwy      35

### Missing *id* column

    messy2 <- messydata %>% select("city", "hwy")
    messy2

    ## # A tibble: 3 x 2
    ##    city   hwy
    ##   <dbl> <dbl>
    ## 1    19    24
    ## 2    20    30
    ## 3    29    35

    messy2 %>% 
      gather(key = "roadtype", 
             value = "mpg")

    ## # A tibble: 6 x 2
    ##   roadtype   mpg
    ##   <chr>    <dbl>
    ## 1 city        19
    ## 2 city        20
    ## 3 city        29
    ## 4 hwy         24
    ## 5 hwy         30
    ## 6 hwy         35

How to fix: add an `id` column:

    messy2 %>% rownames_to_column("id") %>% 
      gather(key, value, -id)

    ## # A tibble: 6 x 3
    ##   id    key   value
    ##   <chr> <chr> <dbl>
    ## 1 1     city     19
    ## 2 2     city     20
    ## 3 3     city     29
    ## 4 1     hwy      24
    ## 5 2     hwy      30
    ## 6 3     hwy      35

### Leaving out `key` and `value`

    messydata %>% 
      gather(-id)

    ## Must supply a symbol or a string as argument

    messydata %>% 
      gather(key, value, -id)

    ## # A tibble: 6 x 3
    ##   id    key   value
    ##   <chr> <chr> <dbl>
    ## 1 car1  city     19
    ## 2 car2  city     20
    ## 3 car3  city     29
    ## 4 car1  hwy      24
    ## 5 car2  hwy      30
    ## 6 car3  hwy      35

Exercise
--------

Tidy the `painters` dataset. It is available in the **MASS** package as
well as in the `data` folder.

    library(MASS)
    head(painters)

    ##               Composition Drawing Colour Expression School
    ## Da Udine               10       8     16          3      A
    ## Da Vinci               15      16      4         14      A
    ## Del Piombo              8      13     16          7      A
    ## Del Sarto              12      16      9          8      A
    ## Fr. Penni               0      15      8          0      A
    ## Guilio Romano          15      16      4         14      A

`gather() + spread()`
---------------------

Likert data: 25 people and their responses to Q1-Q10

    df <- read_csv("../data/likert.csv")
    df

    ## # A tibble: 25 x 11
    ##    Name        Q1    Q2    Q3    Q4    Q5    Q6    Q7    Q8    Q9   Q10
    ##    <chr>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1 Michael      4     3     2     4     4     3     4     4     5     4
    ##  2 Jonathan     3     1     4     5     2     2     4     5     5     2
    ##  3 Leah         5     5     3     2     5     5     4     2     5     5
    ##  4 Adam         4     3     2     4     3     3     2     3     4     3
    ##  5 Joe          4     4     4     5     3     3     4     5     3     4
    ##  6 Richard      4     2     5     3     3     3     3     4     3     3
    ##  7 Jasmine      4     3     3     2     4     4     4     2     3     3
    ##  8 Austin       3     2     4     3     2     4     3     2     2     3
    ##  9 Victor       4     4     2     2     4     3     4     3     3     3
    ## 10 Faith        4     2     4     5     4     2     3     4     4     4
    ## # … with 15 more rows

Number of 1, 2, 3, 4, 5s per person
===================================

    df %>%
      gather(key = "Question", value = "Response", -Name) %>% 
      group_by(Name, Response) %>% 
      summarize(Count = n()) %>% 
      mutate(Response = paste0("Count", Response)) %>% # so column names aren't numbers
      spread(key = "Response", value = "Count")

    ## # A tibble: 23 x 6
    ## # Groups:   Name [23]
    ##    Name       Count1 Count2 Count3 Count4 Count5
    ##    <chr>       <int>  <int>  <int>  <int>  <int>
    ##  1 Adam           NA      2      5      3     NA
    ##  2 Alexander      NA     NA     NA     NA     10
    ##  3 Amelia         NA      5      2      1      2
    ##  4 Austin         NA      4      4      2     NA
    ##  5 Bernadette     NA      2      1      7     NA
    ##  6 Colin          NA      1      3      6     NA
    ##  7 David           1      1      5      3     NA
    ##  8 Ella           NA     NA      2      5      3
    ##  9 Faith          NA      2      1      6      1
    ## 10 James          NA      1      1     NA      8
    ## # … with 13 more rows
