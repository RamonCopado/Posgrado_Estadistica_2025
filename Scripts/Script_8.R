#Script 8
#25/09/2025


##REGRESION LINEAL SIMPLE

#datos
datos<-data.frame(trigo = c(30,28,32,25,25,25,22,24,35,40),
                  harina = c(25,30,27,40,42,40,50,45,30,25))
datos
sumxi_yi <- sum(datos$trigo*datos$harina)
nxy<-length(datos$trigo)*mean(datos$trigo)*mean(datos$harina)
sumxi_yi-nxy

xi2 <-sum(datos$trigo^2)
nx2<-length(datos$trigo)*mean(datos$trigo)^2 ##SACAR N

b1 <- (sumxi_yi-nxy)/(xi2-nx2)
b1

b0 <- mean(datos$harina)-b1*mean(datos$trigo)
b0

fit.lm<-lm(datos$harina ~ datos$trigo)
summary(fit.lm)
anova(fit.lm)


# El cuadrado de este valor de anova nos dice que es lineal si se acerca a 1
# Adjusted R-squared:  0.6824 en este caso fue 0.8260751
#Valor r y Fuerza de correlación
# 0.0 <- 0.1  No hay correlación
# 0.1 <- 0.3  Poca correlación
# 0.3 <- 0.5  Correlación media
# 0.5 <- 0.7  Correlación alta
# 0.7 <- 1    Correlación muy alta


#library (lmtest)

bptest(fit.lm) #DETERMINAR SI HAY HOMOCEDASTICIDAD


##HOMEGENEIDAD
fit.lm$model
fit.lm$coefficients
fit.lm$residuals
mean(fit.lm$residuals)
#SI ES CERO

datos$yprima <- 74.11512  - -1.353675 *datos$trigo
datos$recta <- fit.lm$fitted.values
datos$yprima <- b0  + b1 *datos$trigo
datos$residuales <- datos$harina-datos$recta
SSE <- sum(datos$residuales^2)
SSE/8
sqrt(SSE/8)
