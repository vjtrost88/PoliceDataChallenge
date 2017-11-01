#join Ben's tables together

library(dplyr)

path = "/home/vtrost/Documents/mergeme"
file.names = dir(path, pattern=".csv")

master = data.frame()

for(i in 1:length(file.names)){
  data = read.csv(file.names[i])
  data = data[-1,]
  data = data[,-c(1, 3)]
  if(is.data.frame(master) && nrow(master) == 0){
    master = data
    next
  }
  master <- full_join(master, data, by="GEO.id2")
  
}

write.csv(master, "master_mergeme.csv")

