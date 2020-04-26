# wqpcleanr package

Toolset for environmental scientists to clean and perform exploratory analysis on EPA Water Quality Portal data. 


```
library(devtools)
install_github("repneuable/lis4370/wqpcleanr")
library(wqpcleanr)
```

## Data source

The data is loaded dynamically by URL from the US Environmental Protection Agency (EPA), US Geological Survey (USGS), and the National Water Quality Monitoring Council (NWQMC) portal that integrates publicly available water quality data from the USGS National Water Information System (NWIS) the EPA STOrage and RETrieval (STORET) Data Warehouse, and the USDA ARS Sustaining The Earth’s Watersheds - Agricultural Research Database System (STEWARDS) found here: https://www.waterqualitydata.us/portal/

## Package objectives:

1. __Load data by date (in "04-23-2020" format)__

     * _note for improvement_: Add county location to search parameters

2. __Get prelimary view of data__

    * load_wqp() - loads data with parameters "start_date" and "end_date" via URL
    
    * preview_na() - lists the number and percentages of NA values for all variables
    
    * preview_uniques() - lists unique values for each column
    
3. __Overview of data latitude and longitude__
    
    * preview_locations() - uses ggmap() to show plot of geographic sampling distribution
    
    * _note for improvement_: add error message that API key must be configured in ggmap
 
Full overview provided here: https://r.hitt.cc/final
 
## Function previews:

### load_wqp() 

![Image of load_wqp() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-load.png)

### preview_locations()

![Image of preview_locations() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-location.png)

### preview_locations() plot

![Image of preview_locations() plot in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-location_plot.png)

### preview_na()

![Image of preview_na() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-na.png)

### preview_uniques()

![Image of preview_uniques() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-uniques_1.png)
![Image of preview_uniques() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-uniques_2.png)
![Image of preview_uniques() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-uniques_3.png)
![Image of preview_uniques() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-uniques_4.png)
![Image of preview_uniques() function in wqpcleanr package](https://github.com/repneuable/lis4370/blob/master/wqpcleanr/images/wqpcleanr-uniques_5.png)
