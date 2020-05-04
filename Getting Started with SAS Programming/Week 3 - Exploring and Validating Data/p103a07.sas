***********************************************************;
*  Activity 3.07                                          *;
*    1) Modify the OUT= option in the PROC SORT statement *;
*       to create a temporary table named STORM_SORT.     *;
*    2) Complete the WHERE and BY statements to answer    *;
*       the following question: Which storm in the North  *;
*       Atlantic basin (NA or na) had the strongest       *;
*       MaxWindMPH?                                       *;
***********************************************************;

libname PG1 base "~/EPG194/data";

proc sort data=pg1.storm_summary out=storm_sort;
	where Basin = 'NA' or Basin = 'na';
	by descending MaxWindMPH;
run;
