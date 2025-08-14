temperatura <- read.csv("C:/Repositorios/Posgrado_Estadistica_2025/temperatura.csv")
View(temperatura)

head(temperatura) # Primeras 6 filas
dim(temperatura) #Numero de filas y columnas
names(temperatura) #Nombres de las columnas
str(temperatura)

summary(temperatura) #Resumen estadistico

names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic") #Corregir nombre de columna

temperatura$media_anual <- rowMeans(temperatura [,2:13])
  
temperatura$media_anual <- rowMeans(temperatura [11:21,2:13])

temperatura$media_anual <- rowMeans(temperatura [,2:13])
head(temperatura)
