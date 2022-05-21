summary_s <- function(lm) {

  # Print dependent variable
  cat(paste("Dependent Var:", lm$terms[[2]]), "\n")

  # Construct and print parameters dataframe
  df_p <- parameters::parameters(lm)
  names(df_p)[1:2] <- c("Term", "Coef")

  df_p <- dplyr::select(df_p, -c("CI", "df_error"))
  df_p <- dplyr::mutate(
    df_p,
    dplyr::across(
      tidyselect::vars_select_helpers$where(is.numeric),
      ~ format(round(., digits = 2))
    )
  )
  df_p$Term[df_p$Term == "(Intercept)"] <- "Intcpt"

  paint::paint(df_p, paint_align_row_head = "center")

  # Construct evaluation statistics data frame
  df_g <- broom::glance(lm)
  df_g <- dplyr::mutate(
    df_g,
    dplyr::across(
      tidyselect::vars_select_helpers$where(is.numeric),
      ~ format(round(., digits = 2))
    )
  )

  # Print evaluation statistics data frame in lines
  cat(paste(
    crayon::italic("r.sq + adj.r.sq: "),
    crayon::silver(df_g$r.squared),
    crayon::blue(df_g$adj.r.squared),
    "\n"
  ))
  cat(paste(
    crayon::italic("r.sq + adj.r.sq: "),
    crayon::silver(df_g$r.squared),
    crayon::blue(df_g$adj.r.squared),
    "\n"
  ))
  cat(paste(
    crayon::italic("stat + p-val: "),
    crayon::silver(df_g$statistic),
    crayon::blue(df_g$p.value),
    "\n"
  ))
  cat(paste(
    crayon::italic("AIC + BIC: "),
    crayon::silver(df_g$AIC),
    crayon::blue(df_g$BIC),
    "\n"
  ))
  cat(paste(
    crayon::italic("df + n: "),
    crayon::silver(df_g$df),
    crayon::blue(df_g$nobs),
    "\n"
  ))
  cat(paste(
    crayon::italic("sigma: "),
    crayon::silver(df_g$sigma),
    "\n"
  ))
  cat(paste(
    crayon::italic("deviance: "),
    crayon::silver(df_g$deviance),
    "\n"
  ))
}
