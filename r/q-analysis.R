source("q-sampling.R")
source("qmethod/R/import.qcsv.R")
library(psych)
library(qmethod) # canonical version
qsorts <- import.qcsv("keyneson-data/", qsample) #  build array from csvs
analysis <- qmethod(qsorts[,,"before"], nfactors = 2, forced = TRUE)
