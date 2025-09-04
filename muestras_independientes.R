data("iris")
boxplot(iris$Sepal.Length~iris$Species)

dat_iris <-subset(iris, Species %in% c("versicolor","virginica"))

# ELiminar un factor que se desecho de la base de datos original
dat_iris$Species <- droplevels(dat_iris$Species)

boxplot(dat_iris$Sepal.Length ~ dat_iris$Species)

#HO = la media de SL de la virginica es mayor que la media de la versicolor

t.test(dat_iris$Sepal.Length ~ dat_iris$Species, 
       alternative = "greater", var.equal =T)

tapply(dat_iris$Sepal.Length, dat_iris$Species, mean)

