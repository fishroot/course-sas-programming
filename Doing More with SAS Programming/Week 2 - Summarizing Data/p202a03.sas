***********************************************************;
*  Activity 2.03                                          *;
*  1) Modify the PROC SORT step to sort the rows within   *;
*     each value of Basin by MaxWindMPH. Highlight the    *;
*     PROC SORT step and run the selected code. Which row *;
*     within each value of Basin represents the storm     *;
*     with the highest wind?                              *;
*  2) Add the following WHERE statement immediately after *;
*     the BY statement in the DATA step. The intent is to *;
*     include only the last row within each value of      *;
*     Basin. Does the program run successfully?           *;
*        where last.Basin=1;                              *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc sort data=pg2.storm_2017 out=storm2017_sort;
	by Basin MaxWindMPH;
run;

data storm2017_max;
	set storm2017_sort;
	by Basin;
	where last.Basin=1;
	StormLength=EndDate-StartDate;
	MaxWindKM=MaxWindMPH*1.60934;
run;

