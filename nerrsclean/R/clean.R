#' Clean Function
#'
#' Package to prepare data collected under NOAA's National
#' Estuarine Research Reserve System's (NERRS) National Monitoring
#' Program for analysis. Converts dates to a friendly format, renames
#' columns, and normalizes environmental variables from 0 to 1.
#'
#' @param df Dataframe for manipulation.
#' @param normalize TRUE to normalize temperature, salinity, dissolved oxygen mgl, and turbidity. FALSE to do nothing.
#' @keywords water data-cleaning NOAA
#' @export
#' @examples
#' df2 <- clean(df, T)
#'

clean <- function(df, normalize) {

  #rename columns
  colnames(df) <- c("station_code","prim_or_sec","timestamp","historical",
                    "tempC", "spcond", "salinity", "dopercent", "domgl",
                    "depth", "cdepth", "ph", "turbidity")

  #create separate date column and convert date column to timestamp
  df$date <- as.Date(df$timestamp,format="%m/%d/%y")
  df$timestamp <- as.POSIXct(df$timestamp,format="%m/%d/%y %H:%M")
  if(normalize == T){

    #rescale temperature, salinity, dissolved oxygen mgl, and turbidity
    df$tempC_n <- rescale(df$tempC, to=c(0,1),
                          from=range(df$tempC, na.rm=T, finite=T))
    df$salinity_n <- rescale(df$salinity, to=c(0,1),
                             from=range(df$salinity, na.rm=T, finite=T))
    df$domgl_n <- rescale(df$domgl, to=c(0,1),
                          from=range(df$domgl, na.rm=T, finite=T))
    df$turbidity_n <- rescale(df$turbidity, to=c(0,1),
                              from=range(df$turbidity, na.rm=T, finite=T))
  }
  else{}

  return(df)

}
