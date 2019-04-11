Tidying data
================

## Exercise

``` r
library(MASS)
library(tidyverse)
tidypaint <- painters %>% 
  rownames_to_column("Name") %>% 
  gather(key = "Skill", value = "Score", -Name, -School)
```
