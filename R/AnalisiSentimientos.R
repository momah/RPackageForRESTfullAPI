# ==============================
# Autor : Mohammed MAhrach
# Tematica : Tenerife
# ==============================

library(jsonlite)
library(curl)
library(RCurl)


library(coreNLP)
library(tm)
# coreNLP::downloadCoreNLP()
initCoreNLP()

# library(MASS)
library(topicmodels)
# Word Cloud
library(RColorBrewer)
library(wordcloud)

# ================
# 1 READING DATA
# ================

tempus.url<- "http://localhost/APIMediaDataExtractor/public/post/getAll"
tempus.oper<- data.frame(fromJSON(txt=as.character(tempus.url)))
#   toJSON(tempus.oper, pretty=TRUE)
print(tempus.oper)
View(tempus.oper)

dim(tempus.oper)
str(tempus.oper)

# =================
# 2 VISUALIZATIONS
# =================

# - Cleaning data 
# -- Eliminamos la columna Fecha
tempus.oper <- tempus.oper[,-3]
print(tempus.oper)
View(tempus.oper)

Autor <- tempus.oper$user_nicename
Post <- tempus.oper$status_content
# fecha <- tempus.oper$status_time

textos <- iconv(Post,"UTF-8","latin1", "")
class(textos)

# =====================
# 3 CREAR CORPUS
# =====================

textos <- gsub("\r?\n|\r", " ", textos)
class(textos)

textos <- VCorpus(VectorSource(textos))
myCorpus <- tm_map(textos, content_transformer(tolower))
myCorpus <- tm_map(myCorpus, removePunctuation) 
myCorpus <- tm_map(myCorpus, removeNumbers)

txt <- c(myCorpus[1:length(myCorpus)])$content
myCorpus_anotado<-annotateString(c(myCorpus[1:length(myCorpus)])$content)
myCorpus_anotado

# =====================
# 3 ANALISIS DE TEXTO
# =====================

dtm<-DocumentTermMatrix(myCorpus)
dtm
model <- LDA(dtm, 3)
topics <- terms(model, 4)

# Word Cloud : Nube de palabras
pal <- brewer.pal(8, "Dark2")
wordcloud(myCorpus, min.freq=2, max.words = 2000, random.order = FALSE, col = pal)

getToken(myCorpus_anotado)
getSentiment(myCorpus_anotado)
