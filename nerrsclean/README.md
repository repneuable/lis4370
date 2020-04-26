<h1>nerrsclean</h1>

This R package provides 1 function, <i>clean()</i>, to prepare data collected under NOAA's National Estuarine Research Reserve System's (NERRS) National Monitoring Program for analysis. The function accepts two arguments:
<ul>
  <li>df: dataframe from CSV file</li>
  <li>normalize: user option to add normalized columns or not (TRUE / FALSE)</li>
</ul>
The function returns a cleaned dataframe. 

The data sets appropriate for this tool can be found here: http://cdmo.baruch.sc.edu/dges/

The purpose of this package is to serve as a preliminary data cleaning tool for any of the .CSV files downloadable from the above site.
