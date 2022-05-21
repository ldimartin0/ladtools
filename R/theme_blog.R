#' `ggplot2` Theme for My Website
#'
#' This theme controls all non-data display and standardizes it for my website.
#'
theme_blog <- function() {
  ggplot2::theme_bw(base_size = 12, base_family = "Verdana") %+replace%
    ggplot2::theme(
      # Make everything transparent
      panel.background = ggplot2::element_blank(),
      plot.background = ggplot2::element_rect(
      	fill = "transparent",
      	colour = NA
      	),
      legend.key = ggplot2::element_rect(
      	fill = "transparent",
      	colour = NA
      	),
      # Eliminate tick marks
      axis.ticks = ggplot2::element_blank(),
      # Adjust text elements
      plot.title = ggplot2::element_text(
        size = 18,
        face = "bold",
        hjust = .5, # center align
        vjust = 1,
        margin = ggplot2::margin(t = 8, b = 5)
      ),
      plot.subtitle = ggplot2::element_text(
        size = 12,
        margin = ggplot2::margin(t = 1, b = 5)
      ),
      plot.caption = ggplot2::element_text(
        size = 9,
        hjust = 1
      ),
      axis.title = ggplot2::element_text(size = 10),
      axis.text = ggplot2::element_text(size = 9),
      axis.text.x = ggplot2::element_text(
        margin = ggplot2::margin(1, b = 5)
      ),
      axis.text.y = ggplot2::element_text(
        margin = ggplot2::margin(r = .5, l = 5)
      ),
      # Legend settings
      legend.background = ggplot2::element_rect(
      	fill = "light gray",
      	color = "black",
      	size = .3
      	),
      legend.title = ggplot2::element_text(size = 8),
      legend.text = ggplot2::element_text(
        size = 7,
        margin = ggplot2::margin(t = 0, b = 0)
      ),
      legend.key.size = ggplot2::unit(.65, "lines"),
      # Remove minor gridlines
      panel.grid.minor = ggplot2::element_blank()
    )
}
