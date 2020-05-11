***********************************************************;
*  Activity 2.01                                          *;
*  1) Modify the program to retain TotalRain and set the  *;
*     initial value to 0.                                 *;
*  2) Run the program and examine the results. Why are    *;
*     all values for TotalRain missing after row 4?       *;
*  3) Change the assignment statement to use the SUM      *;
*     function instead of the plus symbol. Run the        *;
*     program again. Why are the results different?       *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data zurich2017;
	set pg2.weather_zurich;
	*retain TotalRain 0;
	TotalRain+Rain_mm;
run;
