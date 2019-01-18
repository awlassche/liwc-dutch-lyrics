install.packages("tm") #text mining
install.packages("SnowballC") #text stemming
install.packages("wordcloud") #word-cloud generator
install.packages("RColorBrewer") #color palettes
install.packages("NLP")
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

file <- "/Users/alielassche/documents/github/cultural-analytics/proposal.txt"
text <- readLines(file)
print(text)
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, content_transformer(removeNumbers))
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

print(v)
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col =brewer.pal(8, "Dark2"), main ="Most frequent words",
        ylab = "Word frequencies")
