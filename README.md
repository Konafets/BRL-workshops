# BRL-workshops

Materials for BRL workshops

### Workshop 1: Visual Techniques for Exploratory Data Analysis in R (with ggplot2)

When: Tuesday, April 2, 2019, 5:30 - 8:00pm

Where: Warren 309  

* Introduction to the grammar of graphics [Why R?](slides/1-WhyR.pdf) [Grammar of Graphics](slides/2-GrammarofGraphics.pdf)

* Single and multi-dimensional continuous data

[Histograms](slides/3-Histograms.pdf)  [lab](labs/1-Histogram.Rmd) [solutions](solutions/1-Histogram-Solutions.md)

* Single and multi-dimensional categorical data

* Combining continuous and categorical data with faceting

* Introduction to tidying data (to be continued in second workshop)

### Workshop 2: Data Transformation Techniques in R (with dplyr and tidyr)

When: Tuesday, April 11, 2019, 5:30 - 8:00pm

Where: Warren 415

* Introduction to the tidyverse philosophy, comparison to base R

* The "main five" dplyr verbs: filter, select, arrange, group_by, summarize

* Piping in R

* Tidying data with tidyr

* Merging datasets with join functions


### Pre-Workshop Assignment


Before your first workshop, please do the following:

1. Install R from https://cran.r-project.org/

2. Install RStudio Desktop (open source / free version) from https://www.rstudio.com/products/rstudio/download/#download

3. Install [tidyverse](https://www.tidyverse.org/) packages with:

```
> install.packages("tidyverse")
```

I will do my best to accommodate different skill levels, however I will assume a general familiarity of base R. If you haven't used R at all previously, I recommend [DataCamp's free Introduction to R course](https://www.datacamp.com/courses/free-introduction-to-r). For our purposes, you can skip the matrices and lists chapters, and the ordered factors section of the factors chapter. 

For book people (like me!) I recommend the "R Nuts and Bolts" chapter of  Roger Peng's [R Programming for Data Science](https://leanpub.com/rprogramming). If you are limited in time, the most important topics to learn / review are: character vs. factor data, and working with data frames. Again, matrices and lists won't come up.

If you're new to ggplot2, please read ["Data Visualization"](https://r4ds.had.co.nz/data-visualisation.html) in R for Data Science by Garrett Grolemund and Hadley Wickham to gain a general familiarity with ggplot2 functions.
