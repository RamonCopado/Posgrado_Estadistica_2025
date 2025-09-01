
##HW_02
#Ramón Copado Garcia 
##Laboratorio2: Contraste de Medias
##Trabajar condatos en R
##Script 5
##30/8/2025
##Ramón Copado García
##Matricula 1059439

#Importar datos de Github

url<-("https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv")
url2<-paste0("https://gist.githubusercontent.com/netj/8836201/raw/",
              "6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv")

iris<-read.csv(url,header=T)

iris<-read.csv(url2,header=T)

View (iris)

#Tambien se puede utilizar, data("iris"), y trabajar sobre la base de datos



# Ejercicio
#En la base iris, las especies versicolor y virginica suelen diferir en sus
#rasgos florales. Nos interesa evaluar si el largo del pétalo (Petal.Length)
#presenta diferencias en su media poblacional entre estas dos especies.
head(iris)
summary(iris)
dim(iris)
names(iris)
str(iris)
df<-iris[3]
boxplot(df)


iris$variety <- as.factor(iris$variety)
class(iris$variety)

summary(iris)

by(iris[1:4],iris$variety, summary)

tapply(iris$petal.length, iris$variety, mean)

tapply(iris$petal.length, iris$variety, sd)

tapply(iris$petal.length, iris$variety, var)

colores <-c ("navajowhite", "salmon", "skyblue")

# Crear un boxplot iris

boxplot (iris$petal.length ~ iris$variety, col = colores,
         main = "Distribución del largo de pétalo por especie",
         xlab = "Especie",
         ylab = "Largo de pétalo")
df_Versicolor <- subset(iris, variety == "Versicolor")
df_Virginica <- subset(iris, variety == "Virginica")

par(mfrow=c(1,2))
qqnorm(df_Versicolor$petal.length); qqline(df_Versicolor$petal.length)
qqnorm(df_Virginica$petal.length); qqline(df_Virginica$petal.length)
par(mfrow=c(1,1))

#Lo anterior es solo para visualisar las 150 muestras.

#Datos a trabajar
# +Selección de especies: elija las especies versicolor y virginica de la base y,
#  enfoque su análisien la variable Pental.Length



#Vamos a introducir el operador%in% para realizar el subset. En R, el
#operador%in% se utiliza para preguntar si un valor pertenece a un conjunto 
# de valores. Devuelve un vector lógico (TRUE o FALSE) indicando si cada 
#elemento de la izquierda está contenido dentro del vector de la derecha.

variety<-("Versicolor,Virginica")

data_sub <-subset(iris, variety %in% c("Versicolor","Virginica"))
table(data_sub$variety)





#Instrucción de tarea

#Primer contacto con R
  #Explorar la base de datos iris usando funciones como head(), Summary()
    head(data_sub)
    summary(data_sub)

  #Identificar las variables Petal.Length y determina las estadísticas descriptivas
  #para las dos especie
    tapply(data_sub$petal.length, data_sub$variety, summary)
    tapply(data_sub$petal.length, data_sub$variety, mean)
    tapply(data_sub$petal.length, data_sub$variety, sd)
    tapply(data_sub$petal.length, data_sub$variety, var)
    by(data_sub[3], data_sub$variety,summary)

#Prueba estadística
  #Defina una pregunta de invertigación sobre la variable Petal.Length
  
    
  #Plantee formalmente las hipótesis estadísticas para una prueba t de dos 
  #muestras independientes (two.sided).
      # Observar datos
       # Aplicar subconjunto para cada tratamiento
    
    df_Versicolor <- subset(data_sub, variety == "Versicolor")
    df_Virginica <- subset(data_sub, variety == "Virginica")
    par(mfrow=c(1,2))
    qqnorm(df_Versicolor$petal.length); qqline(df_Versicolor$petal.length)
    qqnorm(df_Virginica$petal.length); qqline(df_Virginica$petal.length)
    par(mfrow=c(1,1))
    
    
      # Prueba normalidad SHAPIRO.TEST
        shapiro.test(df_Versicolor$petal.length)
        shapiro.test(df_Virginica$petal.length)

      # Revisar homogeneidad
        var.test(data_sub$petal.length ~ data_sub$variety)


      # Prueba de T

        t.test(data_sub$petal.length ~ data_sub$variety, alternative = "two.sided",
               var.equal = T)
        t.test(data_sub$petal.length ~ data_sub$variety, alternative = "two.sided", 
               var.equal = F)

          # Error estadistico de como plantear la pregunta
            t.test(data_sub$petal.length ~ data_sub$variety, alternative = "greater", 
                   var.equal = T)
            t.test(data_sub$petal.length ~ data_sub$variety, alternative = "greater", 
                   var.equal = F)


    
    
    
  #Ejecute la prueba en R justificando el tipo de prueba (Welch cuando las 
  #varianzas son diferentes o clásica, cuando las varainzas son iguales).
    
    
    
  #Calcule e interprete el tamaño del efecto (Cohen’s d)
            # Medir el efecto del efecto
            
            cohens_efecto <- function(x,y) {
              n1 <- length(x); n2 <- length(y)
              s1 <- sd(x); s2<-sd(y)
              sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
              (mean (x) - mean (y)) / sp
            }
            
            d1_cal <- cohens_efecto(df_ctrl$IE, df_fert$IE)
            d1_cal
            

#Visualización
    # Genere una gráfica comparativa (boxplot, violinplot, etc.) que muestre 
    #las diferencias entre especies.
    
    
#Informe escrito:
    #Redacte una síntesis (máx. 1 cuartilla) que incluya:
      #• Planteamiento del problema y de las hipótesis.
      #• Resultados numéricos y gráficos.
      #• Interpretación estadística y biológica.
    