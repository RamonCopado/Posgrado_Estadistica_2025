##HW_01

##Laboratorio 1: Empezar con R y RStudio
##Trabajar con datos en R

## Script 4
## 28/8/2025
## Ramón Copado García
## Matricula 1059439

###Parte 1 R y Rstudio
#####Primer contacto con la consola de R .
#####Comencemos a escribir cosas básicas en la consola, usando R como calculadora 
#####científica. Por ejemplo, considere las facturas mensuales de una estudiante 
#####universitaria de la MCF: teléfono celular $ 300, transporte $ 240, 
#####comestibles $ 1527, gimnasio $ 400, alquiler $ 1500, otros $ 1833. 


###Puede usar R para encontrar los gastos totales de la estudiante:

#### Gastos totales
300 + 240 + 1527 + 400 + 1500 + 1833

#####A menudo, será más conveniente crear objetos o variables que almacenen uno o
#####más valores. Para hacer esto, escriba el nombre de la variable, seguido del  
#####operador de asignación <-, seguido del valor asignado. Por ejemplo, podrás  
#####crear un objeto llamado celular para los gastos de facturación de telefonía 
#####celular, después inspecciona el objeto creado.

celular <- 300
celular

#####Todas las declaraciones de R en las que crea objetos, “asignaciones”, tienen 
#####esta forma: objeto <- valor
#####esto significa que asigna un valor a un objeto dado; puede leer la asignación  
#####anterior como celular se le asigna el valor de "300”.
#####Realiza más asignaciones para crear variables de transporte, comestibles,  
#####gimnasio, alquiler y otros con sus montos correspondientes.

transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833

#####Ahora que tiene todas las variables, cree un objeto total con la suma de los gastos:


####Gasto mensual
suma_mensual <- celular + transporte + comestibles + gimnasio + alquiler + otros

suma_mensual

#####Suponiendo que la estudiante tiene los mismos gastos todos los meses, ¿cuánto 
#####gastaría durante un semestre escolar? (suponga que el semestre implica cinco meses).

suma_mensual * 5

#####Manteniendo la misma suposición sobre los gastos mensuales, ¿cuánto gastaría la 
#####estudiante durante un año escolar? (suponga que el año académico es de 10 meses).

suma_mensual * 5 * 2
suma_mensual * 10

###Nombre de los objetos
####Hay ciertas reglas que debe seguir al crear objetos y variables. Los nombres de 
####los objetos no pueden comenzar con un dígito y no pueden contener otros caracteres 
####como una coma o un espacio.

####Los siguientes ejemplos son correctos para el nombre de los objetos.

#####yo_uso_guion_bajo # Correcto
#####otras.personas.usan.punto # Correcto
#####OtrosUsanMayusculas # Correcto

####Los siguientes características en los nombres de los objetos no son aceptados 
####(asignaciones invalidas):

#####no puede iniciar con un número
##### Incorecto 5variable <- 5 

##### no puede iniciar con guión bajo
##### Incorecto _invalid <- 10

##### no puede contener una coma
##### Incorecto my,variable <- 3

##### no puede contener espacios
##### Incorecto my variable <- 1

##### Es correcto pero muy largo:
##### this_is_a_really_long_name <- 3.5
 
##Funciones
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

#Opcional: ve si puedes descubrir cómo mostrar los nombres de las variables 
#debajo de cada una de las barras.


# Ejercicio yo solo graficar y ponerle nombres

nombres <- c("otros", "comestibles", "alquiler", "gimnasio", "celular", 
             "transporte")

# Crear el gráfico de barras con nombres
barplot(gastos_ordenados, names.arg = nombres, col = "green", 
        main = "Gráfico de Gastos", 
        xlab = "Conceptos", 
        ylab = "Monto$")

# Manera de hacerlo en clase
names(gastos_ordenados) <- c("Otros","Comestibles", "Alquiler", "Gimnasio", 
                             "Celular", "Transporte")

barplot(gastos_ordenados, main = "Gastos Mensuales", 
        names.arg=names(gastos_ordenados), col="skyblue")

# Parte 2
#Problema 1:
# Identifique el tipo de variable (cualitativa o cuantitativa) para la lista de 
#preguntas de una encuesta aplicada a estudiantes universitarios en una clase de
#estadística:

#Respuesta:
#Nombre de estudiante.    cualitativa
#Fecha de nacimiento (p. Ej., 21/10/1995).   cuantitativa
#Edad (en años). cuantitativa
#Dirección de casa (por ejemplo, 1234 Ave. Alamo).cualitativa
#Número de teléfono (por ejemplo, 510-123-4567).cualitativa
#Área principal de estudio. cualitativa
#Grado de año universitario: primer año, segundo año, tercer año, último año.cualitativa
#Puntaje en la prueba de mitad de período (basado en 100 puntos posibles).cuantitativa
#Calificación general: A, B, C, D, F. cualitativa
#Tiempo (en minutos) para completar la prueba final de MCF 202.cuantitativa
#Numero de hermanos.cuantitativa

Cualitativa <- c("Nombre de estudiante", "Direccion de casa", "Número telefono", 
                 "Área principal de estudio", "Grado de año universitario",
                 "Calificación general")
Cualitativa

Cuantitativa <- c("Fecha de nacimiento","Edad","Puntaje en la prueba de mitad de período", 
                  "Tiempo", "Numero de hermanos")
Cuantitativa

#Problema 2:
#  Elija un objeto (cualquier objeto, por ejemplo, animales, plantas, países,
#   instituciones, etc.) y obtenga una lista de 14 variables: 
#   7 cuantitativas y 7 categóricas.

#Respuesta:
#Voy a escoger el objegto animales
# Las 7 variables cuantitativas son (con medición numérica):
      # 1.- Peso corporal
      # 2.- Temperatura 
      # 3.- Producción de leche
      # 4.- Número de crías
      # 5.- Altura
      # 6.- Frame
      # 7.- Tasa de crecimiento
# Las 7 variables Cualitativas serán  (describen no se miden numéricamente):
      # 1.- Raza
      # 2.- Color pelaje 
      # 3.- Sexo
      # 4.- Tipo de alimentación
      # 5.- Tipo de expotación (Intensivo ó extensivo)
      # 6.- Presencia o ausencia de cuernos
      # 7.- Tipo de orejas

Cuantitativa_bovinos <- c("Peso corporal", "Temperatura", "Producción de leche",
                          "Número de crías", "Altura", "Frame", "Tasa de crecimiento")
Cuantitativa_bovinos

Cualitativas_bovinos <-c("Raza", "Color pelaje", "Sexo", "Tipo de alimentación",
                         "Tipo de explotación", "Presencia o ausencia de cuernos",
                         "Tipo de orejas")
Cualitativas_bovinos


#Problema 3:
 # Considere una variable con valores numéricos que describen formas electrónicas 
#de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico; 
#3 = mensaje de texto; 4 = Facebook; 5 = blog. ¿Es esta una variable 
#cuantitativa o cualitativa? Explique.

#Respuesta
#Son variables Cualitativa Nominal, Ya que son variables que indican cualidades
#que se expresan con palabrasy cuyas categorías no se ordenan según criterio 
#jerárquicoSe, les asignan valores no numéricos, porque expresan 
#características con palabras.


#Problema 4:
#  Para cada pregunta de investigación, (1) identifique a los individuos de 
#interés (el grupo o grupos que  se están estudiando), (2) identifique la (s) 
#variable (s) (la característica sobre la que recopilaríamos datos) y 
#(3) determine si cada variable es categórico o cuantitativo.                                                                                    
                                                                              
#¿Cuál es la cantidad promedio de horas que los estudiantes de universidades 
#públicas trabajan cada semana?
#Respuesta
#Individuos de interes = Estudiantes de universidades publicas
    #Variable = Cantidad promedio de horas que trabajan cada semana
    #Tipo de variable = Cuantitativa continua ya que se expresa en cantidades 
                     #numéricas y pueden tomar cualquier valordentro de un rango


#  ¿Qué proporción de todos los estudiantes universitarios de México están 
#inscritos en una universidad pública?
#Respuesta
#Individuos de interes = Estudiantes inscritos en universidades de México
#Variable =  pública o privada
#Tipo de variable = Cualitativa nominal, porque las categorías (pública/privada)
                  #no tienen un orden intrínseco y son simplemente nombres o 
                  #etiquetas para la institución. No se puede decir que una es
                  #"mayor" o "menor" que la otra en un sentido numérico, 
                  #solo que son diferentes. 


#  En las universidades públicas, ¿las estudiantes femeninas tienen un promedio
# de CENEVAL más alto que los estudiantes varones?
#Respuesta
#Individuos de interes = Estudiantes de universidades publicas que presentan
                        #el examen CENEVAL.
#Variable= Promedio
#Tipo de variable = Cuantitativa continua,ya que los puntajes pueden tomar 
                  # valores numéricos dentro de un rango y son medibles.   

#  ¿Es más probable que los atletas universitarios reciban asesoramiento 
#académico que los atletas no universitarios?
#Respuesta
#Individuos de interes = Los atletas universitarios
#Variable = Asesoramiento
#Tipo de variable = Cualitativa nominal, es si o no.

#  Si reuniéramos datos para responder a las preguntas de la investigación 
#anterior, ¿qué datos podrían analizarse mediante un histograma? ¿Cómo lo sabes?.
#Respuesta
#Los datos a utilizar serían;
#a frecuencia con la que los atletas (universitarios y no universitarios) usan
    #el asesoramiento académico
#la cantidad de tiempo que dedican al asesoramiento, 
#o el número de horas de estudio adicionales que se brindan a través de este servicio

#Lo se porque lo leí y pregunte que analiza un histograma y resulta que mide
#Frecuencia, tiempo, etc. y me apoye en videos en linea.

