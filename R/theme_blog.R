#' `ggplot2` Theme for My Website
#'
#' This theme controls all non-data display and standardizes it for my website.
#' @import ggplot2
theme_blog <- function() {
  theme_bw(base_size = 11, base_family = "Verdana") %+replace%
    theme(
      # Make everything transparent
      panel.background = element_blank(),
      plot.background = element_rect(
      	fill = "transparent",
      	colour = NA
      	),
      legend.key = element_rect(
      	fill = "transparent",
      	colour = NA
      	),
      # Eliminate tick marks
      axis.ticks = element_blank(),
      # Adjust text elements
      plot.title = element_text(
        size = 16,
        face = "bold",
        hjust = .5, # center align
        vjust = 1,
        margin = margin(t = 8, b = 5)
      ),
      plot.subtitle = element_text(
        size = 12,
        margin = margin(t = 1, b = 5)
      ),
      plot.caption = element_text(
        size = 8,
        hjust = 1
      ),
      axis.title = element_text(size = 10),
      axis.text = element_text(size = 9),
      axis.text.x = element_text(
        margin = margin(1, b = 5)
      ),
      axis.text.y = element_text(
        margin = margin(r = .5, l = 5)
      ),
      # Legend settings
      legend.background = element_rect(
      	fill = "light gray",
      	color = "black",
      	size = .3
      	),
      legend.title = element_text(size = 7),
      legend.text = element_text(
        size = 7,
        margin = margin(t = 0, b = 0)
      ),
      legend.key.size = unit(.65, "lines"),
      # Remove minor gridlines
      panel.grid.minor = element_blank()
    )
}
