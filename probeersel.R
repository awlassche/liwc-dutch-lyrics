

id <- c("Marie", "Joan", "Liam")
link <- c("link1", "link2", "link3")
tweet <- c("Enjoying the beautiful weather with @Joan!", "Currently taking UDS with @Liam", "Happy birthday @Marie!")
mention <- c("Joan", "Liam", "Marie")
tweets <- data.frame(id, link, tweet, mention)
print(tweets$link)

