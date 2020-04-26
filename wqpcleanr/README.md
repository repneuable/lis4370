# wqpcleanr package

Toolset for environmental scientists to clean and perform exploratory analysis on EPA Water Quality Portal data. 

## Package objectives:

1. __Load data by date (in "04-23-2020" format)__

     _note for improvement_: Add county location to search parameters

2. __Get prelimary view of data__

    preview_na() - lists the number and percentages of NA values for all variables
    preview_uniques() - lists unique values for each column
    
3. __Overview of data latitude and longitude__
    _note for improvement_: add error message that API key must be configured in ggmap
 
 
![Image of load_wqp() function in wqpcleanr package] (https://octodex.github.com/images/yaktocat.png)
