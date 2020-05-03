***********************************************************;
*  Activity 4.03                                          *;
*    1) Change the name of the output table to            *;
*       STORM_CAT5.                                       *;
*    2) Include only Category 5 storms (MaxWindMPH        *;
*       greater than or equal to 156) with StartDate on   *;
*       or after 01JAN2000.                               *;
*    3) Add a statement to include the following columns  *;
*       in the output data: Season, Basin, Name, Type,    *;
*       and MaxWindMPH. How many Category 5 storms        *;
*       occurred since January 1, 2000?                   *;
***********************************************************;

libname PG1 base "~/EPG194/data";
libname out base "~/EPG194/output";

data out.Storm_cat5;
	set pg1.storm_summary;
	where MaxWindMPH >= 156 and StartDate >= '01JAN2000'd; 
	keep Season Basin Name Type MaxWindMPH;
run;
