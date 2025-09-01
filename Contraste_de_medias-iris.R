
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

iris$variety <- as.factor(iris$variety)
class(iris$variety)

summary(iris)

mean(Iris$petal_length)

tapply(iris$petal.length, iris$variety, mean)

tapply(iris$petal.length, iris$variety, sd)

tapply(iris$petal.length, iris$variety, var)

colores <-c ("navajowhite", "salmon", "skyblue")

# Crear un boxplot iris

boxplot (iris$petal.length ~ iris$variety, col = colores,
         main = "Distribución del largo de pétalo por especie",
         xlab = "Especie",
         ylab = "Largo de pétalo")

#Lo anterior es solo para visualisar las 150 muestras.

#Datos a trabajar
# +Selección de especies: elija las especies versicolor y virginica de la base y,
#  enfoque su análisien la variable Pental.Length


df_Versicolor <- subset(iris, variety == "Versicolor")
df_Virginica <- subset(iris, variety == "Virginica")

par(mfrow=c(1,2))
qqnorm(df_Versicolor$petal.length); qqline(df_Versicolor$petal.length)
qqnorm(df_Virginica$petal.length); qqline(df_Virginica$petal.length)
par(mfrow=c(1,1))

Species<-("Versicolor,Virginica")

data_sub <-subset(iris, Species %in% c("Versicolor","Virginica"))

c("Versicolor","Virginica")
Species %in% c("Versicolor","Virginica")
subset(iris, "Versicolor","Virginica")
subset(iris, variety == "Versicolor")
subset(iris, variety == "Virginica")
View (Species)

data_sub <-subset(iris, Species %in% c("Versicolor","Virginica"))



#Instrucción de tarea

#Primer contacto con R
  #Explorar la base de datos iris usando funciones como head(), Summary()
head(data_sub)
summary(data_sub)

#Identificar las variables Petal.Lenght y determina las estadísticas descriptivas
#para las dos especies.

