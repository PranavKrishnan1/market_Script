library(jsonlite)
library(rlist)
setwd("D:/market_Script")

source("profit_funtion.R")

id=read.csv("invTypes.csv")
url = "https://esi.evetech.net/latest/markets/10000002/orders/?datasource=tranquility&order_type=all&page=1&type_id="
url2 = "https://esi.evetech.net/latest/markets/10000002/history/?datasource=tranquility&type_id="


list = id$typeID
names = as.character(id$typeName)
len = (length(list))

df = read.csv(text="margin,volume,item,actual profit,isk/hr")
df = rbind(df,c(1,1,1,1,1))


for (i in 8536:8883){
  type = list[i]
  margin=tryCatch(profit(type), error = function(cond){
    return(list(0,0,0,0))})
  df = rbind(df,c(margin[[1]],margin[[2]],names[i],margin[[3]],margin[[4]]))
}
colnames(df) = c("margin","volume","name","actual profit","isk/hr")

df$`isk/hr`=as.numeric(df$`isk/hr`)
