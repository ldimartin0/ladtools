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
