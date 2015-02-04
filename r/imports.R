# Preambs
setwd("/Users/Max/Github/schumpermas")
install.packages(c("qmethod"), repos = NULL, type="source")
library(qmethod)
q.concourse <- import.q.concourse(  # import concourse
  q.concourse.dir = "keyneson/keyneson-sample/keyneson-concourse/",
  languages = c("english", "german")
)
q.distribution <- as.integer(c(  # set up distribution
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
q.sampling.structure <- read.csv(  # read in sampling structure
  file = "keyneson/keyneson-sample/sampling-structure.csv"
)
q.sample <- q.sampling.structure$handle  # extract vector of sel. handles
q.set <- build.q.set( #  build q.set
  q.concourse = q.concourse,
  q.sample = q.sample,
  q.distribution = q.distribution
)
q.sorts <- import.q.sorts(  # now import the sorts
  q.sorts.dir = "keyneson/qsorts/",
  q.set = q.set,
  q.distribution = q.distribution,
  conditions = c("before","after"),
  manual.lookup = as.matrix(
    read.csv(
      "keyneson/keyneson-sample/keyneson-concourse/ids.csv",
      row.names=2
    )
  )
)
kicked.out.part <- c(
  "Wolfgang",  # this is the researcher
  "Uwe",  # incomplete
  "Claus"  # incomplete
)
q.sorts <- q.sorts[,!colnames(q.sorts) %in% kicked.out.part,]  # delete participants
q.feedback <- import.q.feedback(
  q.feedback.dir = "keyneson/feedback/",
  q.sorts = q.sorts,
  q.set = q.set,
  manual.lookup = as.matrix(
    read.csv(
      "keyneson/keyneson-sample/keyneson-concourse/ids.csv",
      row.names=2
    )
  )
)
keyneson <- list("before"=c(), "after"=c())
keyneson$before <- qmethod(
  dataset = q.sorts[,,"before"],
  nfactors = 3,
  rotation = "varimax",
  forced = TRUE
)
