***********************************************************;
*  Activity 4.05                                          *;
*    1) Open the PG1.STORM_RANGE table and examine the    *;
*       columns. Notice that each storm has four wind     *;
*       speed measurements.                               *;
*    2) Create a new column named WindAvg that is the     *;
*       mean of Wind1, Wind2, Wind3, and Wind4.           *;
*    3) Create a new column WindRange that is the range   *;
*       of Wind1, Wind2, Wind3, and Wind4.                *;
***********************************************************;

libname ep1 base "~/EPG194/data";

data storm_wingavg;
	set pg1.storm_range;
	*Add assignment statements;
	WindAvg = MEAN(wind1, wind2, wind3, wind4);
	WindRange = RANGE(wind1, wind2, wind3, wind4);
run;
