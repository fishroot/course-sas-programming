***********************************************************;
*  LESSON 2, PRACTICE 4                                   *;
*  a) Complete the PROC SORT step to sort the             *;
*     PG2.NP_YEARLYTRAFFIC table by ParkType and ParkName.*;
*  b) Modify the DATA step as follows:                    *;
*     1) Read the sorted table created in PROC SORT.      *;
*     2) Add a BY statement to group the data by ParkType.*;
*     3) Create a column, TypeCount, that is the running  *;
*        total of Count within each ParkType.             *;
*     4) Format TypeCount so values are displayed with    *;
*        commas.                                          *;
*     5) Keep only the ParkType and TypeCount columns.    *;
*  c) Run the program and confirm TypeCount is reset at   *;
*     the beginning of each ParkType group.               *;
*  d) Modify the program to write only the last row for   *;
*     each ParkType to the output table.                  *;
***********************************************************;

proc sort data=pg2.np_yearlyTraffic   
          out=sortedTraffic(keep=ParkType ParkName 
                                      Location Count);
    by ParkType ParkName;
run;

data TypeTraffic;
    set sortedTraffic;
    keep ParkType TypeCount;
    format TypeCount Comma15.;
	by ParkType;
	if First.ParkType then TypeCount=0;
	TypeCount+Count;
	if Last.ParkType;
run;
