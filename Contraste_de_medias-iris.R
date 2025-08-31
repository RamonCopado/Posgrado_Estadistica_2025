
##HW_02
#Ramón Copado Garcia 
##Laboratorio2: Contraste de Medias
##TrabajarcondatosenR
##Script5
##30/8/2025
##RamónCopadoGarcía
##Matricula1059439

url<-("https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv")
url2<-paste0("https://gist.githubusercontent.com/netj/8836201/raw/",
              "6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv")
iris<-read.csv(url,header=T)
iris<-read.csv(url2,header=T)
View (iris)


# Ejercicio
#En la base iris, las especies versicolor y virginica suelen diferir en sus
#rasgos florales. Nos interesa evaluar si el largo del pétalo (Petal.Length)
#presenta diferencias en su media poblacional entre estas dos especies.
head(iris)
summary(iris)
