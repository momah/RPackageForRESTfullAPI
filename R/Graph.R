source('getAll.R')
source('postByDate.R')
source('postByUser.R')


Date <- as.vector(dateDS[,1],mode='character')
PostsbyDate <- as.vector(dateDS[,2],mode='numeric')


user <- as.vector(userDS[,1],mode='character')
PostsByUser <- as.vector(userDS[,2],mode='numeric')

par(mfrow=c(1,2)) # para dividir la pantalla en 3 partes

boxplot(tempus.oper)

plot(factor(Date), PostsbyDate, type="o", las=2, ylab="numero de posts", main="Post subidos por día")
lines(factor(Date), PostsbyDate, type = "o") 


plot(factor(user), PostsByUser, type="o", las=2, ylab="numero de posts", main="Post subidos por Usuario")
lines(factor(user), PostsByUser, type = "o") 




