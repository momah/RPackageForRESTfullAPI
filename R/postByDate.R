library(jsonlite)
library(curl)
library(RCurl)

dateDS<- data.frame(
  fromJSON(
    txt=as.character(
      "http://localhost/Slim-RESTfull-API/public/post/countByDate"
    )
  )
)

Date <- data.frame (code=doc[1])
TotalPost <- data.frame (code=doc[2])
dateDS



