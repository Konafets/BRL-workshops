# Save reprex code as regular R code

readLines("../slides/reprexcode.R") %>%
  str_replace_all("reprex\\(\\{", "")  %>%
  str_replace_all("#\\+ eval = FALSE", "")  %>%
  str_replace_all('\\}, venue = "rtf"\\)' , "") %>%
  str_replace_all("    ", "Z") %>%
  str_replace_all("  ", "") %>%
  str_replace_all("Z", "  ") %>%
  writeLines("slidecode.R")

