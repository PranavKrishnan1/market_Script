

market <- function(){

  source("D:/market_Script/profit_funtion.R")

  id=read.csv("D:/market_Script/invTypes.csv")
 
  list = id$typeID
  names = as.character(id$typeName)
  len = (length(list))

  df = read.csv(text="margin,volume,item,actual profit,isk/hr")
  df = rbind(df,c(1,1,1,1,1))

  #8536-8883

  for (i in 8536:8883){
    type = list[i]
    margin=tryCatch(profit(type), error = function(cond){
      return(list(0,0,0,0))})
    df = rbind(df,c(margin[[1]],margin[[2]],names[i],margin[[3]],margin[[4]]))
  }
  colnames(df) = c("margin","volume","name","actual profit","isk/hr")

  df$`isk/hr`=as.numeric(df$`isk/hr`)
  df=df[order(df$`isk/hr`,decreasing = T),]

return(df)
}



