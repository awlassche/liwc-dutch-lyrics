install.packages('ggfortify')
library('ggfortify')
df2 <- read.csv('/Users/alielassche/documents/github/cultural-analytics/songlyrics/negpos.csv', header = TRUE, row.names = 'Artist', sep = ';')
autoplot(prcomp(df2), loadings = TRUE, label = TRUE, label.size = 3, shape = FALSE, loadings.label = TRUE, loadings.label.size = 3, loadings.colour = 'blue')
