library(dplyr)
library(tidyr)
library(scatterplot3d)
setwd("E:/ss/博士/课程/交通数据分析与应用/作业/R/assignment1&2")
iri <- data.frame(read.csv("iri.csv"))
iri_sub1 <- subset(iri,STATE_CODE == 6 & substr(SHRP_ID,1,3)=='050')
iri_sub2 <- iri |>
  group_by(STATE_CODE,SHRP_ID) |>
  summarise(
    observation = n(),
    iri_min = min(IRI,na.rm = T),
    iri_max = max(IRI,na.rm = T),
    iri_mean = mean(IRI,na.rm = T)
  ) |>
  ungroup()
iri_sub3 <- arrange(iri_sub2,desc (iri_mean))

iri_sub4 <- iri |>
  group_by(VISIT_DATE,STATE_CODE) |>
  summarise(
    iri_mean = mean(IRI,na.rm = T)
  )
iri_sub4 <- separate(iri_sub4,VISIT_DATE,c("DATE","TIME"),sep=",")|>
  mutate (
    DATE = as.Date(DATE,"%m/%d/%y")
  )
plot(iri_sub4$DATE,iri_sub4$iri_mean)
plot(iri_sub4$STATE_CODE,iri_sub4$iri_mean)
scatterplot3d(iri_sub4$DATE,iri_sub4$STATE_CODE,iri_sub4$iri_mean)
