**Script 5 o 8**
  18/09/2025
#  Ramón Copado García
  
  #Análisis de Variaza
  #Productividad de cultivo
  
#Anova unifactorial o de un solo factor

  crop <-read.csv("crop_data.csv",header = T)
  
  #Lo siguiente es para poder usar los numeros como factores
  crop$density<-as.factor(crop$density)
  crop$block<-as.factor(crop$block)
  crop$fertilizer<-as.factor(crop$fertilizer)
summary(crop)

colores <-c ("navajowhite", "salmon", "skyblue")

# Crear un boxplot Fertilizante

boxplot (crop$yield ~ crop$fertilizer, 
         col = colores,
         main = "Cultivo",
         xlab = "Fertilizante",
         ylab = "Prod.(ton/ha)")

tapply(crop$yield, crop$fertilizer, mean)
tapply(crop$yield, crop$fertilizer, sd)
tapply(crop$yield, crop$fertilizer, var)

#aplicar prueba de normalidad de datos
shapiro.test(subset(crop$yield, crop$fertilizer=="1"))
shapiro.test(subset(crop$yield, crop$fertilizer=="2"))
shapiro.test(subset(crop$yield, crop$fertilizer=="3"))

#Prueba de Bartlett
bartlett.test(crop$yield~crop$fertilizer)#sirve para tres varianzas que comparar

#Ho = 1=2=3
#Ha = 1=2 no igual 3 o no igual a 2

#Se acepta Ha

#Prueba ANOVA
crop.aov<-aov(crop$yield~crop$fertilizer+crop$block)
summary(crop.aov)
crop.aov<-aov(crop$yield~crop$fertilizer*crop$fertilizer)
summary(crop.aov)

crop.aov<-aov(crop$yield~crop$fertilizer)
summary(crop.aov)

# LSD determinar el valor
qt(.975,93)
sqrt((2*0.3859)/32)*qt(.975,93) #diferencia mínima de las medias que debe existir
tapply(crop$yield, crop$fertilizer, mean)

#Primer diferencia de medias F1 vs F2
176.7570 - 176.9332 #no hay diferencia
#Primer diferencia de medias F2 vs F3
176.9332-177.3562 #si hay deferencia
#Primer diferencia de medias F2 vs F3
176.7570-177.3562 #si hay diferencia

# Prueba Tukey
sqrt((2*0.3859)/32)*qtukey(.95, nmeans = 3, df = 93) #diferencia mínima de las                                                          medias que debe existir

#Primer diferencia de medias F1 vs F2
176.7570 - 176.9332 #no hay diferencia
#Primer diferencia de medias F2 vs F3
176.9332-177.3562 #no hay deferencia
#Primer diferencia de medias F2 vs F3
176.7570-177.3562 #si hay diferencia

#solo hay diferencia en F1 y F3

#Gráficar con Tukey

TukeyHSD(crop.aov)#aqui si hay diferencias como en el LSD
plot(TukeyHSD(crop.aov))

#####TAREA HACER LO MISMO PARA BLOCKES



library(ggplot2)

