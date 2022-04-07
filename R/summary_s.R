summary_s <- function(lm) {
	df_p <- parameters::parameters(lm)
	names(df_p)[1:2] <- c("Term", "Coef")
	df_p <- dplyr::select(df_p, -c(CI, df_error))
	df_p <- dplyr::mutate(df_p, dplyr::across(where(is.numeric), ~round(., digits = 3)))
	df_p$Term[df_p$Term == "(Intercept)"] <- "Intcpt"
	paint::paint(df_p, paint_align_row_head = "center")

	df_g <- glance(lm)

	df_g_cols <- tibble(
		`r.sq + adj.r.sq` = c(df_g$r.squared, df_g$adj.r.squared),
		`stat + p-val` = c(df_g$statistic, df_g$p.value),
		`AIC + BIC`= c(df_g$AIC, df_g$BIC),
		`df + n` = c(df_g$df, df_g$nobs))

	paint::paint(df_g_cols)

	df_g_single <- dplyr::select(df_g, c(sigma, deviance))
	paint::paint(df_g_single)

}
