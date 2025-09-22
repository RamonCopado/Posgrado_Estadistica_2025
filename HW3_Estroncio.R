#HW 03
#Ramón Copado García
#19/09/2025

#Ejercicio: Comparación de concentraciones de estroncio en cuerpos de agua

#1. Descripción
#Un investigador midió la concentración de estroncio (mg/ml) en cinco cuerpos de
#agua para evaluar si existen diferencias significativas entre ellos. 
#Cada sitio tuvo 6 réplicas (n=6).

#Cuadro 1: Concentración de estroncio (mg/ml) en cinco cuerpos de agua (n = 6).


Estroncio <- read.csv("Estroncio_final.csv", header = T)
View(Estroncio)

Estroncio$Media <- rowMeans(Estroncio [,2:6],1)
head(Estroncio)
write.csv(Estroncio, "Estroncio_final.csv")

Estroncio_final <- Estroncio [, 2:6]

head (Estroncio_final[, c(1,1:5)])
View (Estroncio_final)


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
#install.packages("dplyr")   # Solo la primera vez
library(dplyr)   

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
# Medias de los grupos
medias <- resultado_lsd$means$mediciones
names(medias) <- rownames(resultado_lsd$means)

# Calcular diferencias absolutas
dif_abs <- abs(outer(medias, medias, "-"))
colnames(dif_abs) <- rownames(dif_abs) <- names(medias)

#  Extraer valor LSD
valor_lsd <- resultado_lsd$statistics$LSD

#  Crear matriz booleana: TRUE si diferencia > LSD
sig_dif <- dif_abs > valor_lsd


# Pasar a data.frame
tabla_dif <- as.data.frame(as.table(dif_abs))

# Convertir Var1 y Var2 a caracteres antes de comparar
tabla_dif <- subset(tabla_dif, as.character(Var1) < as.character(Var2))

# Renombrar columnas
colnames(tabla_dif) <- c("Grupo1", "Grupo2", "Diferencia")

# Agregar columnas LSD y significancia
tabla_dif$Diferencia    <- round(tabla_dif$Diferencia, 2)
tabla_dif$LSD           <- round(valor_lsd, 2)
tabla_dif$Significativa <- tabla_dif$Diferencia > valor_lsd

# Mostrar tabla final
tabla_dif


# Determine cuáles pares son significativamente diferentes.
# Mostrar resultados
list(
  medias = round(medias, 2),
  LSD = round(valor_lsd, 3),
  diferencias_absolutas = round(dif_abs, 2),
  significativas = sig_dif)

# Valor LSD
valor_lsd <- resultado_lsd$statistics$LSD

# Pasar a data.frame y filtrar con subset (solo Var1 < Var2)
tabla_dif <- as.data.frame(as.table(dif_abs))


# Renombrar columnas
colnames(tabla_dif) <- c("Grupo1", "Grupo2", "Diferencia")

# Agregar columnas LSD y significancia
tabla_dif$Diferencia   <- round(tabla_dif$Diferencia, 2)
tabla_dif$LSD          <- round(valor_lsd, 2)
tabla_dif$Significativa <- tabla_dif$Diferencia > valor_lsd

# Mostrar tabla final
tabla_dif

#Prueba de Tukey HSD
tukey_res <- TukeyHSD(modelo)
# Ver resultados
print(tukey_res)

##diff: diferencia entre medias de los grupos.
##lwr / upr: intervalos de confianza del 95%.
##p adj: valor p ajustado por Tukey.

#Obtenga el valor crítico; q0,05(k, glerror)

# Grados de libertad residuales
gl <- df.residual(modelo)

# MS_residual
MS_res <- summary(modelo)[[1]]["Residuals", "Mean Sq"]

# Valor crítico t
k <- 5
gl_error <- 25

# Valor crítico q para alfa=0.05
q_crit <- qtukey(0.95, k, gl_error)  # 0.95 porque es unilateral para nivel global 0.05
q_crit

t_crit <- qt(0.975, df = gl)   # 0.975 porque es bilateral a 5%
t_crit
# Calcule la diferencia mínima significativa con Tukey.
# Parámetros
k <- length(levels(grupo))         # número de grupos = 5
n_per_group <- tapply(mediciones, grupo, length)[1]  # 6
gl_error <- df.residual(modelo)    # 25
MS_error <- summary(modelo)[[1]]["Residuals","Mean Sq"]

# Valor crítico q (studentized range)
q_crit <- qtukey(0.95, nmeans = k, df = gl_error)

# Error estándar usado por Tukey (para comparación de medias)
SE <- sqrt(MS_error / n_per_group)

# HSD (mínima diferencia significativa)
HSD <- q_crit * SE

# Mostrar resultados
q_crit
MS_error
SE
HSD

#Compare los resultados con la prueba LSD: ¿los mismos pares resultan significativos?
# ------------------ LSD ------------------
resultado_lsd <- LSD.test(modelo, "grupo", p.adj = "none")
medias <- resultado_lsd$means$mediciones
names(medias) <- rownames(resultado_lsd$means)

# Diferencias absolutas
dif_abs <- abs(outer(medias, medias, "-"))
colnames(dif_abs) <- rownames(dif_abs) <- names(medias)

# Valor LSD
valor_lsd <- resultado_lsd$statistics$LSD

# Tabla LSD con pares en orden alfabético
tabla_lsd <- as.data.frame(as.table(dif_abs))
tabla_lsd <- subset(tabla_lsd, as.character(Var1) < as.character(Var2))
colnames(tabla_lsd) <- c("Grupo1", "Grupo2", "Diferencia")
tabla_lsd$Par <- paste(tabla_lsd$Grupo1, tabla_lsd$Grupo2, sep = "-")
tabla_lsd$Signif_LSD <- tabla_lsd$Diferencia > valor_lsd

# ------------------ Tukey ------------------
tukey_res <- TukeyHSD(modelo)
tabla_tukey <- as.data.frame(tukey_res$grupo)
tabla_tukey$Par <- gsub(" ", "", rownames(tabla_tukey)) # pares como "B-A"
# Reordenar pares alfabéticamente (A-B, no B-A)
tabla_tukey$Par <- sapply(strsplit(tabla_tukey$Par, "-"),
                          function(x) paste(sort(x), collapse = "-"))
tabla_tukey <- aggregate(`p adj` ~ Par, data = tabla_tukey, FUN = mean)
tabla_tukey$Signif_Tukey <- tabla_tukey$`p adj` < 0.05

# ------------------ Comparación final ------------------
comparacion <- merge(tabla_lsd[, c("Par", "Signif_LSD")],
                     tabla_tukey[, c("Par", "Signif_Tukey")],
                     by = "Par", all = TRUE)

comparacion
#R= Sí hay diferencia en los pares

#  Interpretación
# ¿Qué cuerpo de agua presenta las concentraciones más altas?
  #El resultado mostró que tanto por LSD ó por Tukey si hay diferencia significativa

# ¿Qué sitios no difieren entre sí?
    # El resultado de ese análisis muestra que cuando hablamos de los pares de 
    # sitios, Anglers_Cove y Appletree_Lake asi como Appletree_Lake y Beaver_Lake,
    # que No hay significancia estadistica P<0.025 entre ellos y que el par de Sitios:
    # Anglers_Cove y Beaver_Lake no tienen diferencia significativa P<0.05 entre elos

# Desde el punto de vista ambiental, ¿qué implicaciones podrían tener estas diferencias en la
  #calidad del agua?
#Estas diferencias entre las comparaciones no hay un efecto grave en toma de deciciones 
#ya que es solo agua en diferentes partes, pero cabe destacar que si fuera agua ya
#lista parta hacer algun tipo de medicina o algo en el cuerpo humano si se tendria que
#especificar el P<0.025, si esos cuerpos de agua fueran rios o se utilizaria para 
#los animales o de aguanormal para uso diario el p<0.01, esto no lleva a que solo
#posiblemente rock_River seria el más contaminado y hay que hacer otro analisis 
#estadistico cambiando el valor de P.





 
