#' List number and percentages of NA for all variables.
#'
#' @param wqp A dataframe from the WQP datawarehouse.
#' @return A dataframe of NA search results.
#' @export
#' @examples
#' preview_na(wqp)
preview_na <- function(wqp) {
  na_count <-sapply(wqp, function(y) sum(length(which(is.na(y)))))
  na_count <- as.data.frame(na_count)
  na_count$percent <- na_count$na_count / nrow(wqp) * 100
  na_count$percent <- format(round(na_count$percent, 2), nsmall = 2)
  return(na_count)
}

#' List unique values for all columns.
#'
#' @param wqp A dataframe from the WQP datawarehouse.
#' @return A dataframe of unique column values.
#' @examples
#' preview_uniques(wqp)
preview_uniques <- function(wqp) {
  uniques <- sapply(wqp, function(y) as.data.frame(levels(factor(y))))
  return(uniques)
}

#' Plot locations of monitoring values with ggmap()
#'
#' @param wqp A dataframe from the WQP datawarehouse.
#' @return A ggmap object of Hillsborough County, Florida with monitoring locations.
#' @examples
#' preview_locations(wqp)
preview_locations <- function(wqp) {
  fl_map <- get_map(location = c(lon = -82.35, lat = 27.91),
                    maptype = "terrain", zoom = 10)

  fl_plot <- ggmap(fl_map) +
    geom_density2d(data = wqp, aes(x=lon, y=lat),
                   size = 0.1) +
    geom_point(data = wqp, aes(x=lon, y=lat),
               size = 0.3) +
    stat_density2d(data = wqp, aes(x=lon, y=lat,
                                   fill = ..level.., alpha = ..level..),
                   size = 0.01,
                   bins = 16, geom = "polygon") +
    scale_fill_gradient(low = "black", high = "red",name = "Density") +
    scale_alpha(range = c(0,0.3), guide = FALSE) +
    ggtitle("Sample Locations for WQP Data")

  return(fl_plot)
}
