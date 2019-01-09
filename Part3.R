name2 <- c("paul", "jake", "nicky", "tim", "angel")
gender2 <- c("m", "m", "NA", "m", "f")
age2 <- c(24, 21, 23, 31, 30)
height2 <- c(190, 164, 176, 183, 154)
City2 <- c("Utrecht", "Nijmegen", "Arnhem", "Rotterdam", "Hilversum")
persons <- data.frame(name2, gender2, age2, height2, City2, stringsAsFactors = FALSE)
print(persons)

for (row in 1:nrow(persons)){
  height <- persons[row, "height2"]
  name <- persons[row, "name2"]
  gender <- persons[row, "gender2"]
  
  if ((height >= 175)&(gender == 'm')){
    print(paste(name, "is a tall man!"))
    
  } else if ((height >= 175)&(gender == 'NA')){
      print(paste(name, "is a tall person!"))
    
  } else if ((height <= 175)&(gender == 'm')){
      print(paste(name, "is a small man!"))
    
  } else if ((height <= 175)&(gender == 'f')){
      print(paste(name, "is a small woman!"))
  }
}

print(persons)
print(persons[4, 1:5])
persons[4, 1:5] <- c("Robin", "m", 22, 188, "Amsterdam")
print(persons[4, 1:5])
print(persons)

person6 <- c("Dany", 'f', 43, 168, 'Utrecht')
person7 <- c('Remi', 'm', 47, 179, 'Arnhem')
person8 <- c('Gina', 'f', 36, 190, 'Utrecht')
person9 <- c('Margaret', 'f', 26, 163, 'Nijmegen')
person10 <- c('Jillian', 'f', 27, 172, 'Hilversum')
person11 <- c('Remco', 'm', 28, 189, 'Amsterdam')
person12 <- c('Robin', 'f', 29, 176, 'Utrecht')

persons2 = rbind(persons, person6, person7, person8, person9, person10, person11, person12)
print(persons2)

for (row in 1:nrow(persons2)){
  height <- persons2[row, "height2"]
  name <- persons2[row, "name2"]
  gender <- persons2[row, "gender2"]
  age <- persons2[row, 'age2']
  city <- persons2[row, 'City2']
  
  if ((city == 'Utrecht')&(age <= 30)){
    print(paste(name, "lives in", city))
  }
    else{
      print ("nope")
    }
}
