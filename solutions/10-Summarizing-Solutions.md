Summarizing data
================

## Exercise

Read in `NYCdogs.csv`

``` r
library(tidyverse)
dogs <- read_csv("../data/NYCdogs.csv", na = "n/a")
```

1.  Write the code to produce this output:

<!-- end list -->

``` r
dogs %>% 
  group_by(borough, spayed_or_neutered) %>% 
  summarize(count = n())
```

    ## # A tibble: 10 x 3
    ## # Groups:   borough [5]
    ##    borough       spayed_or_neutered count
    ##    <chr>         <chr>              <int>
    ##  1 Bronx         No                  3536
    ##  2 Bronx         Yes                 5757
    ##  3 Brooklyn      No                  5085
    ##  4 Brooklyn      Yes                14248
    ##  5 Manhattan     No                  3866
    ##  6 Manhattan     Yes                22163
    ##  7 Queens        No                  4098
    ##  8 Queens        Yes                13408
    ##  9 Staten Island No                  1455
    ## 10 Staten Island Yes                 7926

2.  Write the code to produce this output:

<!-- end list -->

``` r
dogs %>% 
  group_by(borough, spayed_or_neutered) %>% 
  summarize(count = n()) %>% 
  mutate(percent = count/sum(count))
```

    ## # A tibble: 10 x 4
    ## # Groups:   borough [5]
    ##    borough       spayed_or_neutered count percent
    ##    <chr>         <chr>              <int>   <dbl>
    ##  1 Bronx         No                  3536   0.381
    ##  2 Bronx         Yes                 5757   0.619
    ##  3 Brooklyn      No                  5085   0.263
    ##  4 Brooklyn      Yes                14248   0.737
    ##  5 Manhattan     No                  3866   0.149
    ##  6 Manhattan     Yes                22163   0.851
    ##  7 Queens        No                  4098   0.234
    ##  8 Queens        Yes                13408   0.766
    ##  9 Staten Island No                  1455   0.155
    ## 10 Staten Island Yes                 7926   0.845

3.  Write the code to produce this output:

<!-- end list -->

``` r
dogs %>% 
  group_by(borough, spayed_or_neutered) %>% 
  summarize(count = n()) %>% 
  mutate(percent = count/sum(count)) %>% 
  filter(spayed_or_neutered == "Yes") %>% 
  select(borough, percent_spayed = percent)
```

    ## # A tibble: 5 x 2
    ## # Groups:   borough [5]
    ##   borough       percent_spayed
    ##   <chr>                  <dbl>
    ## 1 Bronx                  0.619
    ## 2 Brooklyn               0.737
    ## 3 Manhattan              0.851
    ## 4 Queens                 0.766
    ## 5 Staten Island          0.845
