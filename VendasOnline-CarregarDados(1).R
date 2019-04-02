#Base de dados
#http://archive.ics.uci.edu/ml/datasets/Online+Retail

setwd('C:\\Users\\logonpflocal\\Downloads')
dados <- read.csv('Online Retail.csv', header = T, sep=',')

dados <- dados[!grepl("C", dados$InvoiceNo),]
dados <- subset(dados, Quantity >= 1)
dados <- subset(dados, UnitPrice >= 0.01)

View(dados)

dados$totalProduto <- dados$Quantity * dados$UnitPrice
dadosAgrupados <- aggregate(Quantity ~ InvoiceNo, data = dados, sum)
dadosAgrupados$TotalPrice <- aggregate(totalProduto ~ InvoiceNo, data = dados, sum)

umaCompraTotal <- subset(dados, InvoiceNo == 543647)
umaCompraAgrupa <- subset(dadosAgrupados, InvoiceNo == 543647)


View(dadosAgrupados)
