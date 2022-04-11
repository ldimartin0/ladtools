#' Plotting a linear trend
#'
#' This function is an exact duplication of [ggplot2::geom_smooth()] with defaults more appropriate for statistics and econometrics. By default, [geom_lm()] plots with [method = "lm"] for a linear trend line and with [se = FALSE] because plotting standard errors around a linear trend confuses the viewer more than it demonstrates statistical uncertainty.
#'
#' @param mapping Set of aesthetic mappings created by [aes()] or [aes_()]. If specified and [inherit.aes = TRUE] (the default), it is combined with the default mapping at the top level of the plot. You must supply mapping if there is no plot mapping
#' @param data @param data The data to be displayed in this layer. There are three options:
#'    If `NULL`, the default, the data is inherited from the plot data as specified in the call to [ggplot()].
#'
#'    A `data.frame`, or other object, will override the plot data. All objects will be fortified to produce a data frame. See [fortify()] for which variables will be created.
#'
#'    A `function` will be called with a single argument, the plot data. The return value must be a `data.frame`, and will be used as the layer data. A `function` can be created from a `formula` (e.g. `~ head(.x, 10)`).
#' @param stat Used to override the default connection between `geom_smooth()` and `stat_smooth()`.
#' @param position Position adjustment, either as a string, or the result of a call to a position adjustment function.
#' @param ... Other arguments passed on to `ggplot2::layer()`. These are often aesthetics.
#' @param method Smoothing method (function) to use, accepts either `NULL` or a character vector. Defaults to `stats::lm()`, unlike `ggplot2::geom_smooth()`.
#' @param formula Formula to use in smoothing function, eg. `y ~ x`, `y ~ poly(x, 2)`, `y ~ log(x)`. `NULL` by default, in which case `method = NULL` implies `formula = y ~ x` when there are fewer than 1,000 observations and `formula = y ~ s(x, bs = "cs")` otherwise.
#' @param se Display confidence interval around smooth? (`FALSE` by default, see` level` to control.)
#' @param na.rm IF `FALSE`, the default, missing values are removed with a warning. If `TRUE` missing values are silently removed.
#' @param orientation The orientation of the layer. The default (`NA`) automatically determines the orientation from the aesthetic mapping.
#' @param show.legend logical. Should this layer be included in the legends. `NA`, the default, includes if any aesthetics are mapped.
#' @param inherit.aes If `FALSE`, overrides the default aesthetics, rather than combining with them.
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(ggplot2::mpg, aes(displ, hwy)) +
#'   ggplot2::geom_point() +
#'   geom_lm()
geom_lm <- function (mapping = NULL, data = NULL, stat = "smooth", position = "identity", ..., method = "lm", formula = y ~ x, se = FALSE, na.rm = FALSE, orientation = NA, show.legend = NA, inherit.aes = TRUE)
{
	params <- list(na.rm = na.rm, orientation = orientation,
								 se = se, ...)
	if (identical(stat, "smooth")) {
		params$method <- method
		params$formula <- formula
	}
	ggplot2::layer(data = data, mapping = mapping, stat = stat, geom = GeomSmooth, position = position, show.legend = show.legend, inherit.aes = inherit.aes, params = params)
}
