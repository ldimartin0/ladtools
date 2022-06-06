#' A Convenient `ggplot2` Function for Linear Regression Plotting
#'
#' This function is an exact duplication of `ggplot2::geom_smooth()` with defaults more appropriate for statistics and econometrics. By default, `geom_lm()` plots with `method = "lm"` for a linear trend line and with `se = FALSE` because plotting standard errors around a linear trend confuses the viewer more than it demonstrates statistical uncertainty.
#'
#' @inheritParams ggplot2::geom_smooth
#'
#' @export
#' @examples
#' ggplot(mpg, aes(displ, hwy)) +
#'   ggplot2::geom_point() +
#'   geom_lm()
geom_lm <- function(method = "lm", se = FALSE, formula = y ~ x, ...) {
	ggplot2::geom_smooth(method = method, se = se, formula = formula, ...)
}
