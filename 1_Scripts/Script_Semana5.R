# Script_Semana 5
# 04/09/2025
# Ramón Copado García

# Media movil
data(iris)
head(iris)

setosa <- subset(iris, Species == "setosa")
setosa

# Sumatoria acumulativa de la variable longitud
acum <- cumsum(setosa$Sepal.Length)
acum

continuo <- seq(1:length(setosa$Sepal.Length))
continuo

# Crear un data frame con los datos creados
setosa_movil <- data.frame(continuo, acum)
setosa_movil

# Nueva columna 
setosa_movil$movil <- round(acum/continuo, 2)
setosa_movil

plot(setosa_movil$continuo, setosa_movil$movil, type= "l",
     main= "Media movil",
     xlab= "Numero de observaciones",
     ylab= "Media movil",
     col = "skyblue")
abline(h=mean(setosa$Sepal.Length), col= "red2")

# Anlisis iris
boxplot(iris$Sepal.Length ~ iris$Species)

data_sub <- subset(iris, Species %in% c("versicolor", "virginica"))

# Eliminar un factor que se desecho de la base de datos original
data_sub$Species <-  droplevels(data_sub$Species)

boxplot(data_sub$Sepal.Length ~ data_sub$Species)

# HO = La media de SL de virginica es mayor que la media de versicolor
t.test(data_sub$Sepal.Length ~ data_sub$Species,
       alternative = "two.sided", var.equal = T)

# p value es = 1, la diferencia es significativa

5.936-6.588

tapply(data_sub$Sepal.Length, data_sub$Species, mean)
tapply(data_sub$Sepal.Length, data_sub$Species, t.test)


# datos DE PRODUCCION DE SEMILLA

prod <- read.csv("C:/Users/Ramon/Documents/Posgrado_Estadistica_2025/1_Scripts/mainproduccion.csv")
head(prod)
getwd()

prod$Tiempo <- as.factor(prod$Tiempo)
head(prod)

boxplot(prod$Kgsem ~ prod$Tiempo)

tapply(prod$Kgsem, prod$Tiempo, mean)

10.1066-10.8954 

# Hipotesis nula = no hay diferencias significativas entre las medias de la produccion
# de semilla de cada año

# Hipotesis alternativa = hay diferencias significativas entre las medias

t2012 <- subset(prod$Kgsem, prod$Tiempo == "T2012")
t2013 <- subset(prod$Kgsem, prod$Tiempo == "T2013")

t.test(t2012, t2013,
       alterantive = "two.sided",
       var.equal = T,
       paired = T)

# El valor de p es mayor a 0.05, por lo que no se rechaza la hipótesis nula.
# Esto indica que no existen diferencias significativas entre las medias de 
# producción de semilla entre los años 2012 y 2013.

boxplot(prod$Kgsem ~ prod$Tiempo,
        main = "Producción de semilla 2012 y 2013",
        xlab= "Año de produccion",
        ylab= "Kilogramos",
        col = c("red2", "cyan2"))

t.test(t2012, t2013,
       alterantive = "less",
       var.equal = T,
       paired = T)

# OTRA VEZ SETOSA

mean(setosa$Sepal.Width)

# mu = 3.9 media teorética

# Ho = la diferencia entre las medias es igual a cero o = a 3.9
# H1 = la diferencia entre media teoretica y experimental es diferente a cero
# o difernete a 3.9

t.test(setosa$Sepal.Width, mu = 3.9)

