# this is just some simple code to extract full items from an old table and put them into individual files
allinone <- read.csv("keyneson-concourse/en.csv", header = TRUE)

# create lookup table with all the legacy ids (civicon to be added later)
legacy_ids <- allinone[c(1,2)]
write.csv(legacy_ids,
					file = "keyneson-concourse/legacy_ids.csv",
					quote = FALSE,
					row.names = FALSE
)

# write individual items in own files
for (i in 1:nrow(allinone)) {
	write.table(allinone[i,3],
		file = paste("keyneson-concourse/en/", sub("\\s+$", "", allinone[i,2]), ".tex", sep=""),
		quote = FALSE,
		row.names = FALSE,
		col.names = FALSE
	)
}
