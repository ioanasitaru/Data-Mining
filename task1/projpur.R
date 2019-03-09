library("ANN2")
library(ggplot2)
library("PerformanceAnalytics")
library(ggbiplot)
library("Rtsne")
library(varhandle)
library(beeswarm)
library(tourr)
library(moments)
library(glue)
library(dbscan)
data_source = data.frame(read.csv("train.csv", header=T))
#Preprocessing 
library(varhandle)
data_source$Sex = unfactor(data_source$Sex)
data_source$Embarked = unfactor(data_source$Embarked)
# Fill in missing age entries with average, embarked with Southampton
for (i in 1:length(data_source$Age)){
  if(is.na(data_source$Age[i])) {
    data_source$Age[i] = mean(data_source$Age, na.rm=TRUE)
  }
  
  if(data_source$Embarked[i] == "" || data_source$Embarked[i] == "S") {
    data_source$Embarked[i] = 3
  }
  else if (data_source$Embarked[i] == "C") {
    data_source$Embarked[i] = 1
  }
  else if(data_source$Embarked[i] == "Q") {
    data_source$Embarked[i] = 2
  }
  
  if(data_source$Sex[i] == "male") {
    data_source$Sex[i] = 2
  } 
  else if(data_source$Sex[i] == "female") {
    data_source$Sex[i] = 1
  }
  
}
data_source$Embarked = as.numeric(data_source$Embarked)
data_source$Sex = as.numeric(data_source$Sex)
animate(data=data_source[, c(3,5,6,7,8,10,12)], guided_tour(cmass(),d=2), display=display_xy())
animate(data=data_source[, c(3,5,6,7,8,10,12)], guided_tour(holes(),d=2), display=display_xy())
