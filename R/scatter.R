#' Title
#'
#' @param df Default dataset to use for plot.
#' @param y Values scattered on y-axis and on left-hand side of regression formula.
#' @param x Values scattered on x-axis and on right-hand side of regression formula.
#'
#' @return A `ggplot2` object
#' @export
#'
#' @import ggplot2
#' @examples
#' scatter(mtcars, hp, mpg)
scatter <- function(df, y, x) {
	ggplot(df) +
		aes(x = {{ x }}, y = {{ y }}) +
		geom_point() +
		geom_lm()
}
