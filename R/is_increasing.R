is_increasing <- function(vec) {
	if (!is.numeric(vec)) {stop("Vector passed to is.increasing() must be numeric", .call = TRUE)}

	out <- all(vec == cummax(vec))
	return(out)
}

is_decreasing <- function(vec) {
	if (!is.numeric(vec)) {stop("Vector passed to is.increasing() must be numeric", .call = TRUE)}

	out <- all(vec == cummin(vec))
	return(out)
}
