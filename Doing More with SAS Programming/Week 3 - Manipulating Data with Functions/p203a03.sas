***********************************************************;
*  Activity 3.03                                          *;
*  1) Notice that the expressions for WindAvg1 and        *;
*     WindAvg2 are the same. Run the program and examine  *;
*     the output table.                                   *;
*  2) Modify the WindAvg1 expression to use the ROUND     *;
*     function to round values to the nearest tenth (.1). *;
*  3) Add a FORMAT statement to format WindAvg2 with the  *;
*     5.1 format. Run the program. What is the difference *;
*     between using a function and a format?              *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data wind_avg;
	set pg2.storm_top4_wide;
	format WindAvg2 5.1;
	WindAvg1=round(mean(of Wind1-Wind4), .1); 
	WindAvg2=mean(of Wind1-Wind4); 
run;
