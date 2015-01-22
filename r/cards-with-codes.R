# Make some cards ===============
make.cards(
  q.set = q.set,
  study.language = "german",
  manual.lookup = na.omit(
    as.matrix(
      read.csv(
        "keyneson/keyneson-sample/keyneson-concourse/ids.csv",
        row.names=2
      )
    )[,2]
  ),
  paper.format = "AveryZweckformC32010",
  output.pdf = TRUE
)
