
# Cargamos MIRT y el paquete para poner las etiquetas encima de las curvas
library(mirt)

# Cargamos la función. Requiere el paquete direct.labels
source("irt_plotter.r")

# Hacemos el IRT
x <- mirt(Science, 1, SE = TRUE)

# Miramos que variables tiene Science
colnames(Science)
# "Comfort" "Work" "Future" "Benefit"

# Definimos variables auxiliares
todos_los_nombres <- colnames(Science)
nombres_a_mostrar <- c("Primera var", "Segunda var", "Tercera var", "Cuarta Var")
nombre_curvas <- c("0", "1", "2", "3")




######################### DIFERENTES PRUEBAS ###################################

# Ahora llamamos a la función de arriba. Plot de una variable
plot_mirt(x, c("Work"), c("Soy una variable"), titulo = "Hola")
plot_mirt(x, c("Work"), c("Soy una variable"), titulo = "")
plot_mirt(x, c("Work"), c("Soy una variable")) # Si no ponemos título, no sale

# Cambiamos el nombre de las curvas de P1,...,P4 a 0,..,3
plot_mirt(x, c("Work"), c("Soy una variable"), nombre_curvas = c(0, 1, 2, 3))
plot_mirt(x, c("Work"), c("Soy una variable"),
          nombre_curvas = c("Hello", "This", "Works", "nicely"))

# Dos variables
plot_mirt(x, c("Work", "Benefit"))
plot_mirt(x, c("Work", "Benefit"), c("Soy una variable", "Yo otra"))

# Dos variables una encima de la otra (una columna, dos filas -> c(1,2))
plot_mirt(x, c("Work", "Benefit"), c("Soy una variable", "Yo otra"),
          layout = c(1, 2))
# Todas
plot_mirt(x, todos_los_nombres, todos_los_nombres)
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(1, 4))
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(4, 1))
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(3, 2))

# asp controla la proporción entre alto y ancho de la imagen (1, alto y ancho 
#  iguales)
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(2, 1), asp = 1)
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(3, 1), asp = 1)

# lwd controla el grosor de la línea. lwd es 1 por defecto
plot_mirt(x, todos_los_nombres, todos_los_nombres,
          layout = c(4, 1), asp = 1, lwd = 2)


# Estilo de barra
plot_mirt(x, todos_los_nombres, todos_los_nombres,
          res = c(10, 10), layout = c(2, 2), lwd = 3)

plot_mirt(x, todos_los_nombres, todos_los_nombres,
          res = c(10, 10), layout = c(2, 2), lwd = 3,
          tam_letra_barra = 1.5, color_barra = "green")

# Todas las modificaciones en conjunto con nombres diferentes
plot_mirt(x, todos_los_nombres, nombres_a_mostrar,
          nombre_curvas = nombre_curvas,
          tam_letra_barra = 1.5, color_barra = "white", lwd = 2,
          layout = c(3, 3), asp = 0.6)

# Sacamos el fichero en SVG, imagen vectorial (a lo excel). Podemos editarla con
# inkscape por ejemplo.
# Ahora le decimos en "res" que queremos una imagen de 20x20 pulgadas
plot_mirt(x, todos_los_nombres, nombres_a_mostrar,
          nombre_curvas = nombre_curvas,
          tam_letra_barra = 1.5, color_barra = "white", lwd = 2,
          layout = c(3, 3), asp = 0.6, res = c(20, 20),
          nombre_svg = "final.svg")
