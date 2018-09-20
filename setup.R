# knitr options ====
knitr::opts_chunk$set(
  tidy = TRUE,   # tidy formats code nicely in echo
  cache = TRUE,
  echo = FALSE,
  message = FALSE
)
options(digits = 2)  # display only 2 digits in knitr output
options(scipen = 999)
options(knitr.kable.NA = '')


# dependencies ====
library(qmethod)
library(tidyverse)
# automatically create a bib database for R packages
knitr::write_bib(
  x = c(
    .packages(),
    'bookdown',
    'knitr',
    'rmarkdown'
  ),
  file = 'packages.bib'
)
