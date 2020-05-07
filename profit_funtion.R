profit <- function(num){
  
  daata=fromJSON(paste(url,num,sep=""))

  df = split(daata,daata$is_buy_order)
  if(length(df)==0){margin=list(0,0,0,0)}
  else  {
    sellorder=df[[1]]
    buyorder=df[[2]]
    S_lowest=min(sellorder$price)
    b_highest=max(buyorder$price)
    v = volume(num)
    margin = list(((S_lowest - b_highest)/S_lowest)*100,v,S_lowest - b_highest,(S_lowest - b_highest)*v/24)
  }
  return(margin)
}



volume <- function(num){
  vol=fromJSON(paste(url2,num,sep=""))
  p = nrow(vol)
  return(vol$volume[p])
}


  