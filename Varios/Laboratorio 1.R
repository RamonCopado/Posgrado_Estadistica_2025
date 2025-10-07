#HW_01

#Laboratorio 1: Empezar con R y RStudio
#Trabajar con datos en R

# Script 4
# 28/8/2025
# Ramón Copado García
# Matricula 1059439

#Parte 1 R y Rstudio
#Primer contacto con la consola de R .
#Comencemos a escribir cosas básicas en la consola, usando R como calculadora 
#científica. Por ejemplo, considere las facturas mensuales de una estudiante 
#universitaria de la MCF: teléfono celular $ 300, transporte $ 240, 
#comestibles $ 1527, gimnasio $ 400, alquiler $ 1500, otros $ 1833. 


#Puede usar R para encontrar los gastos totales de la estudiante:

# Gastos totales
300 + 240 + 1527 + 400 + 1500 + 1833

#A menudo, será más conveniente crear objetos o variables que almacenen uno o
#más valores. Para hacer esto, escriba el nombre de la variable, seguido del  
#operador de asignación <-, seguido del valor asignado. Por ejemplo, podrás  
#crear un objeto llamado celular para los gastos de facturación de telefonía 
#celular, después inspecciona el objeto creado.

celular <- 300
celular

#Todas las declaraciones de R en las que crea objetos, “asignaciones”, tienen 
#esta forma: objeto <- valor
#esto significa que asigna un valor a un objeto dado; puede leer la asignación  
#anterior como celular se le asigna el valor de "300”.
#Realiza más asignaciones para crear variables de transporte, comestibles,  
#gimnasio, alquiler y otros con sus montos correspondientes.

transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833

#Ahora que tiene todas las variables, cree un objeto total con la suma de los gastos:


#Gasto mensual
suma_mensual <- celular + transporte + comestibles + gimnasio + alquiler + otros

suma_mensual

#Suponiendo que la estudiante tiene los mismos gastos todos los meses, ¿cuánto 
#gastaría durante un semestre escolar? (suponga que el semestre implica cinco meses).

suma_mensual * 5

#Manteniendo la misma suposición sobre los gastos mensuales, ¿cuánto gastaría la 
#estudiante durante un año escolar? (suponga que el año académico es de 10 meses).

suma_mensual * 5 * 2
suma_mensual * 10

#Nombre de los objetos
#Hay ciertas reglas que debe seguir al crear objetos y variables. Los nombres de 
#los objetos no pueden comenzar con un dígito y no pueden contener otros caracteres 
#como una coma o un espacio.

#Los siguientes ejemplos son correctos para el nombre de los objetos.

#yo_uso_guion_bajo # Correcto
#otras.personas.usan.punto # Correcto
#OtrosUsanMayusculas # Correcto

#Los siguientes características en los nombres de los objetos no son aceptados 
#(asignaciones invalidas):

# no puede iniciar con un número:
 #Incorecto 5variable <- 5 

# no puede iniciar con guión bajo:
 #Incorecto _invalid <- 10

# no puede contener una coma:
 #Incorecto my,variable <- 3

# no puede contener espacios:
 #Incorecto my variable <- 1

# Es correcto pero muy largo:
 #this_is_a_really_long_name <- 3.5
 
#Funciones
# R tiene muchas funciones [Crawley, 2007, Field et al., 2012, R Core Team, 2016]. 
# Para usar una función debes escribir su nombre seguido de paréntesis. Dentro del
# paréntesis se establece una entrada. La mayoría de las funciones producirán 
#algún tipo de salida:
 
    # Valor absoluto (absolute value)
    abs(10)
    abs(-4)

     # Raíz cuadrada (square root)
    sqrt(9)

     # Logáritmo natural (natural logarithm)
    log(2)



#Este es un comentario
#este es otro comentario

2 * 9
4 + 5 # también se puede colocar comentario

#Detectar mayúsculas y minúsculas

celular <- 300
Celular <- -300
CELULAR <- 8000

celular+Celular
CELULAR-celular

# Documentación acerca de la función abs

help(abs)
?abs # Alternativamente

# Documentación acerca de la función mean

help(mean)
?mean # Alternativamente

# buscar absolute
help.search("absolute")
??absolute # Alternativamente

# Autoevaluación
#Toma los objetos creados de la estudiantes (i.e variables) transporte, 
#comestibles, gimnasio,alquiler y otros y escribamos dentro de la función de 
#combinación c() para crear un vector llamado gastos:

  gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)
gastos


#Ahora, use la función gráfica barplot() para producir un diagrama de barras de gastos:
barplot(gastos)

#Descubra cómo utilizar sort() para ordenar los elementos en la variable gastos, con el fin de
#organizar elementos en gastos en orden decreciente.
barplot(gastos)

sort(gastos)
barplot(gastos)
barplot(sort(gastos))
gastosordenados <- c(sort(gastos))

barplot(gastosordenados)

#Descubra cómo utilizar sort() y barplot() para producir un gráfico de barras con barras en
#orden decreciente
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

