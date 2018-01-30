# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
library(jsonlite)
library(curl)
library(RCurl)

tempus.url<- "http://localhost/Slim-RESTfull-API/public/post/getAll"
tempus.oper<- data.frame(fromJSON(txt=as.character(tempus.url)))
#   toJSON(tempus.oper, pretty=TRUE)
print(tempus.oper)
View(tempus.oper)

Autor <- data.frame (code=tempus.oper[1])
Post <- data.frame (code=tempus.oper[2])
fecha <- data.frame (code=tempus.oper[3])




