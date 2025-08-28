# Script 4
# 28/8/2025
# Ramón Copado García

# Importar

calidad <- read.csv("calidad_plantula.csv", header = T)

calidad$Tratamineto <<- as.factor(calidad$Tratamiento)
class(calidad$Tratamiento)
summary(calidad)

mean(calidad$IE)

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

colores <-c ("navajowhite", "salmon")

#Crear un boxplot calidad
boxplot (calidad$IE~ calidad$Tratamiento, col = colores,
main = "Efecto de Fertilizante",
xlab = "Tratamineto", 
ylab = "Indice de esbeltez")   

        