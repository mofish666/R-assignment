library (dplyr)
library (tidyr)
setwd("E:/ss/博士/课程/交通数据分析与应用/作业/R/assignment1&2")
accident <- data.frame(read.csv("ACCIDENT.csv"))
person <- data.frame(read.csv("PERSON.csv"))
vehicle <- data.frame(read.csv("VEHICLE.csv"))
inter <- intersect(colnames(accident),colnames(person))
inter <-
  inner_join(
    x=accident,
    y=person,
    by=inter
  )