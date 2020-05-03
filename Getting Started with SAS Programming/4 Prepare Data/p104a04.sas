***********************************************************;
*  Activity 4.04                                          *;
*    1) Add an assignment statement to create StormLength *;
*       that represents the number of days between        *;
*       StartDate and EndDate.                            *;
*    2) Run the program. In 1980, how long did the storm  *;
*       named Agatha last?                                *;
***********************************************************;

libname pg1 base "~/EPG194/data";

data storm_length;
	set pg1.storm_summary;
	drop Hem_EW Hem_NS Lat Lon;
	*Add assignment statement;
	StormLength = EndDate - StartDate;
run;
