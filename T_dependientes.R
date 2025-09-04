# Importar excel


#Pruebas de t muestras dependientes

#Revisar la producción del Kg semilla para el año 2012 y 2013

prod <- read.csv("mainproduccion.csv", header = T)
prod$Tiempo<-as.factor(prod$Tiempo)

boxplot (prod$Kgsem~prod$Tiempo)
tapply(prod$Kgsem, prod$Tiempo, mean)
abs(10.1066 - 10.8954)

#HO Hay diferencia en el promedio de producción de la variedades de semillas por año
#H1 NO existe diferencia entre la producción de kg de semilla entre los años 2012 y 2013
var.test(prod$Kgsem ~ prod$Tiempo)  

t.test(prod$Kgsem ~ prod$Tiempo, alternative = "two.sided",
      var.equal = T,)

tapply(prod$Kgsem, prod$Tiempo, mean)
colores <-c ("navajowhite", "skyblue")
boxplot (prod$Kgsem~ prod$Tiempo, col = colores,
         main = "Producción de semillas (kg)",
         xlab = "Año", 
         ylab = "Producción (kg)")

#No hay diferencia entre años se no se acepta HO

#Se realizó una prueba t para muestras dependientes ( T2012 vs T2013),
#comprobando varianzas iguales. Se encontró una diferencia, t(98) = -1.2998, 
#p =< 0.1967. El año 2012 mostró una media menor (10.1066) que el año 2013
#(10.8954). La diferencia de medias fue de .7888 y el IC 95% = 
#[-1.9931048, 0.4155048]. 

t2012 <- subset(prod$Kgsem,prod$Tiempo == "T2012")
t2013 <- subset(prod$Kgsem,prod$Tiempo == "T2013")

##**CLASE Doctor se realiza de la siguiente manera:

#HO las medias de ambos años son igual a cero
#H1 las medias de ambos años son diferentes a cero
#Método alternativo two.sided
var.test(prod$Kgsem ~ prod$Tiempo) 
t.test(t2012,t2013,alternative = "two.sided", var.equal = T,
       paired =T)

#HO la media del 2012 es menor 2013
#H1 la media del 2012 igual o mayor al 2013

t.test(t2012,t2013,alternative = "less", var.equal = T,
       paired =T)
#Estadisticamente no hay diferencia entre años


#HO la media del 2013 es mayor que 2012
#H1 la media del 2013 es menor que 2012

t.test(t2013,t2012,alternative = "greater", var.equal = T,
       paired =T)

