***********************************************************;
*  Activity 5.07                                          *;
*    1) Run the PROC MEANS step and compare the report    *;
*       and the wind_stats table. Are the same statistics *;
*       in the report and table? What do the first five   *;
*       rows in the table represent?                      *;
*    2) Uncomment the WAYS statement. Delete the          *;
*       statistics listed in the PROC MEANS statement and *;
*       add the NOPRINT option. Run the program. Notice   *;
*       that a report is not generated and the first five *;
*       rows from the previous table are excluded.        *;
*    3) Add the following options in the OUTPUT statement *;
*       and run the program again. How many rows are in   *;
*       the output table?                                 *;
*         output out=wind_stats mean=AvgWind max=MaxWind; *;
***********************************************************;

libname pg1 base "~/EPG194/data";

proc means data=pg1.storm_final noprint;
	var MaxWindMPH;
	class BasinName;
	ways 1;
	output out=wind_stats mean=AvgWind max=MaxWind;
run;

