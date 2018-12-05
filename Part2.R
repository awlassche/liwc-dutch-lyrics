install.packages("tm") #text mining
install.packages("SnowballC") #text stemming
install.packages("wordcloud") #word-cloud generator
install.packages("RColorBrewer") #color palettes

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

file <- "/Users/alielassche/documents/github/cultural-analytics/shakespear%20100%20works.txt"
text <- readLines(file)
print(text)
text <- text[-(1:173)]
text <- text[-(124195:length(text))]
text <- paste(text, collapse = "")
print(text)
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, content_transformer(removeNumbers))
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))
print(text)
docs <- tm_map(docs, content_transformer(removeNumbers))
docs <- tm_map(docs, content_transformer(tolower))

print(d)
freq <- findFreqTerms(dtm, lowfreq = 5000)
print(freq)
freq2 <- findFreqTerms(dtm, lowfreq = 1000)

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col =brewer.pal(8, "Dark2"), main ="Most frequent words",
        ylab = "Word frequencies")

wordcloud(docs, max.words = 50, random.order = TRUE, colors = brewer.pal(8, "Dark2"))
