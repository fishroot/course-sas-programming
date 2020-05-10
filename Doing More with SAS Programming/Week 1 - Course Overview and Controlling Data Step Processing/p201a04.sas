***********************************************************;
*  Activity 1.04                                          *;
*  1) Examine the PUTLOG statements that are in the DATA  *;
*     step.                                               *;
*  2) Add two PUTLOG statements before the RUN statement  *;
*     to print "PDV before RUN statement" and write all   *;
*     columns in the PDV to the log. Run the program.     *;
*  3) View the log. What is the value of StormLength at   *;
*     the end of the second iteration of the DATA step?   *;
*  4) Type NOTE: (use uppercase and include the colon)    *;
*     inside the quotation marks of the following PUTLOG  *;
*     statement. Run the program. What changes in the     *;
*     log?                                                *;
*          putlog "NOTE: PDV before RUN statement";       *;
***********************************************************;
*  Syntax                                                 *;
*     PUTLOG _ALL_;                                       *;
*     PUTLOG column=;                                     *;
*     PUTLOG "message";                                   *;
***********************************************************;

data storm_complete;
	set pg2.storm_summary_small(obs=2); 
    putlog "PDV after SET statement";
	putlog _all_; 
	length Ocean $ 8;
	drop EndDate;
	where Name is not missing;
	Basin=upcase(Basin);
	StormLength=EndDate-StartDate;
	putlog StormLength=;
	if substr(Basin,2,1)="I" then Ocean="Indian";
	else if substr(Basin,2,1)="A" then Ocean="Atlantic";
	else Ocean="Pacific";
	putlog "PDV Before RUN Statement";
	putlog _ALL_;
run;


