#' Identify Outliers
#'
#' This function uses standard statistical methods to calculate the value the identifies outliers above or below it on a distribution.
#'
#' @param x A numeric vector.
#' @param tail takes "upper" or "lower", determining which side of the distribution to calculate an outlier identification value.
#' @param method  "iqr", the default, adds 1.5 times the interquartile range to the 75th percentile for the upper value or subtracts 1.5 times the interquartile range from the 25th percentile for the lower value. "sd" uses the mean plus or minus 3 times the standard deviation of the distribution.
#' @param na.rm a logical value indicating whether `NA` values should be stripped before the computation proceeds.
#'
#' @importFrom stats IQR quantile var
#'
#' @return A numeric vector of length one.
#' @export
#'
#' @examples
#' vec <- rnorm(1000, mean = 0, sd = 1)
#' calculate_outlier_value(vec, tail = "upper")
#' calculate_outlier_value(vec, tail = "lower", method = "sd")
#'
calculate_outlier_value <- function(x, tail, method = "iqr", na.rm = FALSE) {
	stopifnot(
			{
				is.numeric(x) |
				length(method) == 1 |
				method %in% c("iqr", "sd") |
				tail %in% c("upper", "lower")
				}
		)

	if (method == "iqr") {
		if (tail == "upper") {
			bound <- quantile(x, probs = .75, na.rm = na.rm) + 1.5 * IQR(x, na.rm = na.rm)
		}
		if (tail == "lower") {
			bound <- quantile(x, probs = .25, na.rm = na.rm) - 1.5 * IQR(x, na.rm = na.rm)
		}
	}
	if (method == "sd") {
		if (tail == "upper") {
			bound <- mean(x, na.rm = na.rm) + 3 * sqrt(var(x, na.rm = na.rm))
		}
		if (tail == "lower") {
			bound <- mean(x, na.rm = na.rm) + 3 * sqrt(var(x, na.rm = na.rm))
		}
	}
	return(bound)
}
