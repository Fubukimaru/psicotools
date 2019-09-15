# TODO: Ordenar plots
# TODO: Titular en blanco
# TODO: Números curva más separados
# TODO: Fijar tamaño salida (SVG?)

# Cargamos MIRT y el paquete para poner las etiquetas encima de las curvas
library(mirt)

# Cargamos la función
source("irt_plotter.r")

# Hacemos el IRT
x <- mirt(Science, 1, SE = TRUE)


# Miramos que variables tiene Science
colnames(Science)
# "Comfort" "Work" "Future" "Benefit"

# Definimos variables auxiliares
todos_los_nombres <- colnames(Science)
nombres <- c("patito", "cosquillas", "holita", "soy un titulo")
nombre_curvas <- c(":(", ":|", ":)", ":D")

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

# asp controla la proporción entre alto y ancho de la imagen (1, alto y ancho 
#  iguales)
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(2, 1), asp = 1)
plot_mirt(x, todos_los_nombres, todos_los_nombres, layout = c(3, 1), asp = 1)

# lwd controla el grosor de la línea. lwd es 1 por defecto
plot_mirt(x, todos_los_nombres, todos_los_nombres,
          layout = c(4, 1), asp = 1, lwd = 2)

# Todas las modificaciones en conjunto
plot_mirt(x, todos_los_nombres, nombres,
          nombre_curvas = nombres_curvas,
          layout = c(3, 3), asp = 0.5)

# Tamaño de letra de las variables (strip) mas grande
plot_mirt(x, todos_los_nombres, nombres,
          nombre_curvas = nombres_curvas,
          layout = c(3, 3), asp = 0.5, par.strip.text = list(cex = 1.5))

# estilo_etiqueta <- function(which.panel, factor.levels, ...) {
#     panel.rect(0, 0, 1, 1,
#                col = "white",
#                border = 1)
#     panel.text(x = 0.5, y = 0.5,
#                font = 4,
#                lab = factor.levels[which.panel],
#                col = "black")
# }
# 
# # Fondo blanco y tamaño de letra de las variables (strip) mas grande
# plot_mirt(x, todos_los_nombres, nombres,
#           nombre_curvas = c(":(", ":|", ":)", ":D"),
#           layout = c(3, 3), asp = 0.5, strip = estilo_etiqueta)
# 


# Sacamos el fichero en SVG, imagen vectorial (a lo excel). Podemos editarla con
# inkscape por ejemplo.
plot_mirt(x, todos_los_nombres, todos_los_nombres, nombre_svg = "hello.svg",
          layout = c(1, 2))
# Ahora le decimos que queremos una imagen de 10x10 pulgadas
plot_mirt(x, todos_los_nombres, todos_los_nombres, nombre_svg = "hello.svg",
          res = c(10, 10), layout = c(2, 2))

plot_mirt(x, todos_los_nombres, todos_los_nombres,
          res = c(10, 10), layout = c(2, 2), lwd = 1)
plot_mirt(x, todos_los_nombres, todos_los_nombres,
          res = c(10, 10), layout = c(2, 2), lwd = 2)
plot_mirt(x, todos_los_nombres, todos_los_nombres,
          res = c(10, 10), layout = c(2, 2), lwd = 3)
