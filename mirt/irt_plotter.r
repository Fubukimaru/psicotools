library(directlabels)

# Esta función te hace el dibujito de varias. No te sacará nada ejecutándola
# ahora. Estás diciéndole a R que hay un codigo que se llama plot_mirt y que
# puede usarlo.
plot_mirt <- function(x, nombre_var, nombres_nuevos=NULL, titulo="",
                      nombre_svg=NULL, res=c(5, 5), nombre_curvas=NULL, ...) {
    # Sacamos los nombres originales de las variables
    names <- dimnames(x@Data$data)[[2]]
    # Buscamos que identificador numérico tienen
    var_id <- match(nombre_var, names)

    # Substituimos los nombres de las variables por los que hemos dado para los
    # plots
    if (!is.null(nombres_nuevos)) {
        dimnames(x@Data$data)[[2]][var_id] <- nombres_nuevos
     }

    # Abrimos un nuevo PNG si se lo hemos indicado
    if (!is.null(nombre_svg)){
        svg(filename = nombre_svg, width = res[1], height = res[2])
    }
    # scales="free" quita las líneas de arriba :)
    plt <- plot(x, type = "trace", which.items = var_id, main = titulo,
                scales = "free", as.table = TRUE, ...)

    if (!is.null(nombre_curvas)) {
        levels(plt$panel.args.common$groups) <- nombre_curvas
    }

    # Ponemos las etiquetas
    plt <- direct.label(plt, "top.points")

    # Guardamos el PNG si hemos dicho de hacerlo
    if (!is.null(nombre_svg)) {
        print(plt)
        dev.off()
        cat("Saving to svg to ", nombre_svg, "\n")
    } else {
        plt
    }
}
