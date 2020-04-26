#' Load data directly from EPA WQP datawarehouse portal by URL.
#'
#' @param start_date A start date for filtering results.
#' @param end_date An end date for filtering results.
#' @return A dataframe from WQP with custom named columns.
#' @export
#' @examples
#' my_data <- loadwqp("12-31-2015","12-31-2020")
load_wqp <- function(start_date, end_date) {

  url_head <- c("https://www.waterqualitydata.us/data/Station/search?statecode=US%3A12&countycode=US%3A12%3A057&startDateLo=")
  start <- start_date
  url_mid <- c("&startDateHi=")
  end <- c("04-23-2020")
  url_tail <- c("&providers=NWIS&mimeType=csv")

  url <- paste(url_head, start, url_mid, end, url_tail)

  wqp <- read.csv(url)

  names(wqp) <- c("org_id",
                  "org_name",
                  "monitor_id",
                  "monitor_name",
                  "monitor_type",
                  "monitor_descrip",
                  "light_code",
                  "drainage_area",
                  "drainage_area_unit",
                  "cont_drainage_area",
                  "cont_drainage_unit",
                  "lat",
                  "lon",
                  "map_scale",
                  "horiz_acc",
                  "horiz_acc_unit",
                  "horiz_source",
                  "horiz_datum",
                  "vert_measure",
                  "vert_measure_unit",
                  "vert_acc",
                  "vert_acc_unit",
                  "vert_source",
                  "vert_datum",
                  "country_id",
                  "state_id",
                  "county_id",
                  "aquifer",
                  "aquifer_formation",
                  "aquifer_type",
                  "construction_date",
                  "well_depth",
                  "well_depth_unit",
                  "wellhole_depth",
                  "wellhole_depth_unit",
                  "provider")
  return(wqp)
}
