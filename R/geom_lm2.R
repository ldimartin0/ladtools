#' A Convenient `ggplot2` Function for Linear Regression Plotting
#'
#' This function is an exact duplication of [ggplot2::geom_smooth()] with defaults more appropriate for statistics and econometrics. By default, [geom_lm()] plots with [method = "lm"] for a linear trend line and with [se = FALSE] because plotting standard errors around a linear trend confuses the viewer more than it demonstrates statistical uncertainty.
#'
#' @param method Smoothing method (function) to use, accepts either `NULL` or a character vector. Defaults to `stats::lm()`, unlike `ggplot2::geom_smooth()`.
#' @param formula Formula to use in smoothing function, eg. `y ~ x`, `y ~ poly(x, 2)`, `y ~ log(x)`. `NULL` by default, in which case `method = NULL` implies `formula = y ~ x` when there are fewer than 1,000 observations and `formula = y ~ s(x, bs = "cs")` otherwise. Unlike `ggplot2::geom_smooth()`, set by default so warning is not displayed.
#' @param se Display confidence interval around smooth? (`FALSE` by default, unlike `ggplot2::geom_smooth()`, see` level` to control.)
#' @param ... Additional arguments passed to `ggplot2::geom_smooth()`.
#'
#' @export
#'
#' @examples
#' ggplot(ggplot2::mpg, aes(displ, hwy)) +
#'   ggplot2::geom_point() +
#'   geom_lm()
geom_lm2 <- function(method = "lm", se = FALSE, formula = y ~ x, ...) {
	ggplot2::geom_smooth(method = method, se = se, formula = formula, ...)
}
