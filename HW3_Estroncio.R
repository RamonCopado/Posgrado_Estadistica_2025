#HW 03
#Ramón Copado García
#19/09/2025

#Ejercicio: Comparación de concentraciones de estroncio en cuerpos de agua

#1. Descripción
#Un investigador midió la concentración de estroncio (mg/ml) en cinco cuerpos de
#agua para evaluar si existen diferencias significativas entre ellos. 
#Cada sitio tuvo 6 réplicas (n=6).

#Cuadro 1: Concentración de estroncio (mg/ml) en cinco cuerpos de agua (n = 6).

Estroncio <- read_excel("C:/Users/Ramon/Desktop/forestales/Estroncio.xlsx", 
                              col_types = c("text", "numeric", "numeric", 
                                            "numeric", "numeric", "numeric"))
View(Estroncio)

Estroncio$Media <- rowMeans(Estroncio [,2:6],1)
head(Estroncio)

write.csv(Estroncio, "Estroncio_final.csv")

Estroncio_final <- Estroncio [, 2:6]

head (Estroncio_final[, c(1,1:5)])
View (Estroncio_final)



#Lo siguiente es para poder usar los numeros como factores
#Estroncio$Muestra <-as.factor(Estroncio$Muestra)
#Estroncio$Graysons_Pond <-as.factor(Estroncio$Graysons_Pond)
#Estroncio$Beaver_Lake <-as.factor(Estroncio$Beaver_Lake)
#Estroncio$Anglers_cove <-as.factor(Estroncio$Anglers_cove)
#Estroncio$Appletree_Lake <-as.factor(Estroncio$Appletree_Lake)
#Estroncio$Rock_River <-as.factor(Estroncio$Rock_River)

summary(Estroncio_final)

# Inspeccionar mi objeto Estroncio
head(Estroncio_final) # Primeras 6 filas
dim(Estroncio_final) #Numero de filas y columnas
names(Estroncio_final) #Nombres de las columnas
str(Estroncio_final) #Estructura del data frame


summary(Estroncio_final) #Resumen estadistico

colores <-c ("navajowhite", "salmon", "skyblue", "yellow","green")

#Crear un boxplot con las Muestras de Estroncio
boxplot(Estroncio_final, col = colores,
        main = "Cuerpos de agua",
        xlab = "Lugares", 
        ylab = "Concentracion (mg/ml)")

#1.1. Planteamiento del problema
#El resumen estadistico anterior muestra las concentraciones de estroncio (mg/ml)
#registradas en cinco cuerpos de agua: Grayson's Pond, Beaver Lake, Angler's Cove,
#Appletree Lake y Rock River. Cada sitio contó con seis repeticiones independientes. 
#Se observa que Rock River presenta las concentraciones más elevadas,
#con valores consistentemente superiores al resto de los sitios. En contraste, 
#Grayson's Pond mostró los niveles más bajos, mientras que Beaver Lake, 
#Angler's Cove y Appletree Lake presentaron valores intermedios y relativamente 
#cercanos entre sí.
#Este patrón sugiere la existencia de diferencias significativas entre sitios, 
#lo cual motiva la aplicación de un ANOVA de una vía seguido de pruebas 
#post-hoc (LSD y Tukey HSD) para identificar con precisión qué grupos difirieron
#estadísticamente en sus medias.

# 1.2. Preguntas
# Hipótesis del ANOVA: Plantee las hipótesis nula y alternativa para este análisis.

## H0; No hay diferencia significativa (P<0.05) en los niveles de concentración (mg/ml)
      #de estroncio entre los sitios del muestreo.
## Ha; Existe diferencia significativa (P<0.05) en los niveles de concentración (mg/ml)
      #de estroncio entre los sitios de muestreo

#Cálculo del ANOVA: Con los datos proporcionados, realice el análisis de varianza 
#(ANOVA de una vía) y reporte la tabla de anova.

        # Crear un conjunto de datos de ejemplo
grupo <- factor(rep(c("Graysons_Pond", "Beaver_Lake", "Anglers_Cove", 
                      "Appletree__Lake", "Rock_River"), each = 6))  # Cinco grupos, 6 observaciones por grupo
mediciones <- c(28.2,	33.2,	36.4,	34.6,	29.1,	31,
                39.6,	40.8,	37.9,	37.1,	43.6,	42.4,
                46.3,	42.1,	43.5,	48.8,	43.7,	40.1,
                41,	44.1,	46.4,	40.2,	38.6,	36.3,
                56.3,	54.1,	59.4,	62.7,	60,	57.3)
                
# ANOVA
modelo <- aov(mediciones ~ grupo)

# Resumen
summary_anova <- summary(modelo)

# Ver tabla ANOVA
summary_anova[[1]]                

# Forma 1: última fila
MS_residual <- summary_anova[[1]]$`Mean Sq`[nrow(summary_anova[[1]])]

# Forma 2: por nombre de fila
MS_residual <- summary_anova[[1]]["Residuals", "Mean Sq"]

# Forma 3: con tail()
MS_residual <- tail(summary_anova[[1]]$`Mean Sq`, 1)

MS_residual
# [1] 9.7652

        # Crear el data frame
datos <- data.frame(grupo, mediciones)

        # Realizar ANOVA de una vía
anova_resultado <- aov(mediciones ~ grupo, data = datos)

        # Mostrar el resumen del ANOVA
summary(anova_resultado)

#Reporte de Tabla
#La tabla del resumen estadistico refleja que si hay diferencia significativa entre
# los sitios de muestreo con un P=3.95e-12<0.05 

# Se rechaza HO

# Prueba LSD

# Extraer los resultados del ANOVA
summary_anova <- summary(anova_resultado)
MS_residual <- summary_anova[[1]]$`Mean Sq`[9.77]  # Media cuadrática residual
df_residual <- summary_anova[[1]]$Df[25]  # Grados de libertad residuales
n <- 6  # Número de observaciones por grupo (suponiendo que es equilibrado)

# Valor t para un nivel de confianza del 95% y grados de libertad residuales
t_value <- qt(0.975, df_residual)

# Calcular el LSD
LSD <- t_value * sqrt(2 * MS_residual / n)
LSD # LSD determinar el valor
qt(.975,25)

# Comparaciones entre las medias de los grupos
# Usamos la función pairwise.t.test para obtener las diferencias de medias entre pares
comparaciones <- pairwise.t.test(datos$mediciones, datos$grupo, p.adjust.method = "none")

# Mostrar las comparaciones y ver si las diferencias son mayores que el LSD
comparaciones$p.value

#COMPARANDO CON OTRO PAQUETE SEGUN LA RED

# install.packages("agricolae")

library(agricolae)

# Datos
grupo <- factor(rep(c("Graysons_Pond", "Beaver_Lake", "Anglers_Cove", 
                      "Appletree__Lake", "Rock_River"), each = 6))
mediciones <- c(28.2, 33.2, 36.4, 34.6, 29.1, 31,
                39.6, 40.8, 37.9, 37.1, 43.6, 42.4,
                46.3, 42.1, 43.5, 48.8, 43.7, 40.1,
                41, 44.1, 46.4, 40.2, 38.6, 36.3,
                56.3, 54.1, 59.4, 62.7, 60, 57.3)

# ANOVA
modelo <- aov(mediciones ~ grupo)

# Prueba LSD
resultado_lsd <- LSD.test(modelo, "grupo", p.adj = "none")


# Mostrar resultados
print(resultado_lsd)

# Medias por Sitio
medias <- tapply(mediciones, grupo, mean)
medias
# 1. Medias de los grupos
medias <- resultado_lsd$means$mediciones
names(medias) <- rownames(resultado_lsd$means)

# 2. Calcular diferencias absolutas
dif_abs <- abs(outer(medias, medias, "-"))
colnames(dif_abs) <- rownames(dif_abs) <- names(medias)

# 3. Extraer valor LSD
valor_lsd <- resultado_lsd$statistics$LSD

# 4. Crear matriz booleana: TRUE si diferencia > LSD
sig_dif <- dif_abs > valor_lsd

#install.packages("dplyr")   # Solo la primera vez
library(dplyr)     AQUI VOY
# Determine cuáles pares son significativamente diferentes.
# Mostrar resultados
list(
  medias = round(medias, 2),
  LSD = round(valor_lsd, 3),
  diferencias_absolutas = round(dif_abs, 2),
  significativas = sig_dif)

# Convertir matriz a tabla tidy
tabla_dif <- as.data.frame(as.table(dif_abs)) |>
  filter(Var1 < Var2) |>
  rename(Grupo1 = Var1, Grupo2 = Var2, Diferencia = Freq) |>
  mutate(
    Diferencia = round(Diferencia, 2),
    LSD = round(valor_lsd, 2),
    Significativa = Diferencia > valor_lsd
  )

#Graysons_Pond tiene diferencia significativa con todos
#Beaver_Lake tiene diferencia significativa con: Anglers_Cove, Rock_River y Graysons_Pond
#Anglers_Cove tiene diferencia significativa con: Beaver_Lake, Rock_River y Graysons_Pond
#


colores <-c ("navajowhite", "salmon", "skyblue", "yellow","green")

#Crear un boxplot con las Muestras de Estroncio
boxplot(Estroncio_final, col = colores,
        main = "Cuerpos de agua",
        xlab = "Lugares", 
        ylab = "Concentracion (mg/ml)")





# Realizar la prueba post-hoc de Tukey
tukey_resultado <- TukeyHSD(anova_resultado)

# Mostrar el resultado de Tukey
summary(tukey_resultado)






# Prueba Tukey
sqrt((2*0.3859)/32)*qtukey(.95, nmeans = 3, df = 93) #diferencia mínima de las                                                          medias que debe existir



#Gráficar con Tukey

TukeyHSD(crop.aov)#aqui si hay diferencias como en el LSD
plot(TukeyHSD(crop.aov))




modelo_anova <- aov(Estroncio$Muestra ~ Estroncio_final$Graysons_Pond+
                      Estroncio_final$Beaver_Lake+Estroncio_final$Anglers_Cove+
                      Estroncio_final$Appletree_Lake+Estroncio_final$Rock_River,
                      data = Estroncio_final)
summary(modelo_anova)








#Prueba ANOVA
#Estroncio_final$Graysons_Pond <-as.factor(Estroncio_final$Graysons_Pond)
#Estroncio_final$Beaver_Lake <-as.factor(Estroncio_final$Beaver_Lake)
#Estroncio_final$Anglers_Cove <-as.factor(Estroncio_final$Anglers_Cove)
#Estroncio_final$Appletree_Lake <-as.factor(Estroncio_final$Appletree_Lake)
#Estroncio_final$Rock_River <-as.factor(Estroncio_final$Rock_River)
#Estroncio_final$Muestra <-as.factor(Estroncio_final$Muestra)

summary(Estroncio_final)

colores <-c ("navajowhite", "salmon", "skyblue", "yellow","green")

#Crear un boxplot con las Muestras de Estroncio
boxplot(Estroncio_final, col = colores,
        main = "Cuerpos de agua",
        xlab = "Lugares", 
        ylab = "Concentracion (mg/ml)")








Estroncio_final.aov<-aov(Estroncio_final$Graysons_Pond+Estroncio_final$Beaver_Lake+
                         Estroncio_final$Anglers_Cove+Estroncio_final$Appletree_Lake+
                         Estroncio_final$Rock_River)
summary(Estroncio_final.aov)





Se rechaza H0
Prueba LSD

