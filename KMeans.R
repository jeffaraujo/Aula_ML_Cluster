#Site da TACO com os dados originais
#http://www.unicamp.br/nepa/taco/tabela.php?ativo=tabela
"C:\\Users\\logonrmlocal\\Downloads\\KMeans"
getwd()

alimentos <- read.csv("alimentos.csv", header=1,sep=";")

summary(alimentos)
head(alimentos,30)
tail(alimentos)

Resultado <- kmeans(alimentos[2:3], 4);

Resultado$size
Resultado$cluster
Resultado$centers

plot(alimentos[2:3], col = Resultado$cluster, pch= 19)
points (Resultado$centers, pch=3, col="Orange")

########################################################

"C:\\Users\\logonpflocal\\Downloads"
getwd()

alimentos <- read.csv("alimentos2.csv", header=1,sep=";")

summary(alimentos)
head(alimentos,30)
tail(alimentos)

Resultado <- kmeans(alimentos[2:3], 5);

Resultado$size
Resultado$cluster
Resultado$centers

plot(alimentos[2:3], col = Resultado$cluster, pch= 19)
points (Resultado$centers, pch=3, col="Orange")
