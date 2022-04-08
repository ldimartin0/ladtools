#' Determine Whether a Vector is Monotonically Increasing or Decreasing
#'
#' `is_increasing()` and `is_decreasing()` are trivial wrapper functions that determine whether a numerical vector is increasing or decreasing
#' @param vec
#'
#' @return
#' @export
#'
#' @examples
is_increasing <- function(vec) {
	if (!is.numeric(vec)) {stop("Vector must be numeric", .call = TRUE)}

	out <- all(vec == cummax(vec))
	return(out)
}

is_decreasing <- function(vec) {
	if (!is.numeric(vec)) {stop("Vector must be numeric", .call = TRUE)}

	out <- all(vec == cummin(vec))
	return(out)
}
