library(ggplot2)
str(results$before$zsc)
wordle <- function(){}
# y axis isn't really meaningful, so hide it
ggplot(results$before$zsc, aes(x=zsc_f1, y=0, label=rownames(results$before$zsc), position="stack")) + geom_text() + scale_y_continuous(name = "", breaks = NULL)
ggplot(results$before$zsc, aes(x=zsc_f1, y=2, label=rownames(results$before$zsc))) + geom_text(position="stack")
help(geom_text)

ggplot(results$before$zsc_n, aes(x=fsc_f1, label=rownames(results$before$zsc_n))) + geom_bar(position="stack")
