***********************************************************;
*  Activity 5.01                                          *;
*    1) In the program, notice that there is a TITLE      *;
*       statement followed by two procedures. Run the     *;
*       program. Where does the title appear in the       *;
*       output?                                           *;
*    2) Add a TITLE2 statement above PROC MEANS to print  *;
*       a second line: Summary Statistics for MaxWind and *;
*       MinPressure                                       *;
*    3) Add another TITLE2 statement above PROC FREQ with *;
*       this title: Frequency Report for Basin            *;
*    4) Run the program. Which titles appear above each   *;
*       report?                                           *;
***********************************************************;

libname pg1 base "~/EPG194/data";

title "Storm Analysis";

title2 "Summary Statistics for MaxWind and MinPressure";
proc means data=pg1.storm_final;
	var MaxWindMPH MinPressure;
run;

title2 "Frequency Report for Basin";
proc freq data=pg1.storm_final;
	tables BasinName;
run;
