# Cargamos MIRT y el paquete para poner las etiquetas encima de las curvas
library(mirt)
library(directlabels)

# Hacemos el IRT
x <- mirt(Science, 1, SE=TRUE)

# Esta función te hace el dibujito de varias. No te sacará nada ejecutándola
# ahora. Estás diciéndole a R que hay un codigo que se llama plot_mirt y que
# puede usarlo.
plot_mirt <- function(x, nombre_var, titulo, subtitulos, ...) {
    names <- dimnames(x@Data$data)[[2]]
    var_id <- match(nombre_var, names)
    
    dimnames(x@Data$data)[[2]][var_id] <- subtitulos
    # scales="free" quita las líneas de arriba :)
    plt <- plot(x, type = 'trace', which.items=var_id, main=titulo, scales="free", ...)
    direct.label(plt, 'top.points')
}

# Miramos que variables tiene Science
colnames(Science)
# "Comfort" "Work" "Future" "Benefit"

# Ahora llamamos a la función de arriba. Plot de una variable
plot_mirt(x,c("Work"), "Hola", c("Soy una variable"))
plot_mirt(x,c("Work"), "", c("Soy una variable")) 
# Dos variables
plot_mirt(x,c("Work","Benefit"), "", c("Soy una variable","Yo otra")) 
# Dos variables una encima de la otra (una columna, dos filas -> c(1,2))
plot_mirt(x,c("Work","Benefit"), "", c("Soy una variable","Yo otra"), layout=c(1,2)) 
# Todas
todos_los_nombres <- colnames(Science)
plot_mirt(x,todos_los_nombres, "", todos_los_nombres)
plot_mirt(x,todos_los_nombres, "", todos_los_nombres, layout=c(1,4))
plot_mirt(x,todos_los_nombres, "", todos_los_nombres, layout=c(4,1))
