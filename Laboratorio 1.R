300+240+1527+400+1500+1833
celular <- 300
celular
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
5800*5*2

abs(10)
abs(-4)
sqrt(9)
log(2)

#Este es un comentario
#este es otro comentario

2 * 9
4 + 5 # también se puede colocar comentario

celular <- 300
Celular <- -300
CELULAR <- 8000

celular+Celular
CELULAR-celular

help(abs)
help(mean)
?mean
?abs
help.search("absolute")
??absolute

gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros) 

gastos

barplot(gastos)

sort(gastos)
barplot(gastos)

barplot(sort(gastos))

gastosordenados <- c(sort(gastos))

barplot(gastosordenados)


?sort
gastos_ordenados <- sort(gastos, decreasing = TRUE)
barplot(gastos_ordenados)

# Ejercicio yo solo graficar y ponerle nombres

nombres <- c("otros", "comestibles", "alquiler", "gimnasio", "celular", "transporte")

# Crear el gráfico de barras con nombres
barplot(gastos_ordenados, names.arg = nombres, col = "green", main = "Gráfico de Gastos", xlab = "Conceptos", ylab = "Monto$")

# Manera de hacerlo en clase
names(gastos_ordenados) <- c("Otros","Comestibles", "Alquiler", "Gimnasio", "Celular", "Transporte")
barplot(gastos_ordenados, main = "Gastos Mensuales", names.arg=names(gastos_ordenados), col="skyblue")

