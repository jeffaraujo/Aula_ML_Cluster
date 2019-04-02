#Base de dados
#http://archive.ics.uci.edu/ml/datasets/Online+Retail

setwd('C:\\Users\\logonpflocal\\Downloads\\KMeans')
dados <- read.csv('Online Retail.csv', header = T, sep=',')

dados <- dados[!grepl("C", dados$InvoiceNo),]
dados <- subset(dados, Quantity >= 1)
dados <- subset(dados, UnitPrice >= 0.01)
dados <- subset(dados, Quantity < 40000)

dados$totalProduto <- dados$Quantity * dados$UnitPrice
Quantidade <- aggregate(Quantity ~ InvoiceNo, data = dados, sum)

TotalPrice <- aggregate(totalProduto ~ InvoiceNo, data = dados, sum)

dadosAgrupados <- merge(Quantidade,TotalPrice)

umaCompraTotal <- subset(dados, InvoiceNo == 543647)
umaCompraAgrupa <- subset(dadosAgrupados, InvoiceNo == 543647)

#Fazendo o KMeans
ResultadoVendas <- kmeans(dadosAgrupados[2:3], 3);

ResultadoVendas$size
ResultadoVendas$cluster
ResultadoVendas$centers

#Separação de cada Cluster
grupo1 = dadosAgrupados[ResultadoVendas$cluster == 1,]
grupo2 = dadosAgrupados[ResultadoVendas$cluster == 2,]
grupo3 = dadosAgrupados[ResultadoVendas$cluster == 3,]

#Sumarizando os dados
summary(grupo1$Quantity)
summary(grupo1$totalProduto)
head(grupo1)
tail(grupo1)


summary(grupo2$Quantity)
summary(grupo2$totalProduto)
head(grupo2)
tail(grupo2)

summary(grupo3$Quantity)
summary(grupo3$totalProduto)
head(grupo3)
tail(grupo3)


#Fazendo o merge (join) para incluir o campo país
dadosPais <- dadosAgrupados
dadosPais$pais <- dados[dadosAgrupados$InvoiceNo, c("Country")]



#Separação de cada Cluster
grupo1pais = dadosPais[ResultadoVendas$cluster == 1,]
grupo2pais = dadosPais[ResultadoVendas$cluster == 2,]
grupo3pais = dadosPais[ResultadoVendas$cluster == 3,]

#Sumarizando os dados
summary(grupo1pais$Quantity)
summary(grupo1pais$totalProduto)
head(grupo1pais)
tail(grupo1pais)

summary(grupo2pais$Quantity)
summary(grupo2pais$totalProduto)
head(grupo2pais)
tail(grupo2pais)

summary(grupo3pais$Quantity)
summary(grupo3pais$totalProduto)
head(grupo3pais)
tail(grupo3pais)

#Verificando a frequencia de cada país
grupo1paisnew <- as.data.frame(table(grupo1pais$pais))
grupo2paisnew <- as.data.frame(table(grupo2pais$pais))
grupo3paisnew <- as.data.frame(table(grupo3pais$pais))

head(grupo1paisnew[order(-grupo1paisnew$Freq),])
head(grupo2paisnew[order(-grupo2paisnew$Freq),])
head(grupo3paisnew[order(-grupo3paisnew$Freq),])


View(dados)

plot(dadosAgrupados[2:3], col = ResultadoVendas$cluster, pch= 19)
points (ResultadoVendas$centers, pch=3, col="Orange")

View(dados)


