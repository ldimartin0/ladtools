is.increasing <- function(vec) {
	if (!is.numeric(vec)) {stop("Vector passed to is.increasing() must be numeric", .call = TRUE)}

	out <- all(x == cummax(x))
	return(out)
}
