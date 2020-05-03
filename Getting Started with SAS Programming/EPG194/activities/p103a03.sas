***********************************************************;
*  Activity 3.03                                          *;
*    1) Uncomment each WHERE statement one at a time and  *;
*       run the step to observe the rows that are         *;
*       included in the results.                          *;
*    2) Comment all previous WHERE statements. Add a new  *;
*       WHERE statement to print storms that begin with   *;
*       Z. How many storms are included in the results?   *;
***********************************************************;

libname PG1 base "~/EPG194/data";

proc print data=pg1.storm_summary(obs=50);
	*where MinPressure is missing; /*same as MinPressure = .*/
	*where Type is not missing; /*same as Type ne " "*/
	*where MaxWindMPH between 150 and 155;
	*where Basin like "_I";
	where Name like "Z%";
run;
