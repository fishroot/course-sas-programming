***********************************************************;
*  Activity 2.04                                          *;
*  1) Change the WHERE statement to a subsetting IF       *;
*     statement and submit the program. How many rows are *;
*     included in the output table?                       *;
*  2) Move the subsetting IF statement just before the    *;
*     RUN statement and submit the program. How many rows *;
*     are included in the output table?                   *;
*  3) Consider the sequence of the statements in the      *;
*     execution phase. Where is the optimal placement of  *;
*     the subsetting IF statement?                        *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc sort data=pg2.storm_2017 out=storm2017_sort;
	by Basin MaxWindMPH;
run;

data storm2017_max;
	set storm2017_sort;
	by Basin;
	StormLength=EndDate-StartDate;
	MaxWindKM=MaxWindMPH*1.60934;
	if last.Basin=1;
run;
