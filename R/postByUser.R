library(jsonlite)
library(curl)
library(RCurl)
userDS<- data.frame(
  fromJSON(
    txt=as.character(
      "http://localhost/Slim-RESTfull-API/public/post/countByUser"
    )
  )
)

User <- data.frame (code=doc[1])
TotalPost <- data.frame (code=doc[2])
userDS