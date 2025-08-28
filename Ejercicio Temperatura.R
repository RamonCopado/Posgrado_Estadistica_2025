# Ramón Copado
# 21/08/2025
# Semana 3

# Importar Datos excel 
temperatura <- read.csv("temperatura.csv")
View(temperatura)

# Inspeccionar mi objeto temperatura
head(temperatura) # Primeras 6 filas
dim(temperatura) #Numero de filas y columnas
names(temperatura) #Nombres de las columnas
str(temperatura) #Estructura del data frame

summary(temperatura) #Resumen estadistico

names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr",
                        "May","Jun", "Jul", "Ago", "Sep", 
                        "Oct", "Nov", "Dic") #Corregir nombre de columna

temperatura$media_anual <- rowMeans(temperatura [,2:13],1)
head(temperatura)

write.csv(temperatura, "temp_final.csv")

temp <- temperatura [, 2:13]

temp <- temperatura[ , 2:13]
temp10 <- temperatura[11:21 , 2:13]
temperatura[2,2]
colores <-c ("navajowhite", "salmon", "skyblue", "yellow")

#Crear un boxplot con las temperaturas de 20 años 2000 a 2020
boxplot(temp, col = colores,
        main = "Comportamiento temperatura (2000 a 2020)",
        xlab = "Meses", 
        ylab = "Temperatura (C)")

#Crear un boxplot con las temperaturas de 10 años 2010 a 2020
boxplot(temp10, col = colores,
        main = "Comportamiento temperatura (2010 a 2020)",
        xlab = "Meses", 
        ylab = "Temperatura (C)")


# Importar datos web 


url <-"https://repodatos.atdt.gob.mx/api_update/senasica
/actividades_inspeccion_movilizacion/29_actividades-inspeccion
-movilizacion.csv"
boxplot(temp, col = colores,
        main = "Comportamiento temperatura (2000 a 2020)", 
        xlab = "Meses", 
        ylab = "Temperatura (C)")

boxplot(temp10, col = colores, 
        main = "Media de temperaturas del 2010 al 2020", 
        xlab = "Meses",
        ylab= "Temperatura (°C)")

# Importar datos web 

url <-"https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv"

url2 <- paste0("https://repodatos.atdt.gob.mx/api_update/",
               "senasica/actividades_inspeccion_movilizacion/",
               "29_actividades-inspeccion-movilizacion.csv")

senasica <- read.csv (url, header = T)
senasica2 <- read.csv (url2, header = T)
head (senasica2[, c(1,3:12)])
View (senasica)
View (senasica2)
View (temp)
View (temp10)
View (senasica)
senasica <- read.csv (url2, header = T)
head (senasica[, c(1,3:12)])
View (senasica)
