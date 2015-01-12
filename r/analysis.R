# Preambs
setwd("/Users/Max/Github/schumpermas")
install.packages(c("qmethod"), repos = NULL, type="source")
library(qmethod)
library(xtable)
library(knitr)

# Distribution
q.distribution <- as.integer(c(
	 1, # -7
	 1, # -6
	 2, # -5
	 4, # -4
	 6, # -3
	 9, # -2
	10, # -1
	11, #  0
	10, #  1
	 9, #  2
	 6, #  3
	 4, #  4
	 2, #  5
	 1, #  6
	 1 #  7
))

# Imports
q.sample <- ImportQSample(dir.concourse = "keyneson/keyneson-sample/keyneson-concourse",
									translations = c("german","english"),
									file.ids = "keyneson/keyneson-sample/keyneson-concourse/ids.csv",
									q.distribution = q.distribution,
									file.sample = "keyneson/keyneson-sample/sampling-structure.csv")
q.sorts <- ImportQSorts("keyneson/qsorts", q.sample = q.sample, q.distribution = q.distribution)
q.feedback <- ImportQFeedback(dir.feedback = "keyneson/feedback",
															dir.sorts = "keyneson/qsorts",
															q.sample = q.sample,
															q.distribution <- q.distribution)

results <- NULL
results$before <- qmethod(q.sorts[,,"before"],
	nfactors = 3,
 	rotation = "varimax"
)
