***********************************************************;
*  Activity 5.05                                          *;
*    1) Create an output table named STORM_COUNT by       *;
*       completing the OUT= option in the TABLES          *;
*       statement.                                        *;
*    2) Run the program. Which data values are included   *;
*       in the output table? Which statistics are         *;
*       included?                                         *;
*    3) Put StartDate and BasinName in separate TABLES    *;
*       statements. Add the OUT= option in each           *;
*       statement, and name the tables MONTH_COUNT and    *;
*       BASIN_COUNT.                                      *;
*    4) Run the program and examine the two tables. Which *;
*       month has the highest number of storms?           *;
***********************************************************;

title "Frequency Report for Basin and Storm Month";

proc freq data=pg1.storm_final order=freq noprint;
	tables StartDate / out=month_count ;
	tables BasinName / out=basin_count ;
	format StartDate monname.;
run;
