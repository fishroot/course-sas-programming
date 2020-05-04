***********************************************************;
*  Activity 3.02                                          *;
*    1) Run the program. Examine the results and the log. *;
*       Are the two WHERE statements applied?             *;
*    2) Change the second WHERE statement to WHERE ALSO   *;
*       and rerun the code. Examine the results and the   *;
*       log. Are the two WHERE statements applied?        *;
***********************************************************;

libname PG1 base "~/EPG194/data";

/* Examine the results and the log */
proc print data=pg1.storm_summary;
	where MaxWindMPH>156;
	where MinPressure>800 and MinPressure<920;
run;

/* Lookup if first where statement has an effect */
proc print data=pg1.storm_summary;
	where MinPressure>800 and MinPressure<920;
run;

/* Change the second WHERE statement to WHERE ALSO */
proc print data=pg1.storm_summary;
	where MaxWindMPH>156;
	where also MinPressure>800 and MinPressure<920;
run;
