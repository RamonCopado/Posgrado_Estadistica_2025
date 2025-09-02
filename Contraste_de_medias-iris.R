
##HW_02
#Ramón Copado Garcia 
##Laboratorio2: Contraste de Medias
##Trabajar condatos en R
##Script 5
##30/8/2025
##Ramón Copado García
##Matricula 1059439


##Objetivo
#El objetivo de esta práctica es que el estudiante se familiarice con el entorno
#de R y RStudio, explorando una de las bases de datos más utilizadas en 
#estadística (iris), con el fin de: 
#  +Describir y comprender la estructura de un conjunto de datos reales.
#  +Aplicar pruebas estadísticas básicas (prueba t de dos muestras) para 
#    contrastar hipótesis sobre medias poblacionales.
#  +Interpretar los resultados tanto en términos estadísticos (valores de p, 
#    intervalos de confianza, tamaño del efecto) como en términos biológicos 
#    (diferencias entre especies de iris).
#  +Desarrollar habilidades prácticas en la escritura de código reproducible en 
#    R y en la presentación de resultados mediante reportes en formato PDF.

##BAse de datos Iris

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
head(iris) #Primeras 6 filas
summary(iris) #Resumen estadistico
dim(iris) #Dimensiones de filas y columnas
names(iris) #Revisar los nombre de las columnas
str(iris) #Información sobre dimensiones, variables, el tipo de dato y valores
df<-iris[3] #data Frame de la variable a medir

by(iris[3],iris$variety, summary) #Resumen estadistico de la Variable a trabajar

###SOlo informativo y visualizar como sub ejercicio
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




##Ejercicio
  #Datos a trabajar

#A partir de la base de datos iris disponible en R, realice lo siguiente:

  #+Selección de especies: elija las especies versicolor y virginica de la base 
  #+y enfoque su análisis en la variable Petal.Length.

data_sub <-subset(iris, variety %in% c("Versicolor","Virginica"))
table(data_sub$variety)

variety<-("Versicolor,Virginica")

#Vamos a introducir el operador%in% para realizar el subset. En R, el
#operador%in% se utiliza para preguntar si un valor pertenece a un conjunto 
# de valores. Devuelve un vector lógico (TRUE o FALSE) indicando si cada 
#elemento de la izquierda está contenido dentro del vector de la derecha.

data_sub <-subset(iris, variety %in% c("Versicolor","Virginica"))
table(data_sub$variety)

variety<-("Versicolor,Virginica")

data_sub <-subset(iris, variety %in% c("Versicolor","Virginica"))
table(data_sub$variety)
data_sub


#Instrucción de tarea

#Primer contacto con R
  #Explorar la base de datos iris usando funciones como head(), Summary()
    head(data_sub)
    summary(data_sub)

       #Identificar las variables Petal.Length y determina las estadísticas descriptivas
  #para las dos especie
    tapply(data_sub$petal.length, data_sub$variety, summary) #Resumen estadistico
    tapply(data_sub$petal.length, data_sub$variety, mean) #Solo práctica
    tapply(data_sub$petal.length, data_sub$variety, sd) #Solo práctica
    tapply(data_sub$petal.length, data_sub$variety, var) #Solo práctica
    by(data_sub[3], data_sub$variety,summary)

#Prueba estadística
  #+Defina una pregunta de invertigación sobre la variable Petal.Length

    #¿Hay diferencia significativa en la longitud de los pétalos (Petal.Length)
    # entre las variedades Versicolor y Virginica de la base de datos iris?
    
  #+Plantee formalmente las hipótesis estadísticas para una prueba t de dos 
   #muestras independientes (two.sided).
    
    # + H0 (nula): No existen diferencias significativas entre la longitud de 
    #los petalos de las variedades Versicolor y Virginica de la base de datos iris.
    
    # + H1 (alternativa): Existen diferencias significativas entre la longitud 
    #de los petalos de las variedades Versicolor y Virginica de la base de datos iris.
 
  #+Ejecute la prueba en R justificando el tipo de prueba (Welch cuando las 
    #varianzas son diferentes o clásica, cuando las varainzas son iguales).


    # Revisar homogeneidad
    var.test(data_sub$petal.length ~ data_sub$variety)  
    
      # Observar datos
# Al utilizar F test para comparar dos varianzas, la información que nos arroja 
    #son valores de P = 0.2637 siendo >0.05, estos datos nos dicen que no existen 
    #diferencias significativas entre las varianzas de las dos especies; por lo 
    #tanto si hay homogeneidad y se utilizará la prueba de T clásica.
    
      # Revisar homogeneidad
        var.test(data_sub$petal.length ~ data_sub$variety)

      # Prueba de T
        t.test(data_sub$petal.length ~ data_sub$variety, alternative = "two.sided",
               var.equal = T)
        t.test(data_sub$petal.length ~ data_sub$variety, alternative = "two.sided", 
               var.equal = F)
    
  
  #Con esta prueba de T podemos dicer que el valor de p   (p=<2.2e-16) es < que 
        #0.05, rechazamos la hipótesis nula y decimos que si hay diferencia 
        #significativa entre las variedades Virginica y Versicolor en la variable
        #petal.length de la base de daros iris.
        
  #+Calcule e interprete el tamaño del efecto (Cohen’s d)
  
        
            # Medir el efecto del efecto
            
            cohens_efecto <- function(x,y) {
              n1 <- length(x); n2 <- length(y)
              s1 <- sd(x); s2<-sd(y)
              sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
              (mean (x) - mean (y)) / sp
            }
            
            d1_cal <- cohens_efecto(df_Versicolor$petal.length, df_Virginica$petal.length)
            d1_cal
  
            abs(d1_cal)
            
            #Este valor de  cohens no dice que hay un diferencia enorme en la
            #variable petal.length y esto nos lleva al inicio en objeticos que 
            #podemos decir que tanto en términos estadisticos como en biologicos
            #si hay diferencia entre las variedades y el largo del petalo.
            

#Visualización
    # Genere una gráfica comparativa (boxplot, violinplot, etc.) que muestre 
    #las diferencias entre especies.
            colores <-c ("navajowhite", "skyblue")
            
            # Crear un boxplot data_sub
  
            
           
            boxplot (data_sub$petal.length~ data_sub$variety, col = colores,
                     main = "Distribución del largo de pétalo en 2 especies",
                     xlab = "Variedad", 
                     ylab = "Largo de pétalo (cm)")
              

#Se realizó una prueba t para muestras independientes ( Versicolor vs Virginica),
#comprobando varianzas iguales. Se encontró una diferencia, t(98) = -12.604, 
#p =< 2.2e-16. El grupo Virginica mostró una media mayor (5.552) que el grupo 
#Versicolor (4.26). La diferencia de medias fue de 1.292 y el IC 95% = 
#[-0.23, -0.04]. El tamaño del efecto fue grande (d=-2.520756) lo que indica 
#que la variedad tuvo un efecto sustancial sobre el largo del petalo.
            

                       
                        #Informe escrito:
    #Redacte una síntesis (máx. 1 cuartilla) que incluya:
      #• Planteamiento del problema y de las hipótesis.
      #• Resultados numéricos y gráficos.
      #• Interpretación estadística y biológica.

            #• Planteamiento del problema y de las hipótesis.
            
#De la base de datos iris saber si hay diferencia del el largo de petalo entre
#las variedades Versicolor y Virginica.De aqui la pregunta que me realice fue:
    #¿Hay diferencia significativa en la longitud de los pétalos (Petal.Length)
    # entre las variedades Versicolor y Virginica de la base de datos iris?
 #Plantee formalmente las hipótesis estadísticas para una prueba t de dos 
  #muestras independientes (two.sided).
     # + H0 (nula): No existen diferencias significativas entre la longitud de 
      #los petalos de las variedades Versicolor y Virginica de la base de datos iris.
     # + H1 (alternativa): Existen diferencias significativas entre la longitud 
      #de los petalos de las variedades Versicolor y Virginica de la base de datos iris.
            
            #• Resultados numéricos y gráficos.
      #Los resultados numéricos fueron:
  #Se realizó una prueba t para muestras independientes ( Versicolor vs Virginica),
  #comprobando varianzas iguales. Se encontró una diferencia, t(98) = -12.604, 
  #p =< 2.2e-16. El grupo Virginica mostró una media mayor (5.552) que el grupo 
  #Versicolor (4.26). La diferencia de medias fue de 1.292 y el IC 95% = 
  #[-0.23, -0.04]. El tamaño del efecto fue grande (d=-2.520756) lo que indica 
  #que la variedad tuvo un efecto sustancial sobre el largo del petalo.

                   #Los resultados gráficos mostraron
# Las gráficas tanto la de inicio (practica) como la de resultados muestran 
# claramente que si hay una muy significante diferencia entre las variedades cuando
# las evaluamos por el largo de petalo, aunque se puede observar que pudiera haber 
# algo de valores iguales en tanto que pudieramos decir que la variedades versicolor 
# y virginica puede haber erros en cuanto a la clasificación de variedades ya que 
# los valores máximos de versicolor pueden confundir con los valores mínimos de 
# virginica y es por eso que se uso la prueba de T clásica para estas dos variedades
  
            #• Interpretación estadística y biológica.
            
#Estadisticamente determinamos que si hay diferencia enorme con el valor del largo
 #de petalo entre as variedades versicolor y virginica ya que el valor del efecto
 #del efecto evaluado por el método Cohen´s no dio un valor por arriba del criterio 
 #de efecto grande.
#Hablando biologicamente el largo del petalo de la especie iris es fundamental para
  #detefrminar a la variedad que corresponde y estadisticamente esta respaldado.
            
            
    