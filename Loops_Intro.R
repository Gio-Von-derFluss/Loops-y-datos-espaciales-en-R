#Modificado del Curso de programación en R nivel intermedio-avanzado 
# autor: Yovanny Duran

#######################################
##### Loops                         ###
#######################################

#Los loops son de gran utilidad para replicar instrucciones n veces. En R, es posible realiazar loops mediante las funciones (for), (while) y (repeat), los cuales pueden tener condiciones adicionales como if else, break, next, entre otros. Exploremos un poco cada uno:

#1.if/else

c <- (3) #asigno 3 a c

if ( c <= 2) { #Si c es mayor o igual a 2 imprima la condición de, de lo contrario se imprimira la condición de else
  print ("Mayor/igual a dos")
} else {
  print ("Menor/igual a dos")
}

c <- (6) #asignar 6 a c

if (c <= 2) { #Si se cumple la condicion de if sera mostrado su print, tambien hay 2 condiciones intermedias y si ninguna se cumple se ejecutara el print de else
  print ("Valor numérico menor/igual a dos")
} else if (2 < c & c <= 5) { 
  print("Valor numerico entre 3 y 5")
} else if (5 < c & c < 8) { 
  print ("Valor numérico entre 6 y 7")
} else { 
  print ("Mayor/igual a 8 ")
}

#2. for/while

for (i in 1:10) { #concatena e imprime "numero" acompañado del bucle realizado por "for" separado por un espacio
  cat("Número", i, " ")        
}

a <- 1 #asigna 1 a a
b <- 2 #asigna 2 a b
for (i in 1:5) { #suma a,b y el numero del loop de "for"
  print (a+b+i)
}

c <- 0 #asigna 0 a c

while (c <= 10) { #Hasta que c sea menor o igual a 10 imprimo c, y le voy sumando 1 en cada iteracion, c sera 11
  print (c)  #si elimino print, no se mostara desde 0     
  c <- c + 1  
}
c

#Ejercicio con for
c <- 0
for (i in 1:11) { #imrpimir c e ir sumando 1 en cada iteracion hasta que sea menor o igual a 11
  print (c)
  c <- c+1                 
}
c

# 3. repeat/break/next

a <- 0 #asigno 0 a a

repeat { #repite a+1 hasta que llegue a 10 y lo imprime      
  a <- a + 1
  print (a)
  if (a >= 10) #funciona como un while
    break
}

for (i in 1: 100) { #si i es menor a 10, no lo imprima
  if (i > 10)
    print(i + 2) #suma 2 en cada i
  next
  print (i)         
}

#Ejercicio: extraer los numeros pares del 1 al 100
a <- 0

repeat { #repito la suma de 2+a hasta que sea mayor-igual a 100
  a <- a + 2
  print (a)
  if (a >= 100)         
    break
}

c <- 0

for (i in 1:50) { #sumo i con si mismo hasta que sea menor-igual a 100
  if (i <= 100)
    print(i + i)
  next
}

c =0

for (i in 1:50) { #le sumo 2 a c en cada iteracion
  c <- c+2
  print(c)       
}

c <- 0

while (c <= 98) { #hasta que c sea menor-igual a 98, sume 2 a c e imprima
  c <- c + 2
  print (c) 
}

# 4. Funciones
#grupo de instrucciones que opera en un objeto

Celsius_a_fahrenheit <- function (temp_C) { #funcion que recibe temperatura en celsius, la convierte en fahrenheit y la devuelve
  temp_F <- (temp_C * 1.8) + 32
  return (temp_F)
}
Celsius_a_fahrenheit(30)

Celsius_a_kelvin <- function (temp_C) { #funcion que recibe temperatura en celsius, la convierte en kelvin y la devuelve
  temp_k <- ( temp_C + 273.15) #por que no puedo ver temp_F si lo llamo?
  return (temp_k)
}

fahrenheit_a_celsius <- function (temp_F) {
  temp_C <- (temp_F - 32)*5/9 #funcion que recibe temperatura en fahrenheit, la convierte en celsius y la devuelve
  return (temp_C)
}
fahrenheit_a_celsius(40)

huevo_cocido <- function (temperatura){ #funcion que recibe temperatura de coccion de un huevo y te diceen cuanto tiempo estara
  tiempo <- 0
  while (temperatura < 100 && tiempo < 100) {
    tiempo <- tiempo + 1
    temperatura <- temperatura + 1
  }
  print ( paste ("Su huevo estara listo en", tiempo, "segundos o", tiempo/60, "minutos", sep = " "))
}
huevo_cocido(20)
#tarea
#poner condiciones para saber si está quemado, está crudo, está cocido,crudo o cocido,(3)
#hacer una funcion que reciba 2 argumentos (time,t), que reporte cuando el huevo esté crudo
#cocido o quemado
condicion_huevo <- function (temperatura,tiempo){ #recibe temperatua y tiempo, dependiento de las condiciones te dira el estado en el que se encuentra el huevo
  if (temperatura <= 49 & tiempo <= 60) {
    print("su huevo esta crudo")
  } else if (temperatura >= 50 & temperatura < 70 & tiempo >= 3 & tiempo <=5) { 
    print("su huevo esta cocido")
  } else   { 
    print("Su huevo esta quemao")
  }
}
condicion_huevo(60,3)

# 5.apply/lapply/sapply

m <- matrix(data = (1: 10), nrow=5, ncol  = 2)

apply(m,c(1,2),mean) #aplico la media a las filas y columnas de la matriz m

lm <- as.list(m)
lapply(lm,sqrt) #aplico la raiz cuadrada de la lista lm

vm<- sapply(lm, sqrt) #aplico la raiz cuadrada en la lista lm y la devuelvo como un vector

# cargue el data "cars" y cree una nueva columna que rellene con "muy rapido" si la velocidad del modelo es mayor 15 o rellene con "muy lento" si es menor a 15

data <- cars
for (i in 1:50) { #creo una columna velocidades que sera llenada con muy rapido si la columna speed es mayor de 15 y muy lento si speed es menor o igual a 15
  velocidades <- c("muy lento", "muy rapido")
  velocidades[1] -> data[data$speed <= 15, paste("velocidades")]  
  velocidades[2] -> data[data$speed > 15, paste("velocidades")]    
}

# Cree un dataframe con 1000 filas y 2 columnas, reste la primer columna a la
# segunda y cree una nueva columna con el resultado. Haga este ejercicio usando
# "for" y apply.

df <- as.data.frame(matrix( data = rnorm(2000) , nrow=1000, ncol =2))

for (i in df) { #aplico una resta por columna creando una funcion propia que usare en apply
  my_func <- function(u){  
    u <- df[,2]-df[,1]
  }
  df$resta <- apply(df, 2, FUN = my_func)
  
}


# Loops en datos espaciales -----------------------------------------------

library(raster)
library(sp)
library(rgdal)
library(ggplot2)
library(rgdal)
library(gtools)

setwd("C:/Users/yovan/Desktop/Tesis/R/mapas") #Escriba el directorio de trabajo en donde esten los mapas, en este caso, mapas de temperatura mensual

temp <- list.files(pattern=".tif") #Con esta funcion, R leera solamente los archivos .tif que esten en el directorio de trabajo

t <- mixedsort(temp) #En este caso, R leera los datos en orden numerico, asi que 1978_10 va primero que 1978_2, es por eso que utilizaremos la funcion mixedsort para ordenarlos de forma correcta

t <- t[1:10]
tempe <-  lapply(t, raster) #Con la funcion lapply aplicamos una funcion, en este caso raster(), sobre varios objetos y creamos una lista

plot(tempe[[1]]) #Siempre es bueno revisar lo que hemos creado, note que utilizamos los corchetes dobles [[]] ya que es una lista

res(tempe[[1]]) #con esta funcion puede revisar la resolucion espacial del objetvo, este mapa tiene una resolucion aproximada de 1km2, que es exactamente 0.01 grados

tempe[[1]] #Ademas, puede revisar las dimensiones geográficas del mapa. Las dimensiones de este mapa son 2136 y 1800, los cuales corresponden a los valores de longitud o "x" y latitud o "y" respectivamente. Puede cambiar el uno por otro valor del 1 al 10 para revisar otro mapa

#Podemos realizar algunas funciones sobre nuestros mapas y obtener un mapa nuevo, por ejemplo, hacer un mapa promedio de todos nuestros mapas

stack_temp <- stack(tempe) #Primero vamos a agrupar todos nuestros mapas, las dimensiones ahora seran 2136 1800 10

mean_temp <- mean(stack_temp) #Simplemente utilizando la funcion mean() obtendremos el mapa con los valores promedio de 10 meses del año 1978
plot(mean_temp)

#Los mapas pueden ser convertidos en data frames para poder extraer los valores y trabajar en ellos
df_temp <- as.data.frame(rasterToPoints(tempe[[1]], spatial = TRUE)) #La primera columna son los valores de temperatura en grados celcius,la columna "x" y "y" son los valores de longitud y latitud

plot(df_temp$x, df_temp$y) #Puede graficar solamente las coordenadas con la funcion convencional de graficar para ver la distribucion de cada punto

#Ahora utilizaremos un loop para realizar operaciones en cada punto del mapa. Este mapa consta de 1322144 observaciones o pixeles

for (i in 1:100) { #Podemos utilizar el numero de observaciones como numero de iteraciones, ya que en este caso queremos realizar acciones en cada pixel, pero en este caso, solo realizaremos acciones el los primeros 100 datos
  print(sum(df_temp[i,1],100)) #Le sumaremos 100 a cada valor de temperatura
}

#Si queremos guardar los resultados obtenidos en el loop, podemos almacenar cada iteracion en un vector vacio de la siguiente forma
vector_1 <- numeric()

for (i in 1:100) { 
  vector_1[i] <- sum(df_temp[i,1],100) 
}
vector_1

#Aunque en ocasiones, queremos realizar loops en varios mapas, es por esto que tenerlos en listas puede facilitar la realizacion de loops. En el siguiente ejemplo vamos a convertir todos los mapas en data frames y guardar los data frames en una lista
vector_2 <- list()

for (i in 1:length(tempe)) { #esto seria igual a 1:10
  vector_2[[i]] <- as.data.frame(rasterToPoints(tempe[[i]], spatial = T)) #nuestra lista tendra i objetos, que en esta ocasion es 10
}

#En el siguiente ejemplo seleccionaremos solo la columna de temperatura para crear un data frame que consista de los datos de temperatura de cada mapa en diferentes columnas.
# Para esto crearemos objetos temporales creados dentro de un loop que nos servira para almacenar temporalmente datos que podremos ir guardando en el vector final. Al final del loop, este objeto temporal tendra los datos que se le asignaron durante la ultima iteracion.

vector_3 <- matrix(ncol = 10, nrow = 1337916) #el numero de columnas y filas debemos conocerlo para crear nuestra matriz vacia
for (i in 1:length(tempe)) { #esto seria igual a 1:10
  obj_temporal <- as.data.frame(rasterToPoints(tempe[[i]] , spatial = T)) 
  vector_3[,i] <- obj_temporal[,1]
}

vector_3.1 <- as.data.frame(vector_3) #convertimos nuestra matriz en un data frame
