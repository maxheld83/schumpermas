# Preambs =====================================================================
library(digest)
# Reading in data =============================================================
concourse <- read.csv(  # hard-coded data should always be in csv
	"keyneson-concourse/en.csv",  # use git submodules to point to diff. versions
	header = TRUE,  # should have item_id, item_full, and item_short columns
	colClasses = c("item_full" = "character"),  #  these are strings, not factors.
	row.names = NULL   # there are no 'cases' here
)
sampling_structure <- read.csv(
	"keyneson-sample/sampling-structure.csv",
	header = TRUE,
	row.names = NULL  # again, there no 'cases' here
)
# Make identifier for concourse (beta status!) ================================
concourse$item_hash <- lapply(concourse$item_full, digest, algo = "crc32")
# Verifying data ==============================================================
if (any(duplicated(concourse$item_short))) {
	stop("There are duplicate entries in 'concourse$item_short'.")
}
if (any(duplicated(concourse$item_hash))) {
	stop("There are duplicate entries in 'concourse$item_hash'.")
}
if (any(duplicated(concourse$item_id))) {
	stop("There are duplicate entries in 'concourse$item_id'.")
}
if (any(duplicated(concourse$item_full))) {
	stop("There are duplicate entries in 'concourse$item_full'.")
}
if (any(duplicated(sampling_structure$item_short))) {
	stop("There are duplicate entries in 'sampling_structure$item_short'.")
}  # notice that the rest of 'sampling_structure' *can* have duplicates!
if (any(!sampling_structure$item_short %in% concourse$item_short)) {
	stop("Item(s) from sampling structure could not be found in concourse.")
}
# Actual sampling ============================================================
qsample <- concourse[concourse$item_short %in% sampling_structure$item_short, ]
