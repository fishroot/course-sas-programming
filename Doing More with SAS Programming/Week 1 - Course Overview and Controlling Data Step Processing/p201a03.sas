***********************************************************;
*  Activity 1.03                                          *;
*  1) Run the program and examine the log, PROC CONTENTS  *;
*     report and output table.                            *;
*  2) Move the DROP statement to the end of the DATA step,*;
*     just before the RUN statement. Run the program and  *;
*     examine the log, PROC CONTENTS report, and output   *;
*     table. Did the results change?                      *;
*  3) Move the LENGTH statement between the DROP and RUN  *;
*     statements. Run the program and examine the log,    *;
*     PROC CONTENTS report, and output table. Did the     *;
*     results change?                                     *;
***********************************************************;

data storm_complete;
	set pg2.storm_summary_small; 
	where Name is not missing;
	Basin=upcase(Basin);
	StormLength=EndDate-StartDate;
	if substr(Basin,2,1)="I" then Ocean="Indian";
	else if substr(Basin,2,1)="A" then Ocean="Atlantic";
	else Ocean="Pacific";
	drop EndDate;
	length Ocean $ 8;
run;

proc contents data=storm_complete;
run;
