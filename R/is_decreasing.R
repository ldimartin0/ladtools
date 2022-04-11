#' Determine Whether a Vector is Increasing or Decreasing
#'
#' `is_increasing()` and `is_decreasing()` are trivial wrapper functions to enhance code readability. They determine whether a numerical vector is increasing or decreasing monotonically. `strictly` (default `FALSE`) excludes cases where the difference between consecutive elements is zero.
#'
#' @param vec A numerical vector.
#' @param strictly Does a difference of zero count as increasing/decreasing? By default, `c(1, 1, 2)` is increasing, with `strictly = TRUE` it is not.
#' @param na.rm A logical value indicating whether `NA` values should be stripped before the vector is determined to be increasing or decreasing.
#'
#' @return logical.
#' @export
#'
#' @examples
#' is_increasing(c(1:10))
#' is_increasing(c(1, 2, 2, 2, 3), strictly = TRUE)
#' is_decreasing(c(3, 2, 2, 5, 3, 2, 1))
is_decreasing <- function(vec, strictly = FALSE, na.rm = FALSE) {
	if (!is.numeric(vec)) {stop("Vector must be numeric", .call = TRUE)}

	if (!strictly) {
		out <- all(vec == cummin(vec))
	}

	if (strictly) {
		out <- !is.unsorted(rev(vec), strictly = TRUE, na.rm = na.rm)
	}

	return(out)
}
