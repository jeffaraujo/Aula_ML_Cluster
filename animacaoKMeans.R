install.packages("animation")	
library(animation)
set.seed(123)
setwd("C:\\Users\\logonrmlocal\\Downloads\\KMeans")

alimentos <- read.csv("alimentos.csv", header=1,sep=";")

kmeans.ani(alimentos[2:3], 4)
