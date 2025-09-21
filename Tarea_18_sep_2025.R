#  RamónCopado García

#Análisis de Variaza
#Productividad de cultivo

#Anova unifactorial o de un solo factor

crop <-read.csv("crop_data.csv",header = T)

#Lo siguiente es para poder usar los numeros como factores
crop$block<-as.factor(crop$block)
crop$fertilizer<-as.factor(crop$fertilizer)
summary(crop)

colores <-c ("navajowhite", "salmon", "skyblue")

# Crear un boxplot Bloque

boxplot (crop$yield ~ crop$block, 
         col = colores,
         main = "Cultivo",
         xlab = "Bloques",
         ylab = "Prod.(ton/ha)")

tapply(crop$yield, crop$block, mean)
tapply(crop$yield, crop$block, sd)
tapply(crop$yield, crop$block, var)

#aplicar prueba de normalidad de datos
shapiro.test(subset(crop$yield, crop$block=="1"))
shapiro.test(subset(crop$yield, crop$block=="2"))
shapiro.test(subset(crop$yield, crop$block=="3"))
shapiro.test(subset(crop$yield, crop$block=="4"))

#Prueba de Bartlett
bartlett.test(crop$yield~crop$block)#sirve para tres varianzas que comparar

#Ho = 1=2=3=4
#1Ha = 1=2=3 no igual 4 
#2Ha = 1=2=4 no igual 3
#3Ha = 1=3=4 no igual 2
#4Ha = 2=3=1 no igual 4
#5Ha = 3=2=1 no igual 4

#Se acepta Ha

#Prueba ANOVA
crop.aov<-aov(crop$yield~crop$block+crop$block)
summary(crop.aov)
crop.aov<-aov(crop$yield~crop$block*crop$block)
summary(crop.aov)

crop.aov<-aov(crop$yield~crop$block)
summary(crop.aov)

# LSD determinar el valor
qt(.975,93)
sqrt((3*0.3951)/24)*qt(.975,93) #diferencia mínima de las medias que debe existir
tapply(crop$yield, crop$block, mean)

#Primer diferencia de medias F1 vs F2
176.8564 - 177.3169 #si hay diferencia
#Segunda diferencia de medias F1 vs F3
176.8564 - 176.7126 #no hay diferencia
#Tercer diferencia de medias F1 vs F4
176.8564 - 177.1760 #no hay diferencia
#Cuarta diferencia de medias F2 vs F3
177.3169 - 176.7126 #si hay deferencia
#Quinta diferencia de medias F2 vs F4
177.3169 - 177.1760 #no hay diferencia
#Sexta diferencia de medias F3 vs F4
176.7126 - 177.1760 #si hay diferencia

# Prueba Tukey
sqrt((3*0.3951)/24)*qtukey(.95, nmeans = 4, df = 93) #diferencia mínima de las                                                          medias que debe existir

#Primer diferencia de medias F1 vs F2
176.8564 - 177.3169 #si hay diferencia
#Segunda diferencia de medias F1 vs F3
176.8564 - 176.7126 #no hay diferencia
#Tercer diferencia de medias F1 vs F4
176.8564 - 177.1760 #no hay diferencia
#Cuarta diferencia de medias F2 vs F3
177.3169 - 176.7126 #si hay deferencia
#Quinta diferencia de medias F2 vs F4
177.3169 - 177.1760 #no hay diferencia
#Sexta diferencia de medias F3 vs F4
176.7126 - 177.1760 #si hay diferencia
  
#se aceptan las hipótesis 1Ha, 4Ha y 6Ha

#Gráficar con Tukey

TukeyHSD(crop.aov)#aqui si hay diferencias como en el LSD
plot(TukeyHSD(crop.aov))


