

id <- c("Marie", "Joan", "Liam")
link <- c("link1", "link2", "link3")
tweet <- c("Enjoying the beautiful weather with @Joan!", "Currently taking UDS with @Liam", "Happy birthday @Marie!")
mention <- c("Joan", "Liam", "Marie")
tweets <- data.frame(id, link, tweet, mention)
print(tweets$link)

print("Hello world")
print(3 * 4)

i <- 1
while(i <= 10){
  print(3 * i)
  i <- i + 1
}

numbers <- c(20, 36, 67, 3, 7, 48)

for(number in numbers){
  print(number * 2)
}

alphabet <- "abcdefghijklmnopqrstuvwxyz"
alphabetSplit <- strsplit(alphabet, 0) #splits alphabet into individual characters using strsplit()
alphabetUpper <- "" #placeholder for uppercase

for(letter in alphabetSplit){
  alphabetUpper <- paste(alphabetUpper, toupper(letter), sep="") #use paste() to concatenate strings, using sep="" as an argument so there are no spaces between. toupper() function is used to transform letter to uppercase
}

print(alphabetUpper) # print result

print(toupper(alphabet))

for(i in seq(1,10)){
  print(paste("3 x", i, "=", 3*i))
}

name <- c("Arya Stark", "Xena", "Kathryn Janeway")
age <- c(17, 37, 39)
relation <- c(FALSE, TRUE, FALSE)
awesomeWomen <- list(names, age, relation)
print(awesomeWomen)

fruitsBasket <- c('orange', 'grapefruit', 'banana', 'apple', 'pear')
print("orange" %in% fruitsBasket)
print("mango" %in% fruitsBasket)
fruitsBasket[1:3]
fruitsBasket <- c(fruitsBasket, 'mango')
print('mango' %in% fruitsBasket)
print(fruitsBasket)
fruitsBasket[6] <- 'durian'
print('durian' %in% fruitsBasket)

fruitsBasket <- c("orange", "grapefruit", "banana", "apple", "pear", "durian")
fruit <- "durian"
indices <- which(fruitsBasket == fruit)
print(indices)
print(fruitsBasket[indices])

name <- c("Arya Stark", "Xena", "Kathryn Janeway")
age <- c(17, 37, 39)
relation <- c(FALSE, TRUE, FALSE)
awesomeWomen <- list(name, age, relation)
awesomeWomen[[1]]
awesomeWomen[[1]][1]
awesomeWomen[[1]][1:2]
universe <- c("GoT", "Xena: Warrior Princess", "ST: Voy")
awesomeWomen <- append(awesomeWomen, list(universe))
awesomeWomen[[1]][1] <- "Sansa Stark"
awesomeWomen[[1]][1]


name <- c("Arya Stark", "Xena", "Kathryn Janeway")
age <- c(17, 37, 39)
relation <- c(FALSE, TRUE, FALSE)
awesomeWomen <- list(name, age, relation)
awesomeWomen2 <- data.frame(name, age, relation)
print(awesomeWomen2)

id <- c("Marie", "Joan", "Liam")
link <- c("link1", "link2", "link3")
tweet <- c("Enjoying the beautiful weather with @Joan!", "Currently taking UDS with @Liam", "Happy birthday @Marie!")
mention <- c("Joan", "Liam", "Marie")
tweets <- data.frame(id, link, tweet, mention)
print(tweets$id[2])
print(tweets$mention[1])

week <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

for(day in week){
  if (day == "Monday" | day == "Wednesday"){
    print(paste(day, ": I ate 1 sandwich for breakfast.", sep=""))
  } else if (day == "Sunday"){
    print(paste(day, ": I ate 2 croissants for breakfast.", sep=""))
  } else{
    print(paste(day, ": I ate 2 sandwiches and a piece of fruit for breakfast.", sep=""))
  }
}

week <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
piecesOfFruit <- 2

for(day in week){
  if (day == "Monday" | day == "Wednesday"){
    print(paste(day, ": I ate 1 sandwich for breakfast.", sep=""))
  } else if (day == "Sunday"){
    print(paste(day, ": I ate 2 croissants for breakfast.", sep=""))
  } else{
    if(piecesOfFruit == 0){
      print(paste(day, ": I ate 2 sandwiches and no fruit. I should buy some apples.", sep=""))
    }
    else{  
      piecesOfFruit <- piecesOfFruit - 1
      print(paste(day, ": I ate 2 sandwiches and a piece of fruit for breakfast.", sep=""))
    }
  }
}

file <- "/Users/alielassche/documents/GitHub/cultural-analytics/AwesomeWomen.csv"
fileDF <- read.csv(file, header=TRUE, sep=";", stringsAsFactors = FALSE)
print(fileDF)
mean(fileDF$Age)
boxplot(fileDF$Age)
quantile(fileDF$Age)

newRow <- c("Cameron", 19, FALSE, "Sarah Connor Chronicles", "Warrior")
newAwesome <- rbind(fileDF, newRow)
print(newAwesome)
newRow2 <- c("Alie", 25, TRUE)
newAwesome <- rbind(newAwesome, newRow2)
print(newAwesome)

write.csv(newAwesome, file = "newAwesomeUS.csv",row.names=TRUE)
write.csv2(newAwesome, file = "newAwesomeEUR.csv",row.names=TRUE)
