# Cargamos MIRT y el paquete para poner las etiquetas encima de las curvas
library(mirt)
library(directlabels)

# Hacemos el IRT
x <- mirt(Science, 1, SE=TRUE)

# Esta función te hace el dibujito de varias. No te sacará nada ejecutándola
# ahora. Estás diciéndole a R que hay un codigo que se llama plot_mirt y que
# puede usarlo.
plot_mirt <- function(x, nombre_var, nombres_nuevos, titulo="", nombre_svg=NULL,
                     res=c(5,5), ...) {
    # Sacamos los nombres originales de las variables
    names <- dimnames(x@Data$data)[[2]]
    # Buscamos que identificador numérico tienen
    var_id <- match(nombre_var, names)
    
    # Substituimos los nombres de las variables por los que hemos dado para los
    # plots
    dimnames(x@Data$data)[[2]][var_id] <- nombres_nuevos

    # Abrimos un nuevo PNG si se lo hemos indicado
    if (!is.null(nombre_svg)){
        print("Creating Saving to png")
        svg(filename=nombre_svg)#, width = res[1], height = res[2])
    }
    # scales="free" quita las líneas de arriba :)
    plt <- plot(x, type = 'trace', which.items=var_id, main=titulo, scales="free", ...)
    # Ponemos las etiquetas
    plt <- direct.label(plt, 'top.points')
    
    # Guardamos el PNG si hemos dicho de hacerlo
    if (!is.null(nombre_svg)) {
        print(plt)
        dev.off()
        print("Saving to png")
    } else {
        plt
    }
}

# Miramos que variables tiene Science
colnames(Science)
# "Comfort" "Work" "Future" "Benefit"

# Ahora llamamos a la función de arriba. Plot de una variable
plot_mirt(x,c("Work"), c("Soy una variable"), titulo="Hola")
plot_mirt(x,c("Work"), c("Soy una variable"), titulo="") 
plot_mirt(x,c("Work"), c("Soy una variable")) # Si no ponemos título, no sale
# Dos variables
plot_mirt(x,c("Work","Benefit"), c("Soy una variable","Yo otra")) 
# Dos variables una encima de la otra (una columna, dos filas -> c(1,2))
plot_mirt(x,c("Work","Benefit"), c("Soy una variable","Yo otra"), layout=c(1,2)) 
# Todas
todos_los_nombres <- colnames(Science)
plot_mirt(x,todos_los_nombres, todos_los_nombres)
plot_mirt(x,todos_los_nombres, todos_los_nombres, layout=c(1,4))
plot_mirt(x,todos_los_nombres, todos_los_nombres, layout=c(4,1))


# Sacamos el fichero en SVG, imagen vectorial (a lo excel). Podemos editarla con
# inkscape por ejemplo.
plot_mirt(x,todos_los_nombres, todos_los_nombres, nombre_svg="hello.svg", layout=c(2,2))
# Ahora le decimos que queremos una imagen de 10x10 pulgadas
plot_mirt(x,todos_los_nombres, todos_los_nombres, nombre_svg="hello.svg", res=c(10,10), layout=c(2,2))

