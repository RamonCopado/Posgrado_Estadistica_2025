# setosa
setosa <- subset(iris, Species =="setosa")
View (setosa)
mean(setosa$Sepal.Width)

# mu = 3.9

#HO = La diferencia entre las medias es cero = 3.9
#H1 = La diferencia entre media teorética y expiremental diferente a cero = 
      #diferente a 3.9

t.test(setosa$Sepal.Width, mu = 3.9)
#Aceptamos H1

t.test(setosa$Sepal.Width, mu = 3.5)
#Aceptamos HO

t.test(setosa$Sepal.Width, mu = 3.6)
#Aceptamos H1